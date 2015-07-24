<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>No posts found!</title>
	<style type="text/css" media="screen">

			#page-body {
				margin-left: auto;
				margin-right: auto;
			}
			
			h1#no_posts_message {
				padding-top: 5%;
				padding-left: 40% !important;
				padding-bottom: 5% !important;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}
			
			#searchWidget{
				margin-left: 45%;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
</head>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="create" action="create"><g:message code="New Post" args="[entityName]" /></g:link></li>
			<li id="searchWidget"><g:form action="search">
			<div class="search"><input type="text" name="q" id="searchBox" value="${params.q}"/><input type="submit" name="search" value="search" action="search" id="searchSubmit" /></div></g:form></li>
		</ul>
	</div>
	<div id="page-body" class="content scaffold-list" role="main">
		<h1 id="no_posts_message">No posts found! :(</h1>
	</div>
</html>