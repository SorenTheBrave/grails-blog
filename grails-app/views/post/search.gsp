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
			<h1>Posts "${params.q}"</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'post.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'post.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'post.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:if test="${params.q == nil}">
					<g:each in="${postInstanceList}" status="i" var="postInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "title")}</g:link></td>
						
							<td>${fieldValue(bean: postInstance, field: "content")}</td>
						
							<td><g:formatDate date="${postInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
				</g:if>
				<g:if test="${params.q != nil}">
					<g:each in="${postInstanceList}" status="i" var="postInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "title")}</g:link></td>
						
							<td>${fieldValue(bean: postInstance, field: "content")}</td>
						
							<td><g:formatDate date="${postInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
				</g:if>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${postInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
