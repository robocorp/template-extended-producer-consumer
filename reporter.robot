*** Settings ***
Documentation    Extended reporter robot template using Robot Framework.

Library    RPA.Robocorp.WorkItems

Variables    variables.py


*** Keywords ***
Count Input
    [Documentation]    Retrieve and print post-process item details.

    ${message} =    Get Work Item Variable    message
    Log    Item observation: ${message}

    RETURN    ${1}


*** Tasks ***
Report Result
    [Documentation]    Generate a report comprising all the details of the previously
    ...    processed items.

    IF    not ${CREATE_REPORT}
        Fail    Reporting is disabled!
    END

    @{results} =    For Each Input Work Item    Count Input
    ${total} =    Evaluate    sum(${results})
    Log    Successfully processed items: ${total}

    Log To Console    Done with processing all the input Work Items (Consumer outputs).
