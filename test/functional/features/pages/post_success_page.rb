require 'page-object'

class SuccessPostPage
  include PageObject

  link(:list, :class => 'list')
  div(:success_message, :class => 'message')

end