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
    expect(post_text).to match /^post1$/
  end
end

def get_first_post
  @browser.div(:id, "postList").div(:index, 0).h1.a.text
end

def get_all_posts
  posts = @browser.divs(:class, "singlePost")
end

def check_blogger_active
  on_page PostsPage do |page|
    expect(@browser.div(:id, "postList").text).to_not eq ''
  end
end

def see_recent_posts_in_order
  on_page PostsPage do
    posts = get_all_posts
    prev_post_date = nil
    current_post_date = nil
    format = '%Y-%m-%d%n%H:%M:%S'   #DateTime.strptime Format for 'YYYY-MM-DD HH:MM:SS' - e.g. 2015-07-21 12:34:56 EDT

    posts.each do |post|
      prev_post_date = current_post_date
      current_post_date_str = post.div(:class, "date").p(:class, "dateValue").text.scan(/\d+[-]\d+[-]\d+\s\d+[:]\d+[:]\d+/)[0]
      current_post_date = DateTime.strptime(current_post_date_str, format)

      expect(post).to_not be_nil
      unless prev_post_date == nil
        expect(prev_post_date).to be >= current_post_date
      end
    end
  end
end

def choose_post
  search_for_post
  @browser.divs(:class, "singlePost")[0].a.click
end

def post_exists?
  expect(@browser.div(:id, "showPost").text).not_to eq ""
end

def search_for_post
  on_page PostsPage do |page|
    page.searchBox = "Comment on this"
    page.searchSubmit
  end
end

def search_returned_results
  on_page PostsPage do |page|
    expect(@browser.div(:class, "singlePost").h1.text).to eq "Comment on this"
  end
end