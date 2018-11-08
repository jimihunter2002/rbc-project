*** Settings ***
Documentation  As a pet store user I want to see my current pets so that I can view all my pets in one page.

Resource  ../Resources/pet_app.robot
Resource  ../Resources/common.robot
#Resource  ../Resources/pet_creation_form
Library  SeleniumLibrary
Library  ../Resources/MyLibrary.py
Resource  ../Resources/DataManager.robot
Library  DateTime


Suite Setup  Insert Test Data
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Clean Up Console

*** Variables ***
${BROWSER} =  Chrome
${BASE_URL} =  http://localhost:3000
${CSV_FILE_PATH} =  Data/pets.csv


*** Test Cases ***

Test case 1
    [Documentation]  User should be able to view pet Name and Status
    [Tags]  NameStatus-US02
    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    And list of pets displayed in a table  List of Pets
    Then pet name displayed  Pluto
    Then pet status displayed  Sold

Test case 2
    [Documentation]  Add 100 pets to pet store
    [Tags]  PetCreate-US02
    ${petCreateData} =  DataManager.Get CSV Data  ${CSV_FILE_PATH}
    Given the user has accessed the webapp
    When the page is rendered on the user's browser
    And many pets are created  ${petCreateData}

Test case 3
    [Documentation]  Load time for a pet store with over 100 pets less than 2s
    [Tags]  Perf-US02
    Given the user has accessed the webapp
    ${start_time}=  get time
    log  ${start_time}
    When the page is rendered on the user's browser
    ${end_time}=  get time
    log  ${end_time}
    ${load_time}=  set variable  ${end_time}  ${start_time}
    log  ${load_time}

