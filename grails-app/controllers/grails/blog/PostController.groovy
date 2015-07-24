package grails.blog

class PostController {

    def scaffold = Post
	def searchableService
	
	def search = {
			def query = params.q
			def srchResults = searchableService.search(query).results
			if(srchResults){
				render(view: 'index', model: [postInstanceList: srchResults])
			}else{
				render("No posts found!")
			}
	}
}