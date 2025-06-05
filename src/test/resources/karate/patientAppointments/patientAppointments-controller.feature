Feature: Test PatientAppointments endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test GET /api/patient/appointments/get-patient-appointments
    Given path '/api/patient/appointments/get-patient-appointments'
    And request {"patientCnp": "1234567890123"}
    When method GET
    Then status 200
    And match response.message == 'Appointments list'

