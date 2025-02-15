*** Settings ***
Resource  ../resources/automobile/automobile.resource

*** Test Cases ***
Verify Test Case 1
    ${data}=    Load Test Case Data    TC001
    Fill Test Data    ${data}

Verify Test Case 2
    ${data}=    Load Test Case Data    TC002
    Fill Test Data    ${data}
