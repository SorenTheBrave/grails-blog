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
  on_page PostsPage do
    if(@browser.div(:class, "pagination").text != "")
      answer = true
    end
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

def see_recent_posts_in_order
  on_page PostsPage do
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
end

def choose_random_post
  post_num = Random.rand(1..10)
  @browser.div(:id, "list-blog").table.tbody.tr(:index, post_num).a.click
end

def post_exists?
  on_page SuccessPostPage do |page|
    expect(@browser.div(:id, "show-blog").ol.li(:index,0).span(:index,1)).not_to eq ""
    expect(@browser.div(:id, "show-blog").ol.li(:index,1).span(:index,1)).not_to eq ""
  end
end