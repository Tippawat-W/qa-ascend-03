*** Settings ***
Resource            ../../../resource/imports.robot
Resource            ../page/login_page.robot

*** Keywords ***
User go to login with
    [Documentation]     Check text box status enable and input text on field
    [Arguments]     ${username}      ${password}
    Input username      ${username}
    Input password      ${password}