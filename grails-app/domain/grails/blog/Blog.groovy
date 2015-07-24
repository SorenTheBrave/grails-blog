package grails.blog

class Blog {
	String title
	
	static hasMany = [posts: Post]
	
    static constraints = {
    }
}
