*** Settings ***
Library             Selenium2Library
Resource            resource.robot
Suite Setup         Open browser login page
Test Template       Login fail
Suite Teardown      Close browser

*** Test Cases ***

Password incorrect      tomsmith           Password!
Username notfound       tomholland         Password!

*** Keywords ***
Login fail
    [Arguments]     ${usename}      ${password}
    Type in username    ${usename}
    Type in password    ${password}
    Submit Login
    Error page      ${usename}
    [Teardown]      Go to login page



