*** Settings ***
Library             Selenium2Library


*** Variables ***
${base_url}     http://the-internet.herokuapp.com/login
${browser}      chrome
${Valid_User}   tomsmith
${Valid_Pass}   SuperSecretPassword!


*** Keywords ***
Open browser login page
    open browser    ${base_url}     ${browser}
    title should be     The Internet

Go to login page
    go to   ${base_url}
    title should be     The Internet

Type in username
    [Arguments]     ${usename}
    element should be enabled       name=username
    input text      name=username      ${usename}

Valid username
    Type in username    ${Valid_User}

Type in password
    [Arguments]     ${password}
    element should be enabled       name=password
    input text      name=password     ${password}

Valid password
    Type in password    ${Valid_Pass}

Submit Login
    click element       //*[@id="login"]/button

Success page
    element text should be      //*[@id="content"]/div/h2        Secure Area

Error page
    [Arguments]     ${usename}
    ${ID}=     Set Variable    ${usename}
    ${T-ID}=   Set Variable    ${Valid_User}
    ${PASS}=   Run Keyword And Ignore Error       Should Be Equal     ${ID}       ${T-ID}
    run keyword if  ${PASS}=="TRUE"     element text should be     //*[@id="flash"]        Your password is invalid!\n×
    run keyword if  ${PASS}=="FAIL"     element text should be     //*[@id="flash"]        Your username is invalid!\n×