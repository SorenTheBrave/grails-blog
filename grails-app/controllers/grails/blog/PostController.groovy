package grails.blog

class PostController {

    def scaffold = Post
	def searchableService
	
	
	def search = {
		def query = params.q
		if(query){
			def srchResults = searchableService.search(query)
			render(template: 'srchResults', model: ['book':book])
		}
	}
}
