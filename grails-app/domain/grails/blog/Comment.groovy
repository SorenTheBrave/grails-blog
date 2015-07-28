package grails.blog

class Comment {
	String authorName
	String content
	Date dateCreated
	
	static belongsTo = [post: Post]
	
    static constraints = {
		authorName(blank: false)
		content(blank: false, widget: 'textarea', maxSize: 2000)
    }
}
