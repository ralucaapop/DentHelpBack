Feature: Test ConfirmAppointment endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test GET /api/admin/confirm-appointments/get-appointments-request
    Given path '/api/admin/confirm-appointments/get-appointments-request'
    When method GET
    Then status 200
    And match response.message == 'Get Appointments successfully'

  Scenario: Test POST /api/admin/confirm-appointments/save-appointments
    Given path '/api/admin/confirm-appointments/save-appointments'
    And request {  "appointmentId": 105, "confirmationDate": "2023-10-01"}
    When method POST
    Then status 200
    And match response.message == 'Appointment saved'

  Scenario: Test POST /api/admin/confirm-appointments/rejectAppointment
    Given path '/api/admin/confirm-appointments/rejectAppointment'
    And request { "appointmentRequestId": 1, "rejectionReason": "Invalid request" }
    When method POST
    Then status 200
    And match response.message == 'The request was rejected successfully'