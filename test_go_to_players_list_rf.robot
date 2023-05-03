*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}    xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${PAGEHEADER}    xpath=//*/header/div/div[1]/div[2]/input
${PLAYERSLISTBUTTON}    xpath=//*[text()='Players']


*** Test Cases ***
Login go to players list
    Open Login Page
    Type In Email
    Type In Password
    Click on the Submit Button
    Click on the Players List Button
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click on the Submit Button
    Click Element   xpath=//*[(text()= 'Sign in')]
Click on the Players List Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${PLAYERSLISTBUTTON}
