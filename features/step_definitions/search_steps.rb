search = SearchPage.new
result_search = ResultSearchPage.new
menu = MenuPage.new
agent = AgentsPage.new
agentDetails = AgentDetailsPage.new

When(/^I select the type "([^"]*)"$/) do |type|
  search.selectType(type)
end

When(/^I search for "([^"]*)"$/) do |type|
  search.selectProperty(type)
end

When(/^I enter the location "([^"]*)"$/) do |location|
  search.sendLocation(location)
end

When(/^I click on Find button$/) do
  search.clickOnFind
end

When(/^I enter the minimum bed "([^"]*)"$/) do |min|
  search.selectMinBedroom(min)
end

When(/^I enter the maximum bed "([^"]*)"$/) do |max|
  search.selectMaxBedroom(max)
end

Then(/^Should display the result in the page$/) do
  # Match the Total Result with the count of titles
  expect(result_search.getTotalResult).to eql(result_search.getCountTitle)
end

When(/^I sort the list result by "([^"]*)"$/) do |sort|
  result_search.sortBy(sort)
end

Then(/^Should save all the prices of the listing in a csv file$/) do
  result_search.format_CSV_File
end

Given(/^I select the option "([^"]*)" in the menu$/) do |menu_option|
  menu.selectMenuOption(menu_option)
end

When(/^I filter agents passing "([^"]*)" by "([^"]*)"$/) do |language, menu_option|
  @menu_option = menu_option
  agent.selectOption(language, menu_option)
end

When(/^I click on the search button$/) do
  agent.clickOnFind
end

When(/^I note down the total count of agents$/) do

  case @menu_option.upcase
    when "LANGUAGES"
      @found_by_language = agent.getCountAgentFound
    when "NATIONALITY"
      @found_by_nationality = agent.getCountAgentFound
  end
end

Then(/^The number of agents found by language should less than the number of agents found by nationality$/) do
  expect(@found_by_nationality).to be < @found_by_language
end

When(/^I select First agent$/) do
  agent.getFirstAgent
end

Then(/^Should be saved the info in a text file$/) do
  agentDetails.createInfoFile
end

When(/^I change language to Arabic$/) do
  agentDetails.changeLanguageToArabic
end

Then(/^Should take a screenshot of the "([^"]*)" website$/) do |language|
  agentDetails.takescreenshot(language)
end