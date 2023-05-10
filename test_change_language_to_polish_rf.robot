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
${ENGLISHBUTTON}    xpath=//*[(text()='English')]

*** Test Cases ***
Change language to Polish
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Polski Button
    Assert Polish Page
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
Assert Polish Page
    Wait Until Element Is Visible    ${ENGLISHBUTTON}
    Location Should Be    https://scouts-test.futbolkolektyw.pl/pl
    Capture Page Screenshot    alert.png
