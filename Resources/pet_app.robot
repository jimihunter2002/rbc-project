*** Settings ***
Resource  ./PO/pet_landing_page.robot
Resource  ./PO/pet_creation_form.robot
Library   ./MyLibrary.py

*** Variables ***


*** Keywords ***

the user has accessed the webapp
    pet_landing_page.Load

the page is rendered on the user's browser
    pet_landing_page.Verify Page Loaded

user fills pet creation form
    [Arguments]  ${NAME}  ${STATUS}
    pet_creation_form.Enter Name And Status  ${NAME}  ${STATUS}

user adds a new pet by button
    pet_creation_form.Create Pet By Button

user creates pet by pressing enter key
    pet_creation_form.Create Pet By Enter Key

"Pet Name" and "Pet Status" are required
    pet_creation_form.Verify Input Fields

pet is created successfully
    [Arguments]  ${EXPECTED}
    pet_creation_form.Verify Pet Created Successfully  ${EXPECTED}

the user focus on a field
    [Arguments]  ${FIELD}
    pet_creation_form.Focus On Field  ${FIELD}

focus should be on the field
    [Arguments]  ${FIELD}
    pet_creation_form.Verify Field Has Focus  ${FIELD}

user press the tab key
    [Arguments]  ${FIELD}
    pet_creation_form.Press Tab Key  ${FIELD}


the user has pressed the keys
    [Arguments]  ${Key1}  ${Key2}  ${LOCATOR}
    #pet_creation_form.Press Shift + Tab Key  ${FIELD}
    pet_creation_form.Press Key Combination  ${Key1}  ${Key2}  ${LOCATOR}

list of pets displayed in a table
    [Arguments]  ${EXPECTED_TEXT}
    pet_creation_form.Verify Table Displayed Successfully  ${EXPECTED_TEXT}

pet name displayed
    [Arguments]  ${PetName}
    pet_creation_form.Verify Pet Created Successfully  ${PetName}

pet status displayed
    [Arguments]  ${PetStatus}
    pet_creation_form.Verify Pet Created Successfully  ${PetStatus}

many pets are created
    [Arguments]  ${PET_CREATION_DATA}
    :FOR  ${NameStatusRow}  IN  @{PET_CREATION_DATA}
    \  user fills pet creation form  ${NameStatusRow[0]}  ${NameStatusRow[1]}
    \  user adds a new pet by button
