*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description  #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${ADDPLAYERBUTTON}    xpath=//*[(text()='Add player')]
${PLAYEREMAILINPUT}    xpath=//*[@name='email']
${NAMEINPUT}    xpath=//*[@name='name']
${SURNAMEINPUT}    xpath=//*[@name='surname']
${PHONEINPUT}    xpath=//*[@name='phone']
${WEIGHTIPUT}    xpath=//*[@name='weight']
${HEIGHTINPUT}    xpath=//*[@name='height']
${AGEINPUT}    xpath=//*[@name='age']
${CLUBINPUT}    xpath=//*[@name='club']
${LEVELINPUT}    xpath=//*[@name='level']
${MAINPOSITIONINPUT}    xpath=//*[@name='mainPosition']
${SECONDPOSITIONINPUT}    xpath=//*[@name='secondPosition']
${ACHIEVEMENTSINPUT}    xpath=//*[@name='achievements']
${ADDLANGUAGEBUTTON}    xpath=//*/div[2]/div/div[15]/button
${LANGUAGEINPUT}    xpath=//*/div[15]/div/div/div/input
${LACZYNASPILKAINPUT}    xpath=//*[@name='webLaczy']
${DZIEWIECDZIESIATMINUTINPUT}    xpath=//*[@name='web90']
${FACEBOOKINPUT}    xpath=//*[@name='webFB']
${ADDLINKTOYOUTUBEBUTTON}    xpath=//*/div[2]/div/div[19]/button
${LINKTOYOUTUBEINPUT}    xpath=//*/form/div[2]/div/div[19]/div/div/div/input
${CLEARBUTTON}    xpath=//*[text()='Clear']
${MAINPAGEBUTTON}    xpath=//*[text()='Main page']

*** Test Cases ***
Add a player to database
    Open Login Page
    Type In Email
    Type In Password
    Click On Sign In Button
    Click On Add Player Button
    Type In Players Email
    Type In Name
    Type In Surname
    Type In Phone
    Type In Weight
    Type In Height
    Type In Age
    Type In Club
    Type In Level
    Type In Main Position
    Type In Second Position
    Type In Achievements
    Click On Add Language Button
    Type In Language
    Type In Laczy Nas Pilka
    Type In 90 Minut
    Type In Facebook
    Click On Add Link To Youtube Button
    Type In Link To Youtube
    Click On Clear Button
    Assert Add A Player Form
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type In Email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type In Password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click On Sign In Button
    Click Element   ${SIGNINBUTTON}
Click On Add Player Button
    Wait Until Element Is Visible    ${ADDPLAYERBUTTON}
    Click Element    ${ADDPLAYERBUTTON}
Type In Players Email
    Wait Until Element Is Visible    ${PLAYEREMAILINPUT}
    Input Text    ${PLAYEREMAILINPUT}    jan.kowalski@jk.com
Type In Name
    Input Text    ${NAMEINPUT}    Jan
Type In Surname
    Input Text    ${SURNAMEINPUT}    Kowalski
Type In Phone
    Input Text    ${PHONEINPUT}    123456789
Type In Weight
    Input Text    ${WEIGHTIPUT}    68
Type In Height
    Input Text    ${HEIGHTINPUT}    180
Type In Age
    Input Text    ${AGEINPUT}    01.01.2001
Type In Club
    Input Text    ${CLUBINPUT}    FC JK
Type In Level
    Input Text    ${LEVELINPUT}    1
Type In Main Position
    Input Text    ${MAINPOSITIONINPUT}    goalkeeper
Type In Second Position
    Input Text    ${SECONDPOSITIONINPUT}    defender
Type In Achievements
    Input Text    ${ACHIEVEMENTSINPUT}    no achievements
Click On Add Language Button
    Click Element    ${ADDLANGUAGEBUTTON}
Type In Language
    Input Text    ${LANGUAGEINPUT}    English
Type In Laczy Nas Pilka
    Input Text    ${LACZYNASPILKAINPUT}    www.laczynaspilka.pl/jankowalski
Type In 90 Minut
    Input Text    ${DZIEWIECDZIESIATMINUTINPUT}    www.90minut.pl/jankowalski
Type In Facebook
    Input Text    ${FACEBOOKINPUT}    www.facebook.com/jankowalski
Click On Add Link To Youtube Button
    Click Element    ${ADDLINKTOYOUTUBEBUTTON}
Type In Link To Youtube
    Input Text    ${LINKTOYOUTUBEINPUT}    www.youtube.com/jankowalski
Click On Clear Button
    Click Element    ${CLEARBUTTON}
Assert Add A Player Form
    Wait Until Element Is Visible    ${MAINPAGEBUTTON}
    Title Should Be    Add player
    Capture Page Screenshot    alert.png