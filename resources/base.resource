*** Settings ***

Documentation    Arquivo principal do projeto do

Library    Browser 
Library    Screenshot

Resource    actions/signup.resource

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=false    
    New Page    https://walkdog.vercel.app/

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo    
    ...    visible    5

Finish session
    Take Screenshot    fullPage=true