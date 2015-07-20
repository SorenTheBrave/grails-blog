#Feature: View Blog Entries
#         In order to stay up to date
#         As a Reader
#         I want to be able to view blog posts of my favorite blogger

require "watir-webdriver"

extend PageObject::PageFactory

#Scenario:  View Recent Blog Posts

  Given(/^my favorite blogger has been very active$/) do
    go_to_blog_posts
    blogger_be_active_yo
  end

  When(/^I visit the blog for my favorite blogger$/) do
    go_to_blog_posts
    sleep 5
  end

  Then(/^I should see a summary of my favorite blogger's 10 most recent posts in reverse order$/) do
    see_recent_posts_in_order
  end

#Scenario: View a Blog Post

  #Given is covered by the previous 'When' - it matches the REGEX, so it doesn't matter that it's When instead of Given

  When (/^I choose a blog post$/) do
    go_to_blog_posts
    choose_random_post
  end

  Then (/^I should see the blog post$/) do
    post_exists?
  end

# #Scenario: Search for Blog Post
#
#    #Given is covered by the previous 'When' - it matches the REGEX, so it doesn't matter that it's When instead of Given
#
#    When (/^I search for a blog post$/) do
#
#    end
#
#    Then (/^I should see posts with that value in the title$/) do
#
#    end