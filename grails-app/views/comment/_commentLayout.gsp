<g:each in="${comments}" var="userComment">
	<div class="singleComment">
		<h3><g:fieldValue bean="${userComment}" field="authorName"/></h3>
		<p class="postContent"><g:fieldValue bean="${userComment}" field="content"/></p>
		<p class="postDate">date posted: <g:fieldValue bean="${userComment}" field="dateCreated"/></p>
	</div>
</g:each>