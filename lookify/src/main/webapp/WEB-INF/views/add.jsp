<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Add Song</title>
<t:base>
<div class="container mt-5">
	<a href="/dashboard">Dashboard</a>
	<form:form action="/songs/new" method="post" modelAttribute="song">
		<div class="mb-3">
			<form:label for="title" class="form-label" path="title">Title:</form:label>
			<form:errors path="title" class="text-danger" />
			<form:input type="text" class="form-control" path="title"/>
		</div>
		<div class="mb-3">
		  <form:label for="artist" class="form-label" path="artist">Artist:</form:label>
		  <form:errors path="artist" class="text-danger" />
		  <form:input type="text" class="form-control" path="artist"/>
		</div>
		<div class="mb-3">
		  <form:label for="rating" class="form-label" path="rating">Rating:</form:label>
		  <form:errors path="rating" class="text-danger" />
		  <form:input type="number" class="form-control" path="rating"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>
</t:base>
	
