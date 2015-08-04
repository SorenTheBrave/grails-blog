package grails.blog

import grails.test.mixin.TestFor
import grails.test.mixin.Mock
import grails.test.mixin.web.ControllerUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PostController)
@Mock([Post,Comment, PostController])
class PostControllerSpec extends Specification {

    def setup() {
		def p = new Post(title: 'Comment on this', content: 'Comment ALL THE THINGS!!!').save(failOnError: true)
		def c = new Comment(authorName: 'Alex', content: 'A comment, whatever', post: p).save(failOnError: true)
		p.addToComments(c).save(failOnError: true)
    }

    def cleanup() {
    }

    void "test that show displays post"() {
		when:
		params.title = 'Comment on this'
		controller.show()
		
		then:
		view == '/post/show.gsp'
		model.postInstance.title == 'Comment on this'
		model.postInstance.content == 'Comment ALL THE THINGS!!!'
		model.postInstance.comments != null
    }
	
	void "test that save persists post data"(){
		when:
		params.title = 'test post'
		params.content = 'test content'
		controller.save()
		
		then:
		view == '/post/show.gsp'
		model.postInstance.title == 'test post'
		model.postInstance.content == 'test content'
	}
	
	void "test that search for empty string shows all posts"(){
		when:
		params.q = ""
		controller.search()
		
		then:
		response.redirectedUrl == '/post/index'
	}
	
	void "test that valid search returns persisted posts"(){
		when:
		params.q = 'Comment'
		controller.search()
		
		then:
		postInstanceList[0] != null
		postInstanceList[0].title == 'Comment on this'
		postInstanceList[0].content == 'Comment ALL THE THINGS!!!'
	}
	
	void "test that a search that finds no posts displays a relevant message"(){
		when:
		params.q = 'nothiiiiiiing'
		controller.search()
		
		then:
		view == 'post/noSearchResults'
	}
}
