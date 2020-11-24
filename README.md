# SteerleanSubmission

End-points & workflows tested:
~~~~
1. For PET:
 POST /pet - Add a new pet to the store
-> PUT /pet - Update an existing pet
-> GET /pet/findByStatus - Find Pets by status
-> POST /pet/{petId} - Updates a pet in the store with form data
-> DELETE /pet/{petId} - Deletes a pet

2. For Store:
-> POST /store/order - Place an order for a pet
-> GET /store/order/{orderId} - Find purchase order by ID
-> DELETE /store/order/{orderId} - Delete purchase order by ID

~~~~
Tech stack used:
Karate API Framework

Mechanism to execute the tests:
~~~~
1. Clone the Project from the below repository to your local machine
https://github.com/Subh1989/SteerleanSubmission.git

2. Now open command prompt and navigate to required project path

3. Perform "mvn clean" to clear the target directory into which Maven normally builds your project.

4. Peform "mvn compile" to compile the java source classes of the maven project.

5. Peform "mvn test" to run the scripts.
