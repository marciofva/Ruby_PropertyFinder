class MenuPage < SitePrism::Page

  #Menu
  elements :menu, '.header-menu > li'

  def selectMenuOption(option)
    wait_until_menu_visible

    case option
      when 'BUY'
        menu[0].click
      when 'RENT'
        menu[1].click
      when 'COMMERCIAL'
        menu[2].click
      when 'FIND AGENT'
        menu[3].click
      when 'NEW PROJECTS'
        menu[4].click
      when 'MORE'
        menu[5].click
    end
  end

end