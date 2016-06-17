require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/pageObjects/login_page'

class AbstractPage

  @@driver = nil

  def initialize (driver)
    @@driver = driver
  end

  def goToLeafHome
    @@driver.navigate.to('https://home.leaftest.me/login/')
    return LoginPage.new(@@driver)
  end
  def quit
    @@driver.quit
  end
  def getPageTitle
    return @@driver.title
  end

end