Feature: Test ToothInterventionController endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test GET /api/in/teeth/get_patient_tooth_history/{cnp}/{toothNumber}
    Given path 'api/in/teeth/get_patient_tooth_history/1234567890123/1'
    When method GET
    Then status 200
    And match response.message == 'Interventions extracted successfully'

  Scenario: Test GET /api/in/teeth/get_patient_all_tooth_history/{cnp}
    Given path 'api/in/teeth/get_patient_all_tooth_history/1234567890123'
    When method GET
    Then status 200
    And match response.message == 'Interventions extracted successfully'

  Scenario: Test GET /api/in/teeth/get_patient_all_extracted_tooth/{cnp}
    Given path 'api/in/teeth/get_patient_all_extracted_tooth/1234567890123'
    When method GET
    Then status 200
    And match response.message == 'Interventions extracted successfully'

  Scenario: Test POST /api/in/teeth/addNewIntervention
    Given path 'api/in/teeth/addNewIntervention'
    And request {  "cnp": "1234567890123",  "toothNumber": 1,  "interventionType": "Filling","isExtracted": false}
    When method POST
    Then status 200
    And match response.message == 'New Intervention added successfully'

  Scenario: Test DELETE /api/in/teeth/deleteIntervention/{interventionId}
    Given path 'api/in/teeth/deleteIntervention/49'
    When method DELETE
    Then status 200
    And match response.message == 'Intervention deleted succesfully'

  Scenario: Test DELETE /api/in/teeth/deleteExtraction/{cnp}/{toothNumber}
    Given path 'api/in/teeth/deleteExtraction/1234567890123/1'
    When method DELETE
    Then status 200
    And match response.message == 'teeth extraction deleted successfully'