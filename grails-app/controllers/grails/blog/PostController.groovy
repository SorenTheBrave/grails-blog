package grails.blog

class PostController {

    def scaffold = Post
	def searchableService
	
	def show = {
		def thisPost = Post.findByTitle(params.title, [sort: 'dateCreated', order: 'desc'])
		def comments = thisPost.comments
		render(view: 'show.gsp', model: [postInstance: thisPost, comments: comments])
	}
	
	def save = {
		def thisPost = new Post(title: params.title, content: params.content).save(failOnError: true)
		render(view: 'show.gsp', model: [postInstance: thisPost, comments: thisPost.comments])
	}
	
	def search = {
		if(params.q){
			def query = params.q
			def srchResults = searchableService.search(query).results
			if(srchResults){
				render(view: 'index', model: [postInstanceList: srchResults])
			}else{
				render(view: 'noSearchResults')
			}
		}else{
			redirect(action: 'index')
		}
	}
}