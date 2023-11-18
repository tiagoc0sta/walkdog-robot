*** Settings ***

Documentation    Suite de testes de cadastro de dog walker

Library    Browser


*** Test Cases ***
Deve poder cadastrar um novo walker

    # Tiago Costa
    # tiagodv@gmail.com
    # 00000014141
    # 29090660
    # 10
    # Casa

    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

    Sleep    10