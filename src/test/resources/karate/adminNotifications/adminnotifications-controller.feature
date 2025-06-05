Feature: Teste pentru AdminNotificationsController

  Background:
    * url 'http://localhost:8080'

  # Login pacient
    * path 'api/auth/login'
    * request { email: 'raluca.pop03@e-uvt.ro', password: '123456789a' }
    * method post
    * status 200
    * def patientToken = 'Bearer ' + response.token
    * print 'TOKEN PACIENT:', patientToken

  # Login admin
    * path 'api/auth/login'
    * request { email: 'popraluca385@gmail.com', password: '1a' }
    * method post
    * status 200
    * def adminToken = 'Bearer ' + response.token
    * print 'TOKEN ADMIN:', adminToken

    * def notificationPayload = { title: 'Întârziere vizită', message: 'Pacientul este în întârziere.', date: '2025-06-05' }


  Scenario: Trimite notificare pentru întâlnire întârziată
    Given path 'api/in/notifications/admin/send_notification/late_appointment', 103
    And header Authorization = adminToken
    And request notificationPayload
    When method post
    Then status 200
    And match response.message == 'Late Appointment Notification added successfully'

  Scenario: Trimite notificare pentru anulare întâlnire
    Given path 'api/in/notifications/admin/send_notification/cancel_appointment', 104
    And header Authorization = adminToken
    And request notificationPayload
    When method post
    Then status 200
    And match response.message == 'Cancel Appointment Notification added successfully'

  Scenario: Marchează notificarea ca citită
    Given path 'api/in/notifications/admin/read_notification', 16
    And header Authorization = adminToken
    When method put
    Then status 200
    And match response.message == 'Mark notification as Read added successfully'

  Scenario: Șterge notificarea
    Given path 'api/in/notifications/admin/delete_notification', 15
    And header Authorization = adminToken
    When method delete
    Then status 200
    And match response.message == 'Notification deleted successfully'

  Scenario: Returnează toate notificările
    Given path 'api/in/notifications/admin/get_notifications'
    And header Authorization = adminToken
    When method get
    Then status 200
    And match response.message == 'Successfully getting all the notifications '
