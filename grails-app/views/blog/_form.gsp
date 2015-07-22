<%@ page import="grails.blog.Blog" %>



<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="blog.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${blogInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="blog.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="2000" required="" value="${blogInstance?.content}"/>

</div>

