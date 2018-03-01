Feature: Validating PropertyFinder system
  As an user
  I would like to search places and agents
  in order to get a property

  @search_property
  Scenario: Searching places by filters
    When  I select the type "BUY"
    When  I search for "VILLA"
    When  I enter the minimum bed "3 Beds"
    When  I enter the maximum bed "7 Beds"
    When  I enter the location "THE PEARL"
    When  I click on Find button
    When  I sort the list result by "Price (high)"
    Then  Should display the result in the page
    Then  Should save all the prices of the listing in a csv file

  @agent
  Scenario: Finding Agents by filters
    Given I select the option "FIND AGENT" in the menu
    When  I filter agents passing "HINDI,ENGLISH,ARABIC" by "LANGUAGES"
    When  I click on the search button
    When  I note down the total count of agents
    When  I filter agents passing "INDIA" by "NATIONALITY"
    When  I note down the total count of agents
    Then  The number of agents found by language should less than the number of agents found by nationality

  @agent
  Scenario: Selecting info from the First Agent
    Given I select the option "FIND AGENT" in the menu
    When  I select First agent
    Then  Should be saved the info in a text file
    Then  Should take a screenshot of the "English" website
    When  I change language to Arabic
    Then  Should take a screenshot of the "Arabic" website