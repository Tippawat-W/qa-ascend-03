*** Settings ***
Resource            ../../../resource/imports.robot
Variables          ../../../resource/common_configs.yaml

*** Keywords ***
Open wesite
    [Documentation]     Open website and check welcome page show
    Open Browser    ${base_url.herokuapp}     ${browser.chrome}
    title should be     The Internet
