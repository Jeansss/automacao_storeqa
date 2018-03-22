require 'rspec'
require 'cucumber'
require 'rake'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'site_prism'

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium

Capybara.default_max_wait_time = 22

Capybara.page.driver.browser.manage.window.maximize
