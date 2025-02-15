*** Settings ***
Library    JSONLibrary
Library    OperatingSystem

*** Keywords ***
Load Test Case Data
    [Arguments]    ${testcase}
    ${file_path}=    Set Variable    ../testdata/testdata.json
    ${data}=    Load JSON    ${file_path}
    ${test_case_data}=    Get From Dictionary    ${data}    ${testcase}
    [Return]    ${test_case_data}

Fill Test Data
    [Arguments]    ${data}
    # Example: Handling basic text fields
    Input Text    text_field1    ${data["key1"]}
    Input Text    text_field2    ${data["key2"]}
    
    # Example: Handling array input (key3)
    :FOR    ${item}    IN    ${data["key3"]}
    \    Input Text    list_field    ${item}

    # Example: Handling radio buttons or dropdowns
    Run Input Control Based On Key    ${data}

Run Input Control Based On Key
    [Arguments]    ${data}
    # Check if 'input_key' exists and act based on the value
    ${input_key}=    Get From Dictionary    ${data}    input_key    None
    Run Keyword If    '${input_key}' == 'radio_btn_name'    Click Radio Button    radio_btn_name
    Run Keyword If    '${input_key}' == 'dropdown_name'    Select From List By Value    dropdown_name    ${data["dropdown_value"]}
    # You can extend this for more input control types
