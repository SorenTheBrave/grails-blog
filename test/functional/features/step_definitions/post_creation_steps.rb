require "watir-webdriver"

extend PageObject::PageFactory

Given(/^I am logged in as a blogger$/) do
  go_to_blog_posts
end

When(/^I publish a new blog post$/) do
	go_to_create_post
  create_post
end

Then(/^I am notified that the blog post was successfully added$/) do
  on_page SuccessPostPage do |page|
    expect(page.success_message).to match /^Blog (\d+) created$/
  end
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
	return_to_post_added
  verify_post_added
end