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
${SIGNOUTBUTTON}    xpath=//*[(text()= 'Sign out')]
${SCOUTSPANELLOGINPAGE}    xpath=//*[@id="__next"]/form/div/div[1]/h5


*** Test Cases ***
Log out of the system
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Sign Out Button
    Assert Login Page
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
    Click Element   ${SIGNINBUTTON}
Click On Sign out Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element   ${SIGNOUTBUTTON}
Assert Login Page
    Wait Until Element Is Visible    ${SCOUTSPANELLOGINPAGE}
    title should be    Scouts panel - sign in
    Capture Page Screenshot    alert.png