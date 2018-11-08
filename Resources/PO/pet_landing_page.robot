*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${URL} =  http://localhost:3000

*** Keywords ***
Load
    Go To  ${BASE_URL}

Verify Page Loaded
    Wait Until Page Contains  Petstore webapp