<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>${language.name}</title>
<t:base>
<div class="container">
	<form action="/languages/${language.id}" method="post">
    	<input type="hidden" name="_method" value="delete">
    	<input type="submit" value="Delete">
	</form>
	<a class="lead" href="/languages">Dashboard</a>
	<h4 class="display-4">Edit language</h4>
	<form:form action="/languages/edit/${language.id}" method="post" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Name:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name" value="${language.name}"/>
		</div>
		<div class="mb-3">
		  <form:label for="creator" class="form-label" path="creator">Creator:</form:label>
		  <form:errors path="creator" class="text-danger" />
		  <form:input type="text" class="form-control" path="creator" value="${language.creator}"/>
		</div>
		<div class="mb-3">
		  <form:label for="version" class="form-label" path="version">Version:</form:label>
		  <form:errors path="version" class="text-danger" />
		  <form:input type="text" class="form-control" path="version" value="${language.version}"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>
</t:base>
	

	