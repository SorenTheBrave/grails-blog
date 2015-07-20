package grails.blog

class Blog {

	String title
	String content
	Date dateCreated
	//Date lastUpdated

    static constraints = {
		title(blank: false)
		content(blank: false, widget: 'textarea', maxSize: 2000)
    }
	
	static mapping = {
		sort dateCreated: "desc"
		content type: "text"
	}
}
