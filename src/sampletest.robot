*** Settings ***
Library    Browser

*** Test Cases ***
Open Browser And Check Title
    New Browser    headless=False
    New Page    https://robotframework.org/
    Title Should Be    Robot Framework
    Close Browser