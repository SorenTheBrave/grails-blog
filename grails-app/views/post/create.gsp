<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="<g:resource dir="css" file="bootstrap.min.css"/>">
		<link rel="stylesheet" href="<g:resource dir="css" file="main-layout.css"/>">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row nav" role="navigation">
			<div class="btn-group">
				<a class="home btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
				<g:link class="list btn btn-info" action="index"><g:message code="Post List" args="[entityName]" /></g:link>
			</div>
		</div>
		<div class="row content">
			
			<div id="create-post" class="scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
		</div>
		<div class="row">
			<div class="col-xs-6 col-xs-offset-3">
				<g:form url="[resource:postInstance, action:'save']" class="form-group">
					<fieldset class="form">
						<g:render template="form" class="form-control"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
