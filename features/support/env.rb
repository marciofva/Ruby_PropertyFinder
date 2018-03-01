require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'


BROWSER = ENV['BROWSER']
puts('BROWSER: ', BROWSER)

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app,
                                   :browser => :chrome,
                                   :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                       'chromeOptions' => {
                                           'args' => ["--start-maximized"]
                                       }
                                   )

    )
  elsif BROWSER.eql?('firefox')
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.native_events = true
    Capybara::Selenium::Driver.new(app, :browser => :firefox,
                                   :marionette => true , profile: profile)
  end
end

Capybara.configure do |config|
  config.javascript_driver = :webkit
  config.default_driver = :selenium
  config.default_max_wait_time = 30
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end
