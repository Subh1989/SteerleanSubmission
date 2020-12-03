@Workflow
Feature: Workflow test

Background:
	* def addPayload = read('classpath:src/test/resources/AddPetPayload.json')
	* def global = read('classpath:src/test/resources/global.json')
	* header Content-Type = 'application/json'

Scenario: Add a new pet and place an order for the same

* def newPet = call read('pet.feature@AddPet')
* print newPet.petID
* def newPetID = newPet.petID

Given url global.URI + global.storeResource
When json payload = {"id": 6,"petId": '#(newPetID)',"quantity": 3,"shipDate": "2020-11-12T16:39:33.456Z","status": "placed","complete": true}
And request payload
When method POST
Then status 200	
And print response
And match response.petId == newPetID

Scenario: Find an available pet and place an order for the same

* def getPet = call read('pet.feature@GetPets')
* print getPet.ID
* def getPetID = getPet.ID

Given url global.URI + global.storeResource
When json payload = {"id": 6,"petId": '#(getPetID)',"quantity": 3,"shipDate": "2020-11-12T16:39:33.456Z","status": "placed","complete": true}
And request payload
When method POST
Then status 200	
And match response.petId == getPetID