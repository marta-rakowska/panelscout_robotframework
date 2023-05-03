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
${PAGEHEADER}    xpath=//*/form/div[1]/div/span
${ADDPLAYERBUTTON}    xpath=//*[text()='Add player']

*** Test Cases ***
Go to add player form
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Add Player Button
    Assert Add Player Form
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
Click On Add Player Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    xpath=//*[text()='Add player']
Assert Add Player Form
    Wait Until Element Is Visible    ${PAGEHEADER}
    Title Should Be    Add player
    Capture Page Screenshot    alert.png

