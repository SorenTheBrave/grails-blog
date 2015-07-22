require 'page-object'

class PostsPage
  include PageObject

  page_url "http://localhost:8080/grails-blog/blog/index"

  link(:home, :class => 'home')
  link(:create, :class => 'create')
  text_field(:searchBox, :id => 'searchBox')
  button(:searchSubmit, :id =>'searchSubmit')
end