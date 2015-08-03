package grails.blog

class Post {

	String title
	String content
	Date dateCreated
	SortedSet comments

	static searchable = {
		title boost: 2.0
		dateCreated index: 'not_analyzed'
	}
	static hasMany = [comments: Comment]
	
    static constraints = {
		title(blank: false)
		content(blank: false, widget: 'textarea', maxSize: 2000)
    }
	
	static mapping = {
		sort dateCreated: "desc"
		content type: "text"
	}
}
