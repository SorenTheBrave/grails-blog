package grails.blog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Comment)
@Mock([Post,Comment])
class CommentSpec extends Specification {

	def olderComment
	def youngerComment
	
    def setup() {
		def placeholderPost = new Post(title: 'test', content: 'test').save(failOnError: true)
	

	
		olderComment = new Comment(authorName: 'older', content: 'should be less', post: placeholderPost).save(failOnError: true)
		
		Thread.sleep(2000)				//Allow some time so that youngerComment has a newer dateCreated
										//Why isn't this working?! >:(
		
		youngerComment = new Comment(authorName: 'newer', content: 'should be more', post: placeholderPost).save(failOnError: true)
		placeholderPost.addToComments(olderComment).addToComments(youngerComment).save(failOnError: true)
    }

    def cleanup() {
    }
	
	def "test compareTo sorts comments in order newer < older"(){
		expect:
		olderComment.compareTo(youngerComment) > 0
	}
}
