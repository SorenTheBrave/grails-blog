require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

def check_comments_exist
  expect(@browser.div(:id, "userComments").text).to_not eq ''
end

def post_comment
  on_page ViewPostPage do |page|
    page.name = "WatirTest"
    page.comment = "Posting a comment!"
    page.submit
  end
end

def check_comment_posted
  sleep 1
  expect(@browser.div(:id, "userComments").divs(:class, "singleComment")[0].text).to match /^WatirTest\n[\S\s]+/
end