require 'rspec'
require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/employee_page'

class HomePage < AbstractPage
  def initialize (driver)
    super(driver)
  end

  EMPLOYEES = {id:'nav-item-staff'}

  def goToEmployees
    @@driver.find_element(EMPLOYEES).click
    return EmployeePage.new(@@driver)
  end
end