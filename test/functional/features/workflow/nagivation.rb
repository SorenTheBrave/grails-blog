require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

def go_to_blog_home
  visit_page BlogHomePage
end

def go_to_blog_posts
  unless @browser.url == 'http://localhost:8080/grails-blog/post/index'  #check this
    go_to_blog_home
    on_page BlogHomePage do |page|
      page.login
    end
  end
end

def go_to_create_post
  on_page PostsPage do |page|
    page.create
  end
end

def return_to_post_added
  on_page SuccessPostPage do |page|
    page.list
  end
end