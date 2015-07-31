package grails.blog

import grails.converters.JSON

class CommentController {
	def postComment(){
		if(params.commenterName && params.commentContent){
			def currentPost = Post.findById(params.id)
			def newComment = new Comment(authorName: params.commenterName, content: params.commentContent, post: currentPost).save(flush: true,failOnError: true)
			currentPost.addToComments(newComment)
			
			render(template: 'commentLayout', model: [comments: currentPost.comments])
		}
	}
}
