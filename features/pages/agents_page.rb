class AgentsPage < SitePrism::Page

  #Dropdown for the options: (Service needed / Languages / Nationality)
  elements :options_dropdown, '.searchform_column'

  #Language option
  elements :languages_dropdown, '.dropdown_popup-multiple > div'

  #Nationality option
  elements :nationality_dropdown, '.dropdown_popup-opened > div'

  #Find button
  element :find_button, 'button.button:nth-child(1)'

  #Agents found
  element :agent_found_lable, '.title'

  #List of Agents
  elements :list_agents, '.tile_cover'


  def selectOption(values,option)
      wait_until_options_dropdown_visible

      case option.upcase
        when "SERVICE"
          options_dropdown[0].click
        when "LANGUAGES"
          selectLanguages(values)
        when "NATIONALITY"
          options_dropdown[2].click
          selectNationality(values)
      end
  end

  def selectLanguages(values)
      languages = values.split(',')

      for i in 0..(languages.count - 1)
        #Open the dropdown
        options_dropdown[1].click

        languages_dropdown.map{|opt| opt.click if languages[i].eql?(opt.text.upcase)}
        sleep(3)
      end
  end

    def selectNationality(values)
        nationality_dropdown.map{|opt| opt.click if values.eql?(opt.text.upcase)}
    end

  def clickOnFind
      wait_until_find_button_visible
      find_button.click
  end

  def getCountAgentFound
      #Waiting the loading to update the page for the new status
      sleep(10)

      wait_until_agent_found_lable_visible
      return agent_found_lable.text.gsub('Matching Agents Found' , '').strip.to_i
  end

  def getFirstAgent
      wait_until_list_agents_visible
      list_agents[0].click
  end

end