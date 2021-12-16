*** Settings ***
Library     SeleniumLibrary
Resource    keywords.robot

*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]


*** Keyword ***


*** Test Cases ***

API
     Login       ${my_email}     ${my_pw}
     Wait until page does not contain element     dt_core_header_acc-info-preloader     60
     wait until page contains element   //*[@class="account-settings-toggle"]  15
     click Element  //*[@class="account-settings-toggle"]
     wait until page contains element   //*[@id="dc_api-token_link"]   15
     click element    //*[@id="dc_api-token_link"]

     # Display all the scopes that availble
     Wait Until Page Contains Element   //*[@class="da-api-token__checkbox-wrapper"]   15
     wait until page contains element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input   15
     # Empty checkbox 
     element should be disabled   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     # Select the checkbox of the listed scopes and create token
     Click Element   //*[text()="Trade"]
     sleep  2
     Click Element   //*[text()="Read"]
     sleep  2
     Click Element   //*[text()="Admin"]
     sleep  2
     Click Element   //*[text()="Payments"]
     sleep  2
     Click Element   //*[text()="Trading information"]
     sleep  2
     
     # Checking the input field for creating token 
     input text  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  a
     element should be disabled  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     sleep  3
     press keys  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  BACKSPACE
     sleep  3
     input text  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  PRAVINKANNAPPANISSUPERHANDSOMEMAA
     element should be disabled  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     sleep  3
     ${current_value}=    Get Element Attribute   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input    value
     ${value_length}=    Get Length    ${current_value}
     # sometimes text cursor starts from the middle, so delete front and back characters
     Repeat Keyword    ${value_length}    Press Keys    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  BACKSPACE
     Repeat Keyword    1   Press Keys    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input   DELETE
     sleep  3
     input text  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  @
     element should be disabled  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     sleep  3
     press keys  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  BACKSPACE

     input text  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input  abc
     element should be enabled  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     click element   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
     sleep  3

#    copy token
     wait until page contains element  //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]  15
     click element  //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
     sleep  3

#   Delete token
    wait until page contains element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button  15
    click element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button
    sleep  2
    wait until page contains element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]  15
    click element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]
