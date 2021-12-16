*** Settings ***
Library     SeleniumLibrary
Resource    keywords.robot


*** Variables ***


*** Keywords ***


*** Test Cases ***
Task3
    Login       ${my_email}     ${my_pw}
    wait until page contains element    chart_container   15
    Click Element   //*[@class="cq-menu-btn"]
    Click Element   //*[text()="Forex"]
    wait until page contains element   //*[text()="AUD/USD"]   15
    Click Element   //*[text()="AUD/USD"]
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    click element   dt_contract_dropdown
    click element   dt_contract_high_low_item
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    click element   dt_simple_toggle
    press keys     name=duration   BACKSPACE
    input text     name=duration    2
    click element   dc_payout_toggle_item
    Wait Until Page Contains Element    dt_amount_input    10
    ${current_value} =    Get Element Attribute   dt_amount_input   value
    ${value_length}  =    Get Length    ${current_value}
    Repeat Keyword    ${value_length}    Press Keys    dt_amount_input   BACKSPACE
    Repeat Keyword    1   Press Keys    dt_amount_input   DELETE
    input text      dt_amount_input     15.50
    wait until element is enabled   dt_purchase_put_button
    click element   dt_purchase_put_button
    reload page

