<%@ page import="grails.blog.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<meta name="layout" content="commentLayout">
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
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.title}">
					<li class="fieldcontain">
						<span id="title-label" class="property-label"><g:message code="post.title.label" default="Title" /></span>
						
							<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${postInstance}" field="title"/></span>
						
					</li>
				</g:if>
			
				
				<g:if test="${postInstance?.content}">
					<li class="fieldcontain">
						<span id="content-label" class="property-label"><g:message code="post.content.label" default="Content" /></span>
						
							<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${postInstance}" field="content"/></span>
					</li>
				</g:if>
			
				<g:if test="${postInstance?.dateCreated}">
					<li class="fieldcontain">
						<span id="dateCreated-label" class="property-label"><g:message code="post.dateCreated.label" default="Date Created" /></span>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${postInstance?.dateCreated}" /></span>
						
					</li>
				</g:if>
			</ol>
		</div>
		<div id="show-comments" class="content">
		</div>
	</body>
</html>
