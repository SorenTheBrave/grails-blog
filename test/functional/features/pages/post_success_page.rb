require 'page-object'

class SuccessPostPage
  include PageObject

  page_url "http://localhost:8080/grails-blog/blog/show/"

  link(:list, :class => 'list')
  div(:success_message, :class => 'message')

end