<%@ page import="grails.blog.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			#searchWidget{
				margin-left: 45%;
			}
			.singlePost{
				width: 80%;
				margin-left: auto;
				margin-right: auto;
				border-radius: 25px;
				margin-top: 15px;
				margin-bottom: 15px;
			}
			.singlePost h1{
				padding-left: 5px;
				padding-top: 5px;
			}
			.singlePost p{
				margin-left: auto;
				margin-right: auto;
				width: 80%;
				text-align: center;
				padding-bottom: 5px;
			}
			.singlePost .date{
				text-align: right;
			}
			.postContent{
				margin-top: 10px;
				margin-bottom: 10px;
			}
		</style>
	</head>
	<body>
		<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="New Post" args="[entityName]" /></g:link></li>
				<li id="searchWidget"><g:form action="search">
				<div class="search"><input type="text" name="q" id="searchBox" value="${params.q}"/><input type="submit" name="search" value="search" action="search" id="searchSubmit" /></div></g:form></li>
			</ul> <br/>
		</div>
		<div class="pagination">
			<g:paginate total="${postInstanceCount ?: 0}" />
		</div>
		<div id="list-post" class="content scaffold-list" role="main">
			<h1>Posts</h1> <hr/>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="postList">
				<g:if test="${params.q == nil}">
					<g:each in="${postInstanceList}" status="i" var="postInstance">
						<div class="singlePost ${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<h1><g:link action="show" params="[title:postInstance.title]">${fieldValue(bean: postInstance, field: "title")}</g:link></h1>
						
							<p class="postContent">${fieldValue(bean: postInstance, field: "content")}</p>
						
							<p class="date">Date posted: <g:formatDate date="${postInstance.dateCreated}" /></p>
						
						</div>
					</g:each>
				</g:if>
				<g:if test="${params.q != nil}">
					<g:each in="${postInstanceList}" status="i" var="postInstance">
						<div class="singlePost ${(i % 2) == 0 ? 'even' : 'odd'}">
							<h1><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "title")}</g:link></h1>
						
							<p>${fieldValue(bean: postInstance, field: "content")}</p>
						
							<p class="date"><g:formatDate date="${postInstance.dateCreated}" /></p>
						
						</div>
					</g:each>
				</g:if>
			</div>
			
			<div class="pagination">
				<g:paginate total="${postInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
