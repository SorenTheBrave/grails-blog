package grails.blog

import java.lang.Comparable

class Comment implements Comparable {
	String authorName
	String content
	Date dateCreated
	
	static belongsTo = [post: Post]
	
	public int compareTo(Object c){
		if(this.dateCreated == c.dateCreated){
			return 0
		}
		
		if(this.dateCreated < c.dateCreated){
			return 1
		}else{
			return -1
		}
	}
	
    static constraints = {
		authorName(blank: false)
		content(blank: false, widget: 'textarea', maxSize: 2000)
    }
}
