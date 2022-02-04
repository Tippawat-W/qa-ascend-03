*** Settings ***
Resource            ../../resource/imports.robot
Resource            ../../keyword/website/page/open_website.robot
Resource            ../../keyword/website/feature/keyword_login.robot
Variables           ../../resource/testdata/test_data.yaml
Resource            ../../keyword/website/page/login_page.robot
Resource            ../../keyword/website/page/susccess_login_page.robot
Suite Setup         Open wesite
Suite Teardown      Close browser

*** Test Case ***
Scenario: Login Success
    [Documentation]     Check Login and Welcome page
    Given User go to login with     ${username.success}      ${password.success}
    When Click submit for login
    Then Header should see result success page
    And Click button for logout
    And Header should see result logout page

Scenario: Login Fail Password Incorrect
    [Documentation]     Check Login and Header Login Fail by Password Incorrect
    Given User go to login with    ${username.success}  ${password.invalid}
    When Click submit for login
    Then Header should see result error page      ${username.success}

Scenario: Login Fail Username Incorrect
    [Documentation]     Check Login and Header Login Fail by Username Incorrect
    Given User go to login with    ${username.invalid}  ${password.invalid}
    When Click submit for login
    Then Header should see result error page     ${password.invalid}
