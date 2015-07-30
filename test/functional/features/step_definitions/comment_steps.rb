require "watir-webdriver"

extend PageObject::PageFactory

  #Scenario: View Blog Comments
Then(/^I should see comments left by other readers$/) do
  check_comments_exist
end

  #Scenario: Leave a comment (AJAX)
Given(/^I am reading a blog post from my favorite blogger$/) do
  go_to_blog_home
  go_to_blog_posts
  choose_post
end

When(/^I add my genius comment to the blog post$/) do
  post_comment
end

Then(/^my genius comment is at the top of the blog post comments$/) do
  check_comment_posted
end