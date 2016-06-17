require 'rspec'
require_relative '../../src/pageObjects/abstract_page'

class EmployeePage < AbstractPage

    def initialize (driver)
      super(driver)
    end

    #elements
    ADD_USER = {id:'add_user'}
    FIRST_NAME = {id:'user_detail_first'}
    LAST_NAME = {id:'user_detail_last'}
    EMAIL = {id:'user_detail_email'}
    PIN = {id:'user_detail_pin'}


    def clickEmployeeList
     @@driver.switch_to.frame @@driver.find_element(:class, 'app-frame')
     wait = Selenium::WebDriver::Wait.new(:timeout => 10)
     wait.until { @@driver.find_element(:id, 'content_nav_item_2').displayed?}
     @@driver.find_element(:id, 'content_nav_item_2').click

     @@driver.switch_to.default_content
      EmployeePage.new(@@driver)
    end

    def createEmployee(employeeFirstName, employeeLastName, employeeEmail, pinNumber)
      @@driver.switch_to.frame @@driver.find_element(:class, 'app-frame')

      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until { @@driver.find_element(ADD_USER).displayed?}
      @@driver.find_element(ADD_USER).click
      @@driver.find_element(FIRST_NAME).send_keys(employeeFirstName)
      @@driver.find_element(LAST_NAME).send_keys(employeeLastName)
      @@driver.find_element(EMAIL).send_keys(employeeEmail)
      @@driver.find_element(PIN).send_keys(pinNumber)
      #click jobcodes
      @@driver.find_element(:id, 's2id_autogen1').click
      #select first jobcode
      @@driver.find_element(:css, '.select2-results-dept-0.select2-result.select2-result-selectable:first-of-type').click
      @@driver.find_element(:id, 'user_detail_save').click


      @@driver.switch_to.default_content
      EmployeePage.new(@@driver)
    end

    def verifyCreatedEmployee(employeeName)
      @@driver.switch_to.frame @@driver.find_element(:class, 'app-frame')

      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until { @@driver.find_element(:id, 'add_user').displayed?}
      @@driver.page_source.include? 'employeeName'


      @@driver.switch_to.default_content
      EmployeePage.new(@@driver)
    end

end