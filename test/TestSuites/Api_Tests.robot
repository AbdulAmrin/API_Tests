*** Settings ***
Library    Collections
Library   String
Library   JSONLibrary
Library   OperatingSystem
Library    RequestsLibrary
Resource  ../Configuration/Config.robot


*** Test Cases ***
Post Request
    Create Session  ${Alias_Name}     ${URL}
    &{dictionary}=    Create Dictionary   key1=value1  key2=value2
    ${response}=     Post Request  ${Alias_Name}  /post    json=${dictionary}
    Should Be Equal As Strings  ${response.status_code}  200
    ${Json_Response}=  To Json  ${response.content}
    Should Be Equal     ${Json_Response['json']}     ${dictionary}
    Log  ${Json_Response['data']}
    


Put Request
    Create Session  ${Alias_Name}     ${URL}
    &{dictionary}=    Create Dictionary   key1=value1  key2=value2
    ${response}=     Put Request  ${Alias_Name}  /put    json=${dictionary}
    Should Be Equal As Strings  ${response.status_code}  200
    ${Json_Response}=  To Json  ${response.content}
    Should Be Equal     ${Json_Response['json']}     ${dictionary}
    Log  ${Json_Response['data']}
    

Patch Request
    Create Session  ${Alias_Name}     ${URL}
    &{dictionary}=    Create Dictionary    key2=value3
    ${response}=     Patch Request  ${Alias_Name}  /patch    json=${dictionary}
    Should Be Equal As Strings  ${response.status_code}  200
    ${Json_Response}=  To Json  ${response.content}
    Should Be Equal     ${Json_Response['json']}     ${dictionary}
    Log  ${Json_Response['data']}
    

Get Request
    Create Session  ${Alias_Name}     ${URL}
    &{dictionary}=    Create Dictionary   key1=value1  key2=value2
    ${response}=     Get Request  ${Alias_Name}  /get    json=${dictionary}
    Should Be Equal As Strings  ${response.status_code}  200
    ${Json_Response}=  To Json  ${response.content}
    Log  ${Json_Response}
   
    
Delete Request
    Create Session  ${Alias_Name}     ${URL}
    &{dictionary}=    Create Dictionary   key1=value1  key2=value2
    ${response}=     Delete Request  ${Alias_Name}  /delete    json=${dictionary}
    Should Be Equal As Strings  ${response.status_code}  200
    ${Json_Response}=  To Json  ${response.content}
    Should Be Equal     ${Json_Response['json']}     ${dictionary}



