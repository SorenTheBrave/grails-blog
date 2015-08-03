<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to your new blog!</title>
		<link rel="stylesheet" href="<g:resource dir="css" file="bootstrap.min.css"/>">
		<link rel="stylesheet" href="<g:resource dir="css" file="main-layout.css"/>">
		<style type="text/css" media="screen">

			#page-body {
				margin-left: auto;
				margin-right: auto;
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

			#page-body{
				margin-top: 0;
				text-align: center;
				width: 60%;
				margin-left: auto;
				margin-right: auto;
			}
			
		</style>
	</head>
	<body>
		<div id="page-body" role="main">
			<h1>Welcome to your new blog!</h1>
			<a id="login" href="/grails-blog/post/index" class="btn btn-primary">Check it out!</a>
		</div>
	</body>
</html>
