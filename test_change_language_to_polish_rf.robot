*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGEHEADER}    xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${POLSKIBUTTON}    xpath=//*[(text()='Polski')]

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click on the Submit Button
    Click on the Polski Button
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
Click on the Polski Button
    Wait Until Element Is Visible    ${PAGEHEADER}
    Click Element    xpath=//*[(text()='Polski')]
    Capture Page Screenshot    alert.png