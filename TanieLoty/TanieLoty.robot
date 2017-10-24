*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  OperatingSystem
Library  String

*** Variables ***
${SiteUrl}   https://www.tanie-loty.com.pl/
${Browser}   Firefox
${FlightFrom}   Warszawa [WAWA]
${FlightTo}   Chile
${DateFlightOut}   2018-03-02
${DateFlightTo}   2018-03-28
${Dealy}   10s
${Dealy2}   3s
${PathToFileWithData}   Loty.txt

*** Test Cases ***
Open Website And Check For Cheap Flights From X to Y
    [Tags]    DEBUG
    [Documentation]  Test checking how much cost the cheapest flights for country X to Y
    Open Browser To The Website
    Choose Flight From Country X
    Choose Flight To Country Y
    Choose Date of Flight
    Choose Date of Return
    Click "Szukaj"
    sleep   ${Dealy}
    Download the Price
    sleep   ${Dealy2}
    [Teardown]  close browser

*** Keywords ***
Open Browser To The Website
    open browser   ${SiteUrl}   ${Browser}
    maximize browser window

Choose Flight From Country X
    input text   modMainSearchFlightFrom   ${FlightFrom}

Choose Flight To Country Y
    input text  modMainSearchFlightTo   ${FlightTo}

Choose Date of Flight
    input text  modMainSearchFlightOutdate   ${DateFlightOut}

Choose Date of Return
    input text  modMainSearchFlightRetdate   ${DateFlightTo}

Click "Szukaj"
    click element   id=searcherSubmitButton

Download the Price
    ${Price} =   get text  //*[@id="search_result_div"]/div[3]/div[2]/div[1]
    ${Price2} =   get text  //*[@id="search_result_div"]/div[4]/div[2]/div[1]
    ${Price3} =   get text  //*[@id="search_result_div"]/div[5]/div[2]/div[1]
    ${Price4} =   get text  //*[@id="search_result_div"]/div[7]/div[2]/div[1]
    #empty directory   ${PathToFileWithData
    create file  ${PathToFileWithData}   ${Price} ${Price2} ${Price3} ${Price4}

//*[@id="flight_result_row_segment_276540080510"]/div[2]
//*[@id="flight_result_row_segment_276540080510"]/div[2]


