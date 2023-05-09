*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGEHEADER}    xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${POLSKIBUTTON}    xpath=//*[(text()='Polski')]

*** Test Cases ***
Change language to Polish
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Polski Button
    [Teardown]    Close Browser


*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type In Email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type In Password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click On Submit Button
    Click Element   xpath=//*[(text()= 'Sign in')]
Click On Polski Button
    Wait Until Element Is Visible    ${PAGEHEADER}
    Click Element    xpath=//*[(text()='Polski')]
    Capture Page Screenshot    alert.png