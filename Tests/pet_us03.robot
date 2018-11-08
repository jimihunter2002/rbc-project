*** Settings ***
Documentation  As a pet store user I want to be able to add a new pet so that I can add new pets to my collection
Resource  ../Resources/pet_app.robot
Resource  ../Resources/common.robot
#Resource  ../Resources/pet_creation_form
Library  SeleniumLibrary
Library  ../Resources/MyLibrary.py




Suite Setup  Insert Test Data
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Clean Up Console



#robot -d results tests/pet_us03.robot

*** Variables ***
${BROWSER} =  Chrome
${BASE_URL} =  http://localhost:3000



*** Test Cases ***
Test case 1
    #log  ${PetName}
    [Documentation]  User name and status fields are mandatory for creating new pet
    [Tags]  Validate-US03
    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    user fills pet creation form    ""  ""
    And user adds a new pet by button
    Then "Pet Name" and "Pet Status" are required

Test case 2
    [Documentation]  User should be able to create a pet
    [Tags]  Button-US03
    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    user fills pet creation form    holly molly  available
    And user adds a new pet by button
    Then pet is created successfully    holly molly

Test case 3

    [Documentation]  create a pet by pressing Enter Key
    [Tags]  EnterKey-US03
    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    user fills pet creation form    Nelly Rowland  Sold Out
    And user creates pet by pressing enter key
    Then pet is created successfully  Nelly Rowland

Test case 4
     #log  locator.PetName  level  DEBUG
    [Documentation]  accessiblity sequence of fields using tab key
    [Tags]  TabKey-US03

    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    And the user focus on a field  ${PET_NAME_FIELD}
    And user press the Tab key  ${PET_NAME_FIELD}
    Then focus should be on the field  ${PET_STATUS_FIELD}
    And user press the Tab key  ${PET_STATUS_FIELD}
    Then focus should be on the field  ${CREATE_BUTTON}

Test case 5
     #log  locator.PetName  level  DEBUG
    [Documentation]  accessiblity sequence of fields using shift + tab
    [Tags]  ShiftTab-US03

    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    And the user focus on a field  ${PET_STATUS_FIELD}
    And the user has pressed the keys  shift  tab  ${PET_STATUS_FIELD}
    Then focus should be on the field  ${PET_NAME_FIELD}