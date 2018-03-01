class AgentDetailsPage < SitePrism::Page

  #Name label
  element :name_label, 'h1.title'

  #Nationality label
  element :nationality_label, '.pane_column-fullwidth > p:nth-child(1) > span:nth-child(2)'

  #Language label
  element :language_label, '.pane_column-fullwidth > p:nth-child(2) > span:nth-child(2)'

  #License nro label
  element :license_label, 'div.pane-textsmall:nth-child(2) > div:nth-child(1) > p:nth-child(2) > span:nth-child(2)'

  #AboutMe tab
  element :aboutme_label, 'a.tab_button:nth-child(1)'
  element :aboutme_content, 'div.tab_content:nth-child(2)'

  #Phone button
  element :phone_button, 'a[data-qs="phone-button"]'

  #Company name label
  element :company_label, 'p.text:nth-child(1)'

  #Experience label
  element :experience_label, 'div.pane-textsmall:nth-child(2) > div:nth-child(1) > p:nth-child(3) > span:nth-child(2)'

  #Number of active listings
  element :number_active_label, 'div.pane-textsmall:nth-child(2) > div:nth-child(1) > p:nth-child(1) > span:nth-child(2) > a:nth-child(1)'

  #List of links
  elements :list_links, 'a.link'

  #Change Language (Arabic)
  element :language_change_menu, 'div div div a[data-qs="language-selector"]'


  def getName
      wait_until_name_label_visible
      return name_label.text
  end

  def getNationality
      wait_until_nationality_label_visible
      return nationality_label.text
  end

  def getLanguage
      wait_until_language_label_visible
      return language_label.text
  end

  def getLicenseNro
      wait_until_license_label_visible
      return license_label.text
  end

  def clickOnAboutMe
      wait_until_aboutme_label_visible
      aboutme_label.click
  end

  def getAboutMe
      wait_until_aboutme_content_visible
      return aboutme_content.text
  end

  def clickOnPhoneButton
    wait_until_phone_button_visible
    phone_button.click
  end

  def getPhoneNro
      wait_until_phone_button_visible
      return phone_button.text
  end

  def getCompanyName
      wait_until_company_label_visible
      return company_label.text
  end

  def getExperience
      wait_until_experience_label_visible
      return experience_label.text
  end

  def getNroActiveList
      wait_until_number_active_label_visible
      return number_active_label.text
  end

  def getLinkedIn
      url = ""
      list_links.map{|opt| url = opt['href'] if opt['href'].include?("linkedin")}
      return url
  end

  def changeLanguageToArabic
      wait_until_language_change_menu_visible
      language_change_menu.click
  end

  def createInfoFile
      #Open File
      openFile

      #Write File in a csv format
      writeFile

      #Close File
      closeFile
  end

  def takescreenshot(language)
      save_screenshot("screenshot/profile-#{language}.png")
  end

  def openFile
      Dir.mkdir('files') unless Dir.exist?('files')
      @filetxt = File.open("files/info.txt",  "w+")
  end

  def writeFile
      @filetxt.puts 'i) '    + getName
      @filetxt.puts 'ii) '   + getNationality
      @filetxt.puts 'iii) '  + getLanguage
      @filetxt.puts 'iv) '   + getLicenseNro

      clickOnAboutMe

      @filetxt.puts 'v) '     + getAboutMe

      clickOnPhoneButton

      @filetxt.puts 'vi) '     + getPhoneNro
      @filetxt.puts 'vii) '    + getCompanyName
      @filetxt.puts 'viii) '   + getExperience
      @filetxt.puts 'ix) '     + getNroActiveList
      @filetxt.puts 'x) '      + getLinkedIn if getLinkedIn != ""
  end

  def closeFile
      @filetxt.close
  end
end