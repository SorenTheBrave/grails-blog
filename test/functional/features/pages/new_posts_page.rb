require 'page-object'

class NewPostPage
  include PageObject

  text_field(:title, :id => 'title')
  textarea(:content, :id => 'content')
  button(:create, :id => 'create')

end