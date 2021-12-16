*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]


*** Keywords ***
Login
    [arguments]     ${hello_email}      ${hello_pw}
     open browser    https://app.deriv.com/     chrome
     maximize browser window
     Wait until page does not contain element     dt_core_header_acc-info-preloader     60
     Wait until page contains element    ${login_btn}     60
     click element    id=${login_btn}
     Wait until page contains element    ${email_field}
     input text  ${email_field}     ${hello_email}
     input password  id=txtPass     ${hello_pw}
     click element    ${login_oauth_btn}
     Wait until page contains element    //*[text()="Deposit" and contains(@class,"dc-text dc-btn__text")]     60
     Wait until page contains element    dt_core_account-info_acc-info     60
     Switch to demo

Switch to demo
    Wait until page does not contain element    //*[@aria-label="Loading interface..."]   45
    click element    dt_core_account-info_acc-info
    Wait until page contains element        //*[text()="Real" and contains(@class,"active")]    20
    Wait until page contains element    //*[text()="Demo" and not(contains(@class,"active"))]   20
    click element   //*[@id="dt_core_account-switcher_demo-tab"]
    Wait until page contains element    //*[text()="Demo" and contains(@class,"active")]    20
    wait until page contains element  //*[text()="Demo"]//parent::span[contains(@class,"acc-switcher__id")]     15
    Click element   //*[text()="Demo"]//parent::span[contains(@class,"acc-switcher__id")]
    Wait until page does not contain element    //*[text()="Retrieving Trading Times..." and contains(@class,"sc-loader-status")]       60
    wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]     80
