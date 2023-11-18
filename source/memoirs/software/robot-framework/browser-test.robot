*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}          http://google.com/
${BROWSER}      Chrome

*** Test Cases ***
The user can search for flights
    Open browser    ${URL}   ${BROWSER}
	Close all browsers