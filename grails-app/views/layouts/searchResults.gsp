<!DOCTYPE html>
<html>
<g:layoutHead>
	<div id="list-blog" class="content scaffold-list" role="main">
		<h1>Blog List</h1>
		<table>
			<thead>
				<tr>
				
					<th class="sortable" ><a href="/grails-blog/blog/index?sort=title&amp;max=10&amp;order=asc">Title</a></th>
				
					<th class="sortable" ><a href="/grails-blog/blog/index?sort=content&amp;max=10&amp;order=asc">Content</a></th>
				
					<th class="sortable" ><a href="/grails-blog/blog/index?sort=dateCreated&amp;max=10&amp;order=asc">Date Created</a></th>
				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${it.title}</td>
					<td>${it.content}</td>
					<td>${it.dateCreated}</td>
					<td>IT WORKED!</td>
				</tr>
			</tbody>
		</table>
	</div>
</html>