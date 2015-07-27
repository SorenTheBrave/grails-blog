require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

def create_post
  on_page NewPostPage do |page|
    page.title = "post1"
    page.content = "content"
    page.create
  end
end

def verify_post_added
  on_page PostsPage do |page|
    post_text = get_first_post
    expect(post_text).to match /^post1 content .*$/
  end
end

def get_first_post
  @browser.table.tbody.tr(:index, 0).text
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

def blogger_be_active_yo
  unless many_posts_exist?

      #11 is enough posts to make sure there is a full page of posts
    11.times do |n|
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
  go_to_blog_posts
  answer = false
  on_page PostsPage do
    if @browser.div(:class, "pagination").text != ""
      answer = true
    end
  end
  answer
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
  post_num = Random.rand(1..9)
  @browser.div(:id, "list-post").table.tbody.tr(:index, post_num).a.click
end

def post_exists?
  on_page SuccessPostPage do |page|
    expect(@browser.div(:id, "show-blog").ol.li(:index,0).span(:index,1)).not_to eq ""
    expect(@browser.div(:id, "show-blog").ol.li(:index,1).span(:index,1)).not_to eq ""
  end
end

def search_for_post
  on_page PostsPage do |page|
    page.searchBox = "something"
    page.searchSubmit
  end
end

def search_returned_results
  on_page PostsPage do |page|
    expect(@browser.div(:id, "list-post").table.tbody.tr(:index,0).a.text).to eq "something"
  end
end