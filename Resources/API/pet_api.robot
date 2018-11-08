*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  SeleniumLibrary


*** Variables ***

*** Keywords ***
check pet is created
    [Arguments]  ${petId}  ${petName}  ${petStatus}
    #create the session
    create session  api_session  http://localhost:3000/api
    &{data}=  create dictionary  id=${petId}  name=${petName}  status=${petStatus}
    &{headers}=  create dictionary  content-type=application/json
    ${response} =  Post Request  api_session  /pets  json=${data}  headers=&{headers}


    #check response status code
    should be equal as integers  ${response.status_code}  201

    #verify the response header content type
    &{dictData} =   convert to dictionary  ${response.headers}
    ${respContent} =   get from dictionary  ${dictData}  Content-Type
    should contain   ${respContent}  application/json

    #verify the response data
    &{dict_data} =  convert to dictionary  ${response.json()}
    dictionary should contain key  ${dict_data}  id
    should be equal as integers  ${dict_data['id']}  ${petId}

pet is created without body
    create session  api_session  http://localhost:3000/api
    &{data}=  create dictionary
    &{headers}=  create dictionary  content-type=application/json

    #make request and store response
    ${response} =  Post Request  api_session  /pets  json=${data}  headers=&{headers}

    #check response status code
    should be equal as integers  ${response.status_code}  201

    &{dict_data} =  convert to dictionary  ${response.json()}
    dictionary should contain key  ${dict_data}  id

pet created with invalid type
    create session  api_session  http://localhost:3000/api
    &{data}=  create dictionary
    &{headers}=  create dictionary  content-type=text/plain

    #make request and store response
    ${response} =  Post Request  api_session  /pets  dict=${data}  headers=&{headers}

    #check response status code 400, returns 201
    should be equal as integers  ${response.status_code}  400

update a pet information by valid id
    [Arguments]  ${petId}  ${petName}  ${petStatus}
    create session  api_session  http://localhost:3000/api
    &{data}=  create dictionary  name=${petName}  status=${petStatus}
    &{headers}=  create dictionary  content-type=application/x-www-form-urlencoded

    ${response} =  Put Request  api_session  /pets/${petId}  data=${data}  headers=&{headers}

    #check response status code 200
    should be equal as integers  ${response.status_code}  200

    #data validation
    &{dictData} =   convert to dictionary  ${response.headers}
    ${respContent} =   get from dictionary  ${dictData}  Content-Type
    should contain   ${respContent}  application/json

    #verify the response data
    &{dict_data} =  convert to dictionary  ${response.json()}
    should be equal as integers  ${dict_data['id']}  ${petId}
    should be equal as strings  ${dict_data['name']}  ${petName}
    should be equal as strings  ${dict_data['status']}  ${petStatus}

get pet list in the system
    create session  api_session  http://localhost:3000/api
    ${response} =  Get Request  api_session  /pets

    #check response status code 200
    should be equal as integers  ${response.status_code}  200

    #data validation
    &{dictData} =   convert to dictionary  ${response.headers}
    ${respContent} =   get from dictionary  ${dictData}  Content-Type
    should contain   ${respContent}  application/json

    ${list_data} =  convert to list  ${response.json()}
    list should contain value  ${list_data}[0]  {'id': 1, 'name': 'Pluto', 'status': 'Sold'}

get a pet using the petId
    [Arguments]  ${petId}
    create session  api_session  http://localhost:3000/api
    ${response} =  Get Request  api_session  /pets/${petId}
    &{data}=  create dictionary  id=${1}  name=Pluto  status=Sold

    #check response status code 200
    should be equal as integers  ${response.status_code}  200

    ${list_data} =  convert to dictionary  ${response.json()}
    dictionaries should be equal   ${list_data}  ${data}

delete a pet using petId
    [Arguments]  ${petId}
    create session  api_session  http://localhost:3000/api
    ${response} =  Delete Request  api_session  /pets/${petId}

    #check response status code 200
    should be equal as integers  ${response.status_code}  200

    &{dictData} =   convert to dictionary  ${response.headers}
    ${respContent} =   get from dictionary  ${dictData}  Content-Type
    should contain   ${respContent}  application/json