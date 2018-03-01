#--------------------------------------------------------------------------#
#   TAKING SCREENSHOT
#--------------------------------------------------------------------------#
After do |scenario|
    timestamp = "#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}"

    Dir.mkdir('screenshot') unless Dir.exist?('screenshot')

    if  scenario.failed?
        sufix = 'failed'
        name = scenario.name.tr(' ', '_').downcase

        save_screenshot("screenshot/#{sufix}-#{name}-#{timestamp}.png")
        embed("screenshot/#{sufix}-#{name}-#{timestamp}.png", 'image/png', 'SCREENSHOT')
    end
end

#--------------------------------------------------------------------------#
#   SETTING UP THE URL FOR SEARCHING PROPERTY
#--------------------------------------------------------------------------#
Before('@search_property') do
  visit('http://propertyfinder.qa')
end

#--------------------------------------------------------------------------#
#   SETTING UP THE URL FOR FINDING AGENT
#--------------------------------------------------------------------------#
Before('@agent') do
  visit('https://www.propertyfinder.ae')
end