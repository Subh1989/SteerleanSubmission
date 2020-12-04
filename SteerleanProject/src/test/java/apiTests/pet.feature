@Pet
Feature: Add a new pet and place an order for the same

Background:
	* def addPayload = read('classpath:src/test/resources/addPetPayload.json')
	* def global = read('classpath:src/test/resources/global.json')
	* header Content-Type = 'application/json'

@AddPet
Scenario: Add a new pet to the store
	Given url global.URI + global.petResource
  	When json payload = addPayload[1]
 	And request payload
 	When method POST
 	Then status 200
 	And print response
 	* def petID = response.id
		
Scenario: Update an existing pet
	Given url global.URI + global.petResource
  	When json payload = addPayload[2]
 	And request payload
 	When method PUT
 	Then status 200	
	And match response.name == "doggie9988"

@GetPets	
Scenario: Find Pets by status	
	Given url global.URI + global.petResource + '/findByStatus'
	And param status = "available"
 	When method GET
 	Then status 200	
 	* def ID = response[66].id
 	And print ID
 	

Scenario: Updates a pet in the store with form data	
	Given url global.URI + global.petResource + '/' + addPayload[1].id
	And form field name = "ABCD998"
	And form field status = "sold"
	And header Content-Type = 'application/x-www-form-urlencoded' 
 	When method POST
 	Then status 200	
	And match response.code == 200
	
Scenario: Deletes a pet
	Given url global.URI + global.petResource + '/' + addPayload[1].id
 	When method DELETE
 	Then status 200	
 	And match response.code == 200

	
	
	
	
