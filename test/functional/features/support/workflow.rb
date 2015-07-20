require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

def go_to_blog_home
  visit_page BlogHomePage
end

def go_to_blog_posts
  go_to_blog_home
  on_page BlogHomePage do |page|
    page.login
  end
end

def go_to_create_post
  on_page PostsPage do |page|
    page.create
  end
end

def create_post
  on_page NewPostPage do |page|
    page.title = "post1"
    page.content = "content"
    page.create
  end
end

def return_to_post_added
  on_page SuccessPostPage do |page|
    page.list
  end
end

def get_first_post
  @browser.table.tbody.tr(:index, 0).text
end

def blogger_be_active_yo
  unless many_posts_exist?
    10.times do |n|
      on_page PostsPage do |page|
        page.create
      end
      on_page NewPostPage do |page|
        page.title = "post#{n}"
        page.content = "content"
        page.create
      end
    end
  end
  sleep 5
end

def many_posts_exist?
  answer = false
  if(@browser.div(:class, "pagination").text != "")
    answer = true
  end
  answer
end

def get_all_posts
  posts = Array.new(10)
  on_page PostsPage do |page|
    10.times do |n|
      posts[n] = @browser.table.tbody.tr(:index, n).text
    end
    posts
  end
  posts
end