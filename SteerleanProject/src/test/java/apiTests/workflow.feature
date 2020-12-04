@Workflow
Feature: Workflow tests

Background:
	* def addPayload = read('classpath:src/test/resources/addPetPayload.json')
	* def global = read('classpath:src/test/resources/global.json')
	* header Content-Type = 'application/json'


Scenario: Add a new pet and place an order for the same

* def newPet = call read('pet.feature@AddPet')
* print newPet.petID
* def newPetID = newPet.petID

* def placePetFirst = call read('store.feature@PlaceOrder') {petId: '#(newPetID)'}
* print placePetFirst.pID
* def placePetIDFirst = placePetFirst.pID

And match placePetIDFirst == newPetID


Scenario: Find an available pet and place an order for the same

* def getPet = call read('pet.feature@GetPets')
* print getPet.ID
* def getPetID = getPet.ID

* def placePetSecond = call read('store.feature@PlaceOrder') {petId: '#(getPetID)'}
* print placePetSecond.pID
* def placePetIDSecond = placePetSecond.pID

And match placePetIDSecond == getPetID
