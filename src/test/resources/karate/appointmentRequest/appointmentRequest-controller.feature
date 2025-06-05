Feature: Test AppointmentRequest endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test POST /api/in/appointment_request/add_appointment_request
    Given path '/api/in/appointment_request/add_appointment_request'
    And request {"appointmentReason": "Routine checkup", "desiredAppointmentTime": "2023-10-01T10:00:00", "cnp": "1234567890123", "appointmentRequestId": 1, "requestDate": "2023-09-30" }
    When method POST
    Then status 200
    And match response.message == 'Appointment request saved with success'

  Scenario: Test GET /api/in/appointment_request/get_patient_requests/{patientCnp}
    Given path '/api/in/appointment_request/get_patient_requests/11111111111111'
    When method GET
    Then status 200
    And match response.message == 'Appointment requests get successfully'

  Scenario: Test DELETE /api/in/appointment_request/delete_request/{requestId}
    Given path '/api/in/appointment_request/delete_request/52'
    When method DELETE
    Then status 200
    And match response.message == 'Appointment request deleted successfully'

  Scenario: Test PUT /api/in/appointment_request/update_request/{reqursId}
    Given path '/api/in/appointment_request/update_request/51'
    And request { "appointmentReason": "Updated reason", "desiredAppointmentTime": "2023-10-02T11:00:00", "cnp": "1234567890123", "appointmentRequestId": 1, "requestDate": "2023-09-30" }
    When method PUT
    Then status 200
    And match response.message == 'Appointment request successfully updated'
