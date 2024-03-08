Feature: salutation mock server

  Background:
    * configure cors = true
    * def responseHeaders = { 'Content-Type': 'application/json' }


  Scenario: pathMatches('/hello') && methodIs('get')
    * def isUniverse = requestParams['isUniverse'] != null ? requestParams['isUniverse'][0].toLowerCase() === "true" : false
    * set response
      | path       | value                                         |
      | salutation | isUniverse ? "Hello Universe" : "Hello World" |