*** Settings ***
Library     SeleniumLibrary



*** Keyword ***


*** Test Cases ***

# deactivation account
Login
    Open Browser    https://app.deriv.com/account/deactivate-account   chrome
    maximize browser window
    wait until page contains element  //*[@id="txtEmail"]  20
    click element  //*[@id="txtEmail"]
    input text  //*[@id="txtEmail"]  pravin+5@besquare.com.my
    click element  //*[@id="txtPass"]
    input text  //*[@id="txtPass"]  Pg030399
    click element  //*[@id="lost-password-container"]/button
    wait until page contains element  //*[@class="dc-btn dc-btn--primary dc-btn__large deactivate-account__button"]  30
    sleep  1
    wait until page contains element  //*[@id="app_contents"]/div   15
    click element  //*[@class="dc-btn dc-btn--primary dc-btn__large deactivate-account__button"]
    sleep  1
    click element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/label[4]
    sleep  1
    input text  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/div[1]/textarea   idk
    sleep  1
    #the last line didn't perform since it will deactivate the account
    click element  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div/div/form/div[3]/div[2]/button[2]
    wait until page contains element  //*[@id="modal_root"]/div/div/div  15
#    click element  //*[@id="modal_root"]/div/div/div/div[2]/button[2]
