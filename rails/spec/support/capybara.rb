Capybara.register_driver :chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :remote,
                                 url: "http://selenium_chrome:4444/wd/hub",
                                 desired_capabilities: :chrome
end
