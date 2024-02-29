*** Settings ***
Documentation        Suite de testes de cadastro de log dog walker

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder casdastrar um novo dog walker
    [Tags]    smoke

    ${dog_walker}        Create Dictionary    
    ...    name=Diego lima    
    ...    email=diegolima@getnada.com    
    ...    cpf=15986303504    
    ...    cep=01310910    
    ...    street=Avenida Paulista    
    ...    district=Bela Vista    
    ...    cityUf=São Paulo/SP    
    ...    number=666    
    ...    details=Casa    
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve poder casdastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Go to signup page
    #Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv

    ${dog_walker}        Create Dictionary    
    ...    name=Paulo Fernandes    
    ...    email=paulofernandes@getnada.com    
    ...    cpf=7726934638v    
    ...    cep=01310910    
    ...    street=Avenida Paulista    
    ...    district=Bela Vista    
    ...    cityUf=São Paulo/SP    
    ...    number=112   
    ...    details=AP    
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert Should Be    CPF inválido

Deve poder casdastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary    
    ...    name=Neire Fernandes    
    ...    email=neirefernandes@getnada.com    
    ...    cpf=48583268290    
    ...    cep=01310910    
    ...    street=Avenida Paulista    
    ...    district=Bela Vista    
    ...    cityUf=São Paulo/SP    
    ...    number=99    
    ...    details=Casa 02   
    ...    cnh=toretto.jpg    

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder casdastrar um novo dog walker que sabe adestrar de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary    
    ...    name=Felipe Justo    
    ...    email=felipejusto@getnada.com    
    ...    cpf=34754150627    
    ...    cep=01310910    
    ...    street=Avenida Paulista    
    ...    district=Bela Vista    
    ...    cityUf=São Paulo/SP    
    ...    number=51    
    ...    details=Fundo   
    ...    cnh=toretto.jpg    

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar   
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.