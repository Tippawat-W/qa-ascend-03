*** Settings ***
Library             Selenium2Library
Variables           ../data/variant.yaml

*** Keywords ***
Open browser login page
    open browser    ${base_url}     ${browser}
    title should be     The Internet

Go to login page
    go to   ${base_url}
    title should be     The Internet

Use go to login with
    [Arguments]     ${usename}      ${password}
    element should be enabled       name=username
    input text      name=username      ${usename}
    element should be enabled       name=password
    input text      name=password     ${password}

Click submit for login
    click element       //*[@id="login"]/button

Header should see result success page
    element text should be      //*[@id="flash"]        You logged into a secure area!\n×

Click button for logout
    click element       xpath://html/body/div[2]/div/div/a/i

Header should see result logout page
    element text should be       //*[@id="flash"]        You logged out of the secure area!\n×


Header should see result error page
    [Arguments]     ${usename}
    ${PASS}=   Run Keyword And Ignore Error       Should Be Equal     ${usename}       ${Valid_User}
    run keyword if  ${PASS}=="TRUE"     element text should be     //*[@id="flash"]        Your password is invalid!\n×
    run keyword if  ${PASS}=="FAIL"     element text should be     //*[@id="flash"]        Your username is invalid!\n×