*** Settings ***
Resource            ../../../resource/imports.robot
Resource            susccess_login_page.robot

*** Variables ***

${text_username}=      name=username
${text_password}=     name=password
${button_login}=     //*[@id="login"]/button
${Header}=          //*[@id="flash"]


*** Keywords ***

Input username
    [Documentation]     Check text box status enable and input username on field
    [Arguments]     ${username}
    element should be enabled       ${text_username}
    input text      ${text_username}      ${username}

Input password
    [Documentation]     Check text box status enable and input password on field
    [Arguments]     ${password}
    element should be enabled       ${text_password}
    input text      ${text_password}     ${password}

Click submit for login
    [Documentation]     Click button for login
    click element       ${button_login}

Header should see result logout page
    [Documentation]     Check header logout success
    element text should be       ${Header}        You logged out of the secure area!\n×

Header should see result error page
    [Documentation]     Check header login failed
    [Arguments]     ${username}
    ${PASS}=   Run Keyword And Ignore Error       Should Be Equal     ${username}       ${Valid_User}
    run keyword if  ${PASS}=="TRUE"     element text should be     ${Header}        Your password is invalid!\n×
    run keyword if  ${PASS}=="FAIL"     element text should be     ${Header}        Your username is invalid!\n×