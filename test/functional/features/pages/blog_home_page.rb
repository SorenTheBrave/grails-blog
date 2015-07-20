require 'page-object'

class BlogHomePage
	include PageObject

	page_url "http://localhost:8080/grails-blog/"

	link(:login, :id => 'login')

end