require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'


RSpec.configure do |config|
  
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  #criando relatorio de testes
  config.formatter = :documentation

  config.before(:example)do
      page.current_window.resize_to(1920, 1080) 
  end
  
end

Capybara.configure do |config|
  #config.default_driver = :selenium_chrome_headless
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15
  config.app_host = 'localhost:8080'

end  