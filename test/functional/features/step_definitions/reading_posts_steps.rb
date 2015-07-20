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
    posts = get_all_posts
    prev_post_date = nil
    current_post_date = nil
    format = '%Y-%m-%d%n%H:%M:%S'   #DateTime.strptime Format for 'YYYY-MM-DD HH:MM:SS' - e.g. 2015-07-21 12:34:56 EDT

    posts.each do |post|
      prev_post_date = current_post_date
      current_post_date_str = post.scan(/\d+[-]\d+[-]\d+\s\d+[:]\d+[:]\d+/)[0]
      current_post_date = DateTime.strptime(current_post_date_str, format)

      expect(post).to_not be_nil
      unless prev_post_date == nil
        expect(prev_post_date).to be >= current_post_date
      end
    end
  end

#Scenario: View a Blog Post
#   Given (/^I visit the blog for my favorite blogger$/) do
#
#   end
#
#   When (/^I choose a blog post$/) do
#
#   end
#
#   Then (/^I should see the blog post$/) do
#
#   end
#
# #Scenario: Search for Blog Post
#    Given (/^I visit the blog for my favorite blogger$/) do
#
#    end
#
#    When (/^I search for a blog post$/) do
#
#    end
#
#    Then (/^I should see posts with that value in the title$/) do
#
#    end