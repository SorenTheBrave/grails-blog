package grails.blog

class CommentController {
	def renderComments(postId){
		def parentPost = Post.findById(postId)
		//render(view: ) add a template to display all comments on a post with id postId
	}
	def saveComment(postId){
		
	}
}
