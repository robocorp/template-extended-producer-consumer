*** Settings ***
Documentation    Extended producer robot template using Robot Framework.

Library    MyLibrary
Library    RPA.Robocorp.WorkItems

Resource    keywords.robot

Variables    variables.py


*** Keywords ***
Log And Return Today
    [Documentation]    Logs today's date with both the RF and Python keywords, then
    ...    returns today's date from the set variable.

    Log Today In RF
    Log Today In Python

    RETURN    ${TODAY}


*** Tasks ***
Produce Output
    [Documentation]    Read input data from the initial Work Item and create as many
    ...    output Work Items for the 2nd Step as instructed to.

    # Prepare the output Work Item data.
    ${message} =    Get Work Item Variable    message
    ${today} =    Log And Return Today
    ${output_data} =    Set Variable    ${message} (${today})

    # Read how many output Work Items to create from the input `count` field.
    ${count} =    Get Work Item Variable    count
    FOR    ${index}    IN RANGE    ${1}    ${count + 1}
        Log To Console    Creating output item no. #${index}...

        Create Output Work Item
        Set Work Item Variable    data    ${index}. ${output_data}
        Add Work Item File    ${FILE_PATH}
        Save Work Item
    END

    Log To Console    Done with creating ${count} output Work Items for consuming!
