<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>The WatchList</title>
<t:base>
<div class="container mt-5">
	<a href="/logout">Logout</a>
	<a href="/dashboard">Dashboard</a>
	<h3 class="display-3">Add Movie</h3>
	<form:form action="/movies/new" method="post" modelAttribute="movie">
		<input type="hidden" name="creator" value="${id}">
		<div class="mb-3">
			<form:label for="title" class="form-label" path="title">Movie Title:</form:label>
			<form:errors path="title" class="text-danger" />
			<form:input type="text" class="form-control" path="title"/>
		</div>
		<div class="mb-3">
			<form:label for="genre" class="form-label" path="genre">Genre:</form:label>
			<form:errors path="genre" class="text-danger" />
			<form:input type="text" class="form-control" path="genre"/>
		</div>
		<div class="mb-3">
			<form:label for="year" class="form-label" path="year">Release:</form:label>
			<form:errors path="year" class="text-danger" />
			<form:input type="number" value="2022" class="form-control" path="year"/>
		</div>
		<div class="mb-3">
			<form:label for="description" class="form-label" path="description">Description:</form:label>
			<form:errors path="description" class="text-danger" />
			<form:textarea class="form-control" path="description"/>
		</div>
		<div class="in-line">
			<a class="btn btn-danger" href="/dashboard">Cancel</a>
			<button type="submit" class="btn btn-primary">Add Movie</button>
		</div>
	</form:form>
</div>
</t:base>
	
