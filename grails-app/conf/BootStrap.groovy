import grails.blog.Post
import grails.blog.Comment

class BootStrap {

	def numPosts = 14
	def posts = []
	def postTitles = ["A post","Another post","I'm posting things!","Thanks","I am active!"
					  ,"Heeeeyeeeaaahyeeeaaahyeaahhyeah","Sorry","Whooooo",
					  "Click clack moo","hurr durrr","Comment on this","I got spurs",
					  "As I waaaaaalk","Finally"]
	def postContent = ["Post content","More post content","And you're reading it!",
					   "for reading!","Look at all my posts!","What's goin' on?",
					   "That last one was uncalled for...","yeeeeeeeeah","blah blah blah",
					   "things to search and edit","Comment ALL THE THINGS!!!",
					   "that jingle jingle jangle","right merrily along","My final post"]

	def defaultComment = new Comment(authorName: "Alex", content:"a comment taking up enough space to test my layout things. Just adding a little more text here... Whoo...")
	def anotherComment = new Comment(authorName: "Caleb", content:"You don't know nuthin'.")
	
	
    def init = { servletContext ->
	
		for(int i=0; i<14; i++){
			posts.add(new Post(title: postTitles[i], content: postContent[i]).save(failOnError: true))
		}
		posts[10].addToComments(defaultComment).addToComments(anotherComment).save(failOnError: true)
    }
    def destroy = {
    }
}
