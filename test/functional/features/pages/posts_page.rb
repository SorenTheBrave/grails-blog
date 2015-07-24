require 'page-object'

class PostsPage
  include PageObject

  link(:home, :class => 'home')
  link(:create, :class => 'create')
  text_field(:searchBox, :id => 'searchBox')
  button(:searchSubmit, :id =>'searchSubmit')
end