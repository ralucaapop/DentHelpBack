Feature: Test Appointment endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test POST /api/admin/appointment/make-appointment
    Given path '/api/admin/appointment/make-appointment'
    And request {"patientCnp": "1234567890123", "appointmentReason": "Routine checkup", "date": "2023-10-01", "hour": "10:00","appointmentId": 1  }
    When method POST
    Then status 200
    And match response.message == 'Appointment saved successfully'

  Scenario: Test GET /api/admin/appointment/get-appointments
    Given path '/api/admin/appointment/get-appointments'
    When method GET
    Then status 200
    And match response.message == 'Appointments list'

  Scenario: Test PUT /api/admin/appointment/modify-appointment/{appointment_id}
    Given path '/api/admin/appointment/modify-appointment/103'
    And request {"appointmentReason": "Updated reason", "date": "2023-10-02", "hour": "11:00"}
    When method PUT
    Then status 200
    And match response.message == 'Appointment modified successfully'

  Scenario: Test DELETE /api/admin/appointment/delete-appointment/{appointment_id}
    Given path '/api/admin/appointment/delete-appointment/103'
    When method DELETE
    Then status 200
    And match response.message == 'Appointment deleted'