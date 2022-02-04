*** Settings ***
Resource            ../../../resource/imports.robot

*** Variables ***

${button_logout}=     xpath://html/body/div[2]/div/div/a/i
${header}=     //*[@id="flash"]

*** Keywords ***

Header should see result success page
    [Documentation]     Check header login success
    element text should be      ${header}        You logged into a secure area!\n×

Click button for logout
    [Documentation]     Click button for logout
    click element       ${button_logout}