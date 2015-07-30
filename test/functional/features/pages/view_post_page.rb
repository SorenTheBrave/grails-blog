require 'page-object'

class ViewPostPage
  include PageObject

  text_field(:name, :id => 'name')
  text_area(:comment, :id => 'comment')
  button(:submit, name => 'submitComment')
end