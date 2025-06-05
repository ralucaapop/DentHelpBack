Feature: Test TreatmentSheetController endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test GET /api/in/treatment-sheet/get-treatment-sheet/{appointmentId}
    Given path '/api/in/treatment-sheet/get-treatment-sheet/112'
    When method GET
    Then status 200
    And match response.message == 'Get treatment sheet'
    And match response.data.appointmentId == 1



  Scenario: Test POST /api/in/treatment-sheet/save-treatment-sheet
    Given path '/api/in/treatment-sheet/save-treatment-sheet'
    And request {  "medication": "Ibuprofen",  "recommendations": "Rest",  "appointmentObservations": "No" "appointmentId": 1}
    When method POST
    Then status 200
    And match response.message == 'The treatment sheet was saved'

  Scenario: Test POST /api/in/treatment-sheet/save-treatment-sheet when already exists
    Given path '/api/in/treatment-sheet/save-treatment-sheet'
    And request {  "medication": "Ibuprofen",  "recommendations": "Rest", "appointmentObservations": "No swelling","appointmentId": 1}
    When method POST
    Then status 200
    And match response.message == 'There already exist a treatment sheet for this appointment'

  Scenario: Test PUT /api/in/treatment-sheet/update-sheet-treatment
    Given path '/api/in/treatment-sheet/update-sheet-treatment'
    And request {  "medication": "Paracetamol",  "recommendations": "Drink water",  "appointmentObservations": "Improved condition","appointmentId": 1}
    When method PUT
    Then status 200
    And match response.message == 'treatment sheet updated successfully'