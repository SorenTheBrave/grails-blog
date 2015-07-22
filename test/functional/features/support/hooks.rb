require 'watir-webdriver'
require 'watir-webdriver/extensions/alerts'
require 'page-object'

include PageObject::PageFactory

Before do
  @browser = Watir::Browser.new :firefox
  blogger_be_active_yo
end

After do
  @browser.close
end