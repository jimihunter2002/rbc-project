*** Settings ***
Documentation  These are the pet API tests
Resource  ../Resources/API/pet_api.robot

*** Variables ***

#robot -d results/api -L DEBUG tests/api.robot


*** Test Cases ***
Create a pet using POST request
    [Tags]  AddPet
    check pet is created  7  dolly  sold
    #Check status code

Create a pet with no request body
    [Tags]  Nobody
    pet is created without body

Create a pet with invalid content-type
    [Tags]  ContentType
    pet created with invalid type

Update a pet with valid petId
    [Tags]  UpdateId
    update a pet information by valid id  7  holly  molly

Get the list of Pets
    [Tags]  PetList
    get pet list in the system

Get a specific pet by petId
    [Tags]  GetPetById
    get a pet using the petId  1

Delete a specific pet by petId
    [Tags]  DelPetById
    #[Arguments]  ${petId}
    delete a pet using petId  9