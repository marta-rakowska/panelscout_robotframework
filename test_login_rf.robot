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

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
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
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    title should be    Scouts panel
    Capture Page Screenshot    alert.png


