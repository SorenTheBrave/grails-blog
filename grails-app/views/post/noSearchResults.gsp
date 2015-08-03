<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<link rel="stylesheet" href="<g:resource dir="css" file="bootstrap.min.css"/>">
	<link rel="stylesheet" href="<g:resource dir="css" file="main-layout.css"/>">
	<title>No posts found!</title>
	<style>
		#page-body{
			text-align: center;
		}
	</style>
	</head>
</head>
	<div class="nav row" role="navigation">
		<div class="col-xs-6">
			<div id="navButtons" class="btn-group col-xs-12">
				<a class="btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<g:link class="list btn btn-info" action="index"><g:message code="Post List" args="[entityName]" /></g:link>
				<g:link class="btn btn-success" action="create"><g:message code="New Post" args="[entityName]" /></g:link>
			</div>
		</div>
		<div id="searchWidget" class="search col-xs-6">
			<g:form action="search" class="input-group">
				<input type="text" name="q" class="form-control" id="searchBox" value="${params.q}"/>
				<span class="input-group-btn">
					<input class="btn btn-primary" type="submit" name="search" value="search" action="search" id="searchSubmit" />
				</span>
			</g:form>
		</div>
	</div>
	<div id="page-body" class="content scaffold-list" role="main">
		<h1 id="no_posts_message">No posts found! :(</h1>
		<p>You can click 'Post List' above, or search with an empty search box to show all posts again. </p>
	</div>
</html>