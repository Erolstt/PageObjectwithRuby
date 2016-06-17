require 'rspec'
require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/home_page'


class LoginPage < AbstractPage

  def initialize (driver)
    super(driver)
  end

  #elements
  USER_NAME = {id:'user_name'}
  PASSWORD = {id: 'password'}
  LOGIN_BUTTON = {css:'.btn.btn-success'}

  def login (userName, password)
    @@driver.find_element(USER_NAME).send_keys userName
    @@driver.find_element(PASSWORD).send_keys password
    @@driver.find_element(LOGIN_BUTTON).click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @@driver.find_element(:id, 'nav-item-staff').displayed? }
    return HomePage.new(@@driver)
  end
  def typeUserName(userName)
    @@driver.find_element(:id, 'user_name').send_keys userName
    return LoginPage.new(@@driver)
  end
  def typePassword(password)
    @@driver.find_element(:id, 'password').send_keys password
    return LoginPage.new(@@driver)
  end
  def clickLoginButton
    @@driver.find_element(:css,'.btn.btn-success').click
    return HomePage.new(@@driver)
  end

end