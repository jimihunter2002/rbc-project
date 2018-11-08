*** Settings ***
Library  SeleniumLibrary
Library  ../MyLibrary.py


*** Variables ***
${PET_NAME_FIELD} =  xpath=//form/div[1]/div[@class='input-group']/input[@type='text']
${PET_STATUS_FIELD} =  xpath=//form/div[2]/div[@class='input-group']/input[@type='text']
${CREATE_BUTTON} =  css=#btn-create
${ENTER_KEY_ASCII} =  \\13
${PET_LIST_TABLE} =  css=.pet-app .pet-list:nth-of-type(2) .card-block
${TAB_KEY} =  \\09
${SHIFT_KEY} =  \\15


*** Keywords ***

Enter Name And Status
    [Arguments]  ${NAME}  ${STATUS}
    input text  ${PET_NAME_FIELD}  ${NAME}
    input text  ${PET_STATUS_FIELD}  ${STATUS}

Create Pet By Button
    click button    ${CREATE_BUTTON}

Create Pet By Enter Key
    press key  ${CREATE_BUTTON}  ${ENTER_KEY_ASCII}

Verify Input Fields
    #${pet_name}  get text  ${PET_NAME_FIELD}
    #${pet_status}  get text  ${PET_STATUS_FIELD}

    element should not contain  ${PET_NAME_FIELD}   None
    element should not contain  ${PET_STATUS_FIELD}   None

Verify Pet Created Successfully
    [Arguments]  ${EXPECTED}
    table should contain  ${PET_LIST_TABLE}  ${EXPECTED}

Verify Table Displayed Successfully
    [Arguments]  ${EXPECTED_TEXT}
    Wait Until Page Contains  ${EXPECTED_TEXT}

Focus On Field
    [Arguments]  ${FIELD}
    set focus to element  ${FIELD}


Verify Field Has Focus
    [Arguments]  ${FIELD}
    element should be focused  ${FIELD}


Press Tab Key
    [Arguments]  ${FIELD}
    press key  ${FIELD}  ${TAB_KEY}

Press Key Combination
    [Arguments]  ${Key1}  ${Key2}  ${LOCATOR}
    send key combo  ${Key1}  ${Key2}  ${LOCATOR}
