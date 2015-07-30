package grails.blog

import grails.converters.JSON

class CommentController {
	def postComment(){
		def currentPost = Post.findById(params.id)
		def newComment = new Comment(authorName: params.commenterName, content: params.commentContent, post: currentPost)
		currentPost.addToComments(newComment)
		newComment.save(failOnError: true)
		
		render(view: 'newComment', model: [comments: newComment])
	}
}
