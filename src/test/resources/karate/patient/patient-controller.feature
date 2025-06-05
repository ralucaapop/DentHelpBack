Feature: Test PatientController endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test GET /api/admin/patient/get-patients
    Given path '/api/admin/patient/get-patients'
    When method GET
    Then status 200
    And match response.message == 'Patients list'

  Scenario: Test GET /api/admin/patient/get-patient-persoanl-data/{patientCnp}
    Given path '/api/admin/patient/get-patient-persoanl-data/1234567890123'
    When method GET
    Then status 200
    And match response.data.cnp == '1234567890123'

  Scenario: Test POST /api/admin/patient/addPatient
    Given path '/api/admin/patient/addPatient'
    And request {"firstName": "John", "lastName": "Doe", "email": "jon.doe@example.com", "cnp": "1934567890123" }
    When method POST
    Then status 200
    And match response.message == 'New patient added'

  Scenario: Test PUT /api/admin/patient/update-patient-information/{cnp}
    Given path '/api/admin/patient/update-patient-information/1234567890123'
    And request {"firstName": "John", "lastName": "Smith", "email": "john.smith@example.com" }
    When method PUT
    Then status 200
    And match response.message == 'Edit done'

  Scenario: Test PUT /api/admin/patient/change-radiologist-to-patient/{cnp}
    Given path '/api/admin/patient/change-radiologist-to-patient/1234567890123'
    When method PUT
    Then status 200
    And match response.message == 'Edit done'

  Scenario: Test GET /api/admin/patient/get-kids/{cnpParent}
    Given path '/api/admin/patient/get-kids/1234567890123'
    When method GET
    Then status 200
    And match response.message == 'getting kids'

  Scenario: Test PUT /api/admin/patient/change/kid-to-patient/{cnpKid}/{emailKid}
    Given path '/api/admin/patient/change/kid-to-patient/1234567890123/john.kid@example.com'
    When method PUT
    Then status 200
    And match response.message == 'Kid Account migrated successfully'