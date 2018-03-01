class SearchPage < SitePrism::Page

  #Type (Rent / Buy / Commercial rent / Commercial buy / Agent)
  element :type_dropdown, '#search-form-property > div.pure-g.search-wrapper > div.category-select.pure-u-1-1.pure-u-sm-1-4.pure-push'
  elements :type_options_dropdown, 'div.pure-g:nth-child(3) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > ul:nth-child(1) > li'

  #Property Type (Apartment / Villa / Townhouse / Penthouse/ Compound / Duplex / Whole Building / Bulk Rent Units / Hotel Apartments / Labor Camp / Staff Accommodation)
  element :property_type_dropdown, 'div.pure-control-group:nth-child(1)'
  elements :property_options_dropdown, 'div.pure-control-group:nth-child(1) > div:nth-child(2) > div:nth-child(2) > ul:nth-child(1) > li'

  #Location Field
  element :location_field, 'input.ui-state-valid'

  #Find Button
  element :find_button, 'div.pure-g:nth-child(3) > div:nth-child(1) > button:nth-child(2) > div:nth-child(1)'

  #Min Beds
  element :min_beds_dropdown, '#bedroom_group > div:nth-child(1)'
  elements :min_beds_options_dropdown, '#bedroom_group > div:nth-child(1) > div:nth-child(2) > div:nth-child(2) > ul:nth-child(1) > li'

  #Max Beds
  element :max_beds_dropdown, '#bedroom_group > div:nth-child(2)'
  elements :max_beds_options_dropdown, '#bedroom_group > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > ul:nth-child(1) > li'

  def selectType(type)
      wait_until_type_dropdown_visible
      type_dropdown.click
      type_options_dropdown.map{|opt| opt.click if opt.text.downcase.eql?(type.downcase)}
  end

  def selectProperty(type)
      wait_until_property_type_dropdown_visible
      property_type_dropdown.click
      sleep(2)
      property_options_dropdown.map{|opt| opt.click if opt.text.downcase.eql?(type.downcase)}
  end

  def sendLocation(location)
      wait_until_location_field_visible
      location_field.send_keys location
  end

  def selectMinBedroom(min)
      wait_until_min_beds_dropdown_visible
      min_beds_dropdown.click
      min_beds_options_dropdown.map{|opt| opt.click if opt.text.downcase.eql?(min.downcase)}
  end

  def selectMaxBedroom(max)
      wait_until_max_beds_dropdown_visible
      max_beds_dropdown.click
      max_beds_options_dropdown.map{|opt| opt.click if opt.text.downcase.eql?(max.downcase)}
  end

  def clickOnFind
      wait_until_find_button_visible
      find_button.click
  end
end