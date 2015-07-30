require 'page-object'

class SuccessPostPage
  include PageObject

  link(:list, :class => 'list')
  p(:success_message, :id => 'newPostMessage')

end