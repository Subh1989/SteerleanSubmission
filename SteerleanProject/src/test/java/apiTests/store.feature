@Store
Feature: Find an available pet and place an order for the same

Background:
	* def addPayload = read('classpath:src/test/resources/addPetPayload.json')
	* def global = read('classpath:src/test/resources/global.json')
	* headers {Content-Type : 'application/json', Accept : 'application/json'}

@PlaceOrder
Scenario: Place an order for a pet
	Given url global.URI + global.storeResource
  	When json payload = addPayload[0]
 	And request payload
 	When method POST
 	Then status 200	
 	And print response
	* def pID = response.id
		
Scenario: Find purchase order by ID
	Given url global.URI + global.storeResource + '/' + addPayload[0].id
 	When method GET
 	Then status 200	
	And match response.status == "placed"
	
Scenario: Delete purchase order by ID
	Given url global.URI + global.storeResource + '/' + addPayload[0].id
 	When method DELETE
 	Then status 200	
	And match response.code == 200

	
