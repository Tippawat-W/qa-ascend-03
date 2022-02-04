*** Settings ***
Library             Selenium2Library
Suite Setup         Open browser login page
Suite Teardown      Close browser
Resource            ../resource/resource.robot


*** Test Cases ***
Scenatio: Login Success
    Given Use go to login with  ${Valid_User}  ${Valid_Pass}
    When Click submit for login
    Then Header should see result success page
    And Click button for logout
    And Header should see result logout page

Scenatio: Login Fail Password Incorrect
    Given Use go to login with    ${Valid_User}  ${Incorrect_Pass}
    When Click submit for login
    Then Header should see result error page      ${Valid_User}

Scenatio: Login Fail Username Incorrect
    Given Use go to login with    ${Incorrect_User}  ${Incorrect_Pass}
    When Click submit for login
    Then Header should see result error page     ${Incorrect_User}
