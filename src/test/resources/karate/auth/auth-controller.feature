Feature: Teste pentru AuthController

  Background:
    * url 'http://localhost:8080/api/auth'
    * def loginPayload = { email: 'popraluca385@gmail.com', password: '1a' }
    * def registerKidPayload = { firstName: 'TestKid', lastName: 'UserLid', cnp: '1911110022333', parent: '1233445566771' }

  Scenario: Login utilizator
    Given path 'login'
    And request loginPayload
    When method post
    Then status 200
    And match response.token != null

  Scenario: Register kid
    Given path 'register/kid'
    And request registerKidPayload
    When method post
    Then status 200
    And match response.message == 'Kid saved'


