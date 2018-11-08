*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Begin Web Test
    Open Browser  about:blank  ${BROWSER}

End Web Test
    Close Browser

Insert Test Data
    Log  I am setting up test data

Clean Up Console
    Log  I am cleaning up
