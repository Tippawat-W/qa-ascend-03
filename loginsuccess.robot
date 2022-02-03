*** Settings ***
Library             Selenium2Library
Suite Setup         Open browser login page
Suite Teardown      Close browser
Resource            resource.robot

*** Test Cases ***
Login Success
    Valid username
    Valid password
    Submit Login
    Success page
    Submit Logout
    Logout Success

