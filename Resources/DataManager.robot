*** Settings ***
Documentation  use this layer as to get data from external file
Library  MyCsvLib.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${data} =  read csv file  ${FilePath}
    [Return]  ${data}