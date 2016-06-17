require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/pageObjects/login_page'

describe 'Testing Employee' do
  app = nil

  before(:all) do
    @userName = 'meltem+master@vngrs.com'
    @password = 'Meltem123'
  end
  before(:each) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end
  after(:each) do
    app.quit
  end

  it 'should login with valid credentials' do

    loginLeafHome = app.goToLeafHome
                        .login(@userName, @password)

  end

  it "should create an employee" do
    createEmployee = app.goToLeafHome
                         .login(@userName, @password)
                         .goToEmployees
                         .clickEmployeeList
                         .createEmployee('Erol','Ruby','erol1@ruby.com','3432')
                         .verifyCreatedEmployee('Erol')
  end

end