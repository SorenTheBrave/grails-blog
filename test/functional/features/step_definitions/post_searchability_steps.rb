require "watir-webdriver"

extend PageObject::PageFactory

Then(/^the url should contain information about the post$/) do
  expect(@browser.url).to match /^http:\/\/localhost:8080\/grails-blog\/post\/show\/(\S+|%\d+)\?id=\d+$/
end