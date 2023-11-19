*** Settings ***

Documentation    Suite de testes de cadastro de dog walker

Library    Browser


*** Test Cases ***
Deve poder cadastrar um novo walker

    ${name}             Set Variable    Tiago Costa
    ${email}            Set Variable    tiagodv@gmail.com
    ${cpf}              Set Variable    00000014141
    ${cep}              Set Variable    29090660
    ${addressStreet}    Set Variable    Rua Engenheiro Luiz Carlos Pereira
    ${addressDistrict}  Set Variable    Jardim Camburi
    ${addressCityUf}    Set Variable    Vitória/ES
    ${addressNumber}    Set Variable    1000
    ${addressDetails}   Set Variable    Apto 28
    ${cnh}              Set Variable    toretto.jpg

    ${dog_walker}    Create Dictionary
    ...    name=Tiago Costa    
    ...    email=tiagodv@gmail.com    
    ...    cpf=00000014141
    ...    cep=29090660    
    ...    street=Rua Engenheiro Luiz Carlos Pereira    
    ...    district=Jardim Camburi    
    ...    city_uf=Vitória/ES    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg
        


    Go to signup page
    Fill signup form  ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}    ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh} 
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

*** Keywords ***
   
Go to signup page
    New Browser    browser=chromium    headless=False
    New Page       https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal    Faça seu cadastro


Fill signup form
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}    ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh} 
    Fill Text    css=input[name=name]             ${name}    
    Fill Text    css=input[name=email]            ${email}    
    Fill Text    css=input[name=cpf]              ${cpf}    
    Fill Text    css=input[name=cep]              ${cep}

    Click        css=input[type=button][value$=CEP]

    Get Property      css=input[name=addressStreet]    value    equal    ${addressStreet}
    Get Property      css=input[name=addressDistrict]  value    equal    ${addressDistrict}
    Get Property      css=input[name=addressCityUf]    value    equal    ${addressCityUf}
    

    Fill Text    css=input[name=addressNumber]    ${addressNumber}    
    Fill Text    css=input[name=addressDetails]   ${addressDetails}    
  
    Upload File By Selector    css=input[type=file]    ${EXECDIR}/${cnh}


Submit signup form
    Click    css=.button-register

    
Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text                   css=.swal2-html-container    equal      Recebemos o seu cadastro e em breve retornaremos o contato.

    #Sleep    1