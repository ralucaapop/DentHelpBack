Feature: Test GeneralAnamnesis endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test POST /api/in/general-anamnesis/add-general-anamnesis-patient
    Given path '/api/in/general-anamnesis/add-general-anamnesis-patient'
    And request { "generalSymptoms": "Fatigue, headache", "recentHospitalizations": "None",  "chronicDiseases": "Diabetes", "currentMedication": "Metformin", "patientId": 1234567890123  }
    When method POST
    Then status 200
    And match response.message == 'General anamnesis saved with success'

  Scenario: Test GET /api/in/general-anamnesis/get-general-anamnesis/{cnpPatient}
    Given path '/api/in/general-anamnesis/get-general-anamnesis/1234567890123'
    When method GET
    Then status 200
    And match response.message == 'Get general anamnesis succesfull'

