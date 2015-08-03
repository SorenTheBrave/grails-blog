<%@ page import="grails.blog.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="<g:resource dir="css" file="bootstrap.min.css"/>">
		<link rel="stylesheet" href="<g:resource dir="css" file="main-layout.css"/>">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.singlePost{
				width: 80%;
				margin-left: auto;
				margin-right: auto;
				border-radius: 25px;
				margin-top: 15px;
				margin-bottom: 15px;
				padding-left: 5px;
			}
			.singlePost h1{
				padding-left: 5px;
				padding-top: 5px;
				word-wrap: break-word;
			}
			.singlePost p{
				margin-left: auto;
				margin-right: auto;
				width: 80%;
				text-align: center;
				padding-bottom: 5px;
			}
			.singlePost p .dateValue{
				test-align: right;
			}
			.singlePost .date{
				margin-left: 55%;
				width: 40%;
				overflow: hidden;
			}
			
			.singlePost .dateValue{
				float: right;
				width: 65%;
			}
			
			.postContent{
				margin-top: 10px;
				margin-bottom: 10px;
				text-align: center;
				margin-left: auto;
				margin-right: auto;
				word-wrap: break-word;
				width: 90%;
			}
			
			#navButtons, #searchWidget{
				padding-top: 2%;
			}
			
			.odd{
				background-color: #dedede;
			}
			
			#greeting{
				margin-left: auto;
				margin-right: auto;
			}
			
			
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="nav row" role="navigation">
				<div class="col-xs-6">
					<div id="navButtons" class="btn-group col-xs-12">
						<a class="btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<g:link class="create btn btn-success" action="create"><g:message code="New Post" args="[entityName]" /></g:link>
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
			<div class="row">
				<div class="pagination col-xs-12">
					<g:paginate total="${postInstanceCount ?: 0}" class="btn"/>
				</div>
			</div>
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
						
							<div class="date"><p class="dateValue">Date posted: <g:formatDate date="${postInstance.dateCreated}" /></p></div>
						
						</div>
					</g:each>
				</g:if>
				<g:else>
					<g:each in="${postInstanceList}" status="i" var="postInstance">
						<div class="singlePost ${(i % 2) == 0 ? 'even' : 'odd'}">
							<h1><g:link action="show" params="[title:postInstance.title]">${fieldValue(bean: postInstance, field: "title")}</g:link></h1>
						
							<p>${fieldValue(bean: postInstance, field: "content")}</p>
						
							<div class="date"><p class="date">Date posted: <g:formatDate date="${postInstance.dateCreated}" /></p></div>
						
						</div>
					</g:each>
				</g:else>
			</div>
		</div>
		
		<div class="pagination">
			<g:paginate total="${postInstanceCount ?: 0}" />
		</div>
		<g:javascript>
			$(document).ready(function(){
				$("ul a").addClass("btn btn-primary");
				$(".pagination").addClass("btn-group");
				$(".pagination a").addClass("btn btn-primary");
				$(".pagination span").addClass("btn btn-default");
			});
		</g:javascript>
	</body>
</html>
