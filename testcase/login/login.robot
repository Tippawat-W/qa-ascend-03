*** Settings ***
Resource            ../resource/imports.robot
Suite Setup         Open browser login page
Suite Teardown      Close browser
Resource            ../resource/resource.robot


*** Test Cases ***
Scenario: Login Success
    [Documentation] Check Login and Welcome page
    Given User go to login with  ${Valid_User}  ${Valid_Pass}
    When Click submit for login
    Then Header should see result success page
    And Click button for logout
    And Header should see result logout page

Scenario: Login Fail Password Incorrect
    [Documentation] Check Login and Header Login Fail by Password Incorrect
    Given User go to login with    ${Valid_User}  ${Incorrect_Pass}
    When Click submit for login
    Then Header should see result error page      ${Valid_User}

Scenario: Login Fail Username Incorrect
    [Documentation] Check Login and Header Login Fail by Username Incorrect
    Given User go to login with    ${Incorrect_User}  ${Incorrect_Pass}
    When Click submit for login
    Then Header should see result error page     ${Incorrect_User}
