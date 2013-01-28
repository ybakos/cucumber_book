#!/usr/bin/env ruby

require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.com"

class WebRobot
  include Capybara::DSL

  def go
    visit '/'
    puts 'Press any key to finish'
    gets
  end

end

WebRobot.new.go
