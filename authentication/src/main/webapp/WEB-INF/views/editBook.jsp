<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Edit Entry</title>
<t:base>
<div class="container d-flex justify-content-between align-items-start mt-5">
	<h3 class="display-3">Change your Entry</h3>
	<a class="lead" href="/books">back to the shelves</a>
</div>
<div class="container">
	<form:form action="/books/${book.id}/edit" method="post" modelAttribute="book">
	<input type="hidden" name="_method" value="put">
	<form:input type="hidden" path="user" value="${user.id}"/>
	<div class="mb-3">
		<form:label for="title" class="form-label" path="title">Title</form:label>
		<form:errors path="title" class="text-danger"/>
		<form:input type="text" class="form-control" path="title" value="${book.title}"/>
	</div>
	<div class="mb-3">
		<form:label for="author" class="form-label" path="author">Author</form:label>
		<form:errors path="author" class="text-danger"/>
		<form:input type="text" class="form-control" path="author" value="${book.author}"/>
	</div>
	<div class="mb-3">
		<form:label for="thoughts" class="form-label" path="thoughts" value="${book.thoughts}">My thoughts</form:label>
		<form:errors path="thoughts" class="text-danger"/>
		<form:textarea class="form-control" path="thoughts"/>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>
</t:base>
	

