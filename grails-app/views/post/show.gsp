<%@ page import="grails.blog.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<style>
			#greeting{
				float:right;
				padding-right: 25%;
				padding-top: 4%;
			}
			#postComments{
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
			.singleComment{
				background-color: #efdcc2;
				border: 1px solid;
				border-radius: 15px;
				padding: 10px;
				width: 40%;
				margin-left: 25%;
				margin-bottom: 10px;
				word-wrap: break-word;
			}
			.postContent{
				padding: 10px;
			}
			.postDate{
				margin-left: 30%;
			}
			
			#showPost{
				width: 70%;
				margin-left: auto;
				margin-right: auto;
				border-radius: 25px;
				margin-top: 15px;
				margin-bottom: 15px;
				background-color: #efdcc2;
				border: 1px solid;
				border-radius: 15px;
				padding: 10px;
			}
			
			#postContent{
				text-align: center;
				margin-top: 10px;
				margin-left: auto;
				margin-right: auto;
				word-wrap: break-word;
				width: 90%;
			}
			
			#postDate{
				margin-left: 70%;
			}
			
			#newPostMessage{
				margin-left: auto;
				margin-right: auto;
				background-color: #d3c9ce;
				border: 1px solid;
				border-radius: 15px;
				padding: 5px;
				text-align: center;
			}
			
			#error{
				padding: 5px;
				margin-right: auto;
				margin-left: auto;
				color: red;
				background-color: #bfbdbd;
				border: 1px solid black;
				border-radius: 15px;
				text-align: center;
				width: 50%;
			}
		</style>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="Post List" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="New Post" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="View Post" args="[entityName]" /></h1>
			<g:if test="${message}">
				<p id="newPostMessage">Post '${params.title}' successfully added!</p>
			</g:if>
			<div id="showPost">
			
				<g:if test="${postInstance}">
					
						<h2><g:fieldValue bean="${postInstance}" field="title"/></h2>
				
					
						<p id="postContent"><g:fieldValue bean="${postInstance}" field="content"/></p>
				
					
						<p id="postDate"><g:formatDate date="${postInstance?.dateCreated}" /></p>
				</g:if>
			</div>
		</div>
		<h1 style="padding-left:3%">Comments on this Post</h1>
		<hr/><br/>
		<div id="userComments">
			<g:if test="${postInstance.comments}">
				<g:each in="${postInstance.comments}" var="userComment">
					<div class="singleComment">
						<h3><g:fieldValue bean="${userComment}" field="authorName"/></h3>
						<p class="postContent"><g:fieldValue bean="${userComment}" field="content"/></p>
						<p class="postDate">date posted: <g:fieldValue bean="${userComment}" field="dateCreated"/></p>
					</div>
				</g:each>
			</g:if>
		</div>
		
		<g:javascript> 
			function showError(){
				$("#error").show();
			}
			
			function clearFields(){
				alert('success');
				$("#error").hide();
			}
		</g:javascript>
		
		<!-- new comment form -->
		<h1 style="padding-left:3%">Add a comment</h1>
		<hr/><br/>
		<div id="error" hidden>Please enter your name and a comment before submitting!</div>
		<div id="postComments">
			<g:form id="newComment" name="remoteCommentForm">
				<input type="hidden" name="id" value="${postInstance.id}">
				<label for="commenterName" class="commentForm">Your name:</label> <input id="name" name="commenterName" class="commentForm"/><br/>
				<label for="commentContent" class="commentForm">Your comment:</label> <textArea id="comment" name="commentContent" class="commentForm"></textArea><br/>
				<g:submitToRemote name="submitComment" id="submitComment" value="submit" url="[controller: 'comment', action: 'postComment']" update="userComments" onFailure="showError()" onSuccess="clearFields()"/>
			</g:form>
		</div>
		
		<!-- Edit & Delete buttons at the bottom -->
		<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</body>
</html>
