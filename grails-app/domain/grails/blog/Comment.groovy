package grails.blog

class Comment {
	String authorName
	String content
	Date dateCreated
	
    static constraints = {
		authorName(blank: false)
		content(blank: false, widget: 'textarea', maxSize: 2000)
    }
}
