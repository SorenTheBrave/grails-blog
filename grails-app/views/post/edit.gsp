<%@ page import="grails.blog.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="<g:resource dir="css" file="bootstrap.min.css"/>">
		<link rel="stylesheet" href="<g:resource dir="css" file="main-layout.css"/>">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<div class="btn-group">
				<a class="home btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list btn btn-info" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create btn btn-success" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
		</div>
		<div id="edit-post" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${postInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${postInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="row">
				<div class="col-xs-6 col-xs-offset-3">
					<g:form url="[resource:postInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${postInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
