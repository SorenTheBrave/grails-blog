package grails.blog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(CommentController)
@Mock([Post,Comment])
class CommentControllerSpec extends Specification {

    def setup() {
		def p = new Post(title: 'Comment on this', content: 'Comment ALL THE THINGS!!!').save(failOnError: true)
    }

    def cleanup() {
    }

    void testPostComment() {
		when:
		params.commenterName = 'test'
		params.commentContent = 'something'
		params.id = 1
		controller.postComment()
		
		then:
		response.text == "\r\n\t<div class=\"singleComment\">\r\n\t\t<h3>test</h3>\r\n\t\t<p class=\"postContent\">something</p>\r\n\t\t<p class=\"postDate\">date posted: </p>\r\n\t</div>\r\n"
    }
}
