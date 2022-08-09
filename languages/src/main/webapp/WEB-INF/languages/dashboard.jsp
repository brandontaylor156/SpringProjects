<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Languages</title>
<t:base>
<div class="container">
<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Creator</th>
			<th>Version</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="language" items="${languages}">
		<tr>
			<td><a href="/languages/${language.id}">${language.name}</a></td>
			<td>${language.creator}</td>
			<td>${language.version}</td>
			<td>
				<form action="/languages/${language.id}" method="post">
    			<input type="hidden" name="_method" value="delete">
    			<input type="submit" value="Delete">
				</form>
				<a href="/languages/edit/${language.id}">edit</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<form:form action="/languages/add" method="post" modelAttribute="language">
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Language:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name"/>
		</div>
		<div class="mb-3">
		  <form:label for="creator" class="form-label" path="creator">Creator:</form:label>
		  <form:errors path="creator" class="text-danger" />
		  <form:input type="text" class="form-control" path="creator"/>
		</div>
		<div class="mb-3">
		  <form:label for="version" class="form-label" path="version">Version:</form:label>
		  <form:errors path="version" class="text-danger" />
		  <form:input type="text" class="form-control" path="version"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>
</t:base>
	
