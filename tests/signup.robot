*** Settings ***

Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource



*** Test Cases ***
Deve poder cadastrar um novo walker

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
        

    Start session
    Go to signup page
    Fill signup form  ${dog_walker} 
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session


Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required 

    Start session
    Go to signup page
    Submit signup form  
    
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um numero maior do que zero
    Alert should be    Informe um documento com foto(RG ou CNH)


    Finish session


Nao deve cadastrar se o cpf fr incorreto
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary
    ...    name=Tiago Costa    
    ...    email=tiagodv@gmail.com    
    ...    cpf=000000141aa
    ...    cep=29090660    
    ...    street=Rua Engenheiro Luiz Carlos Pereira    
    ...    district=Jardim Camburi    
    ...    city_uf=Vitória/ES    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg
        

    Start session
    Go to signup page
    Fill signup form  ${dog_walker} 
    Submit signup form
    Alert should be    CPF invalido
    Finish session
