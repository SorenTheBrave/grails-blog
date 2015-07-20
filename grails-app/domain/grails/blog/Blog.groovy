package grails.blog

class Blog {

	String title
	String content
	Date dateCreated
	//Date lastUpdated

    static constraints = {
		title(blank: false)
		content(blank: false)
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
