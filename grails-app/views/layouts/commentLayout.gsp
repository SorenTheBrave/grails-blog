<%@ page import="grails.blog.Post" %>
<%@ page import="grails.blog.Comment" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<g:javascript library="jquery" plugin="jquery"/>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<style>
			#greeting{
				float:right;
				padding-right: 25%;
				padding-top: 4%;
			}
			#comments{
				width: 40%;
				margin-left: 20%;
			}
			.commentForm{
				margin-top: 10px;
				margin-bottom: 10px;
			}
			#commenterName{
				margin-left: 6.5%;
			}
			#submitComment{
				margin-left: 40%;
			}
			.postComments{
				background-color: #efdcc2;
				border: 1px solid;
				border-radius: 15px;
				padding: 10px;
				width: 40%;
				margin-left: 20%;
				margin-bottom: 10px;
			}
			.postContent{
				padding: 10px;
			}
			.postDate{
				margin-left: 30%;
			}
		</style>
	</head>
	<body>
		<div id="blogLogo" role="banner"><asset:image src="blog.jpg" id="postIt" alt="My blog!"/><h1 id="greeting"><i>Manifest Blog - Making blogging happen &#169;</i></h1></div>
		<g:layoutBody/>

		<!-- post comments go here! -->		
		<g:if test="${postInstance.comments}">
			<h1 style="padding-left:3%">Comments on this Post</h1>
			<hr/><br/>
			<g:each in="${postInstance.comments}" var="userComment">
				<div class="postComments">
					<h3>${userComment.authorName}</h3>
					<p class="postContent">${userComment.content}</p>
					<p class="postDate">date posted: ${userComment.dateCreated}</p>
				</div>
			</g:each>
		</g:if>
		
		<!-- new post form -->
		<h1 style="padding-left:3%">Add a comment</h1>
		<hr/><br/>
		<div id="comments">
			<form id="newComment">
				<label for="commenterName" class="commentForm">Your name:</label> <g:textField name="commenterName" class="commentForm"/><br/>
				<label for="comment" class="commentForm">Your comment:</label> <g:textArea name="comment" class="commentForm" /><br/>
				<g:submitButton name="submitComment" value="submit" class="commentForm"/>
			<form>
		</div>
		
		<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
	</body>
</html>