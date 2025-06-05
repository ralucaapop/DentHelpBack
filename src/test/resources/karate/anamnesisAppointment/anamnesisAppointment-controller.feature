Feature: Test AnamnesisAppointment endpoints
  Background:
    * url 'http://localhost:8080'

  Scenario: Test POST /api/in/appointment/saveAppointmentAnamnesis
    Given path '/api/in/appointment/saveAppointmentAnamnesis'
    And request {"appointmentReason": "Routine checkup", "pregnancy": false, "recentMedication": "None", "currentSymptoms": "Headache", "currentMedication": "Ibuprofen", "appointmentId": 1 }
    When method POST
    Then status 200
    And match response.message == 'Appointment anamnesis saved with success'

  Scenario: Test GET /api/in/appointment/getAnamnesisAppointment/{appointmentId} - Valid ID
    Given path '/api/in/appointment/getAnamnesisAppointment/103'
    When method GET
    Then status 200
    And match response.message == 'AppointmentAnamnesis'


  Scenario: Test GET /api/in/appointment/getAnamnesisAppointment/{appointmentId} - Invalid ID
    Given path '/api/in/appointment/getAnamnesisAppointment/9999'
    When method GET
    Then status 200
    And match response.data == null
    And match response.message == 'AppointmentAnamnesis'