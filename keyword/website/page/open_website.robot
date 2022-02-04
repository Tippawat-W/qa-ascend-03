*** Settings ***
Resource           ../../resource/imports.robot
Variables          ../../resource/common_configs.yaml

*** Test Cases ***
Open wesite
    Open Browser    ${base_url.herokuapp}     ${browser.chrome}

*** Keywords ***

