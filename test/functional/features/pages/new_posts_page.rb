require 'page-object'

class NewPostPage
  include PageObject

  page_url "http://localhost:8080/grails-blog/blog/create"

  text_field(:title, :id => 'title')
  textarea(:content, :id => 'content')
  button(:create, :id => 'create')

end