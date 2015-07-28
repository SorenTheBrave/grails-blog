package grails.blog

class PostController {

    def scaffold = Post
	def searchableService
	
	def show = {
		def thisPost = Post.findByTitle(params.title)
		render(view: 'show.gsp', model: [postInstance: thisPost])
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