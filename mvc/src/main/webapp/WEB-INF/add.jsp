<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Reading Books</title>
<t:base>
<div class="container d-flex vh-100 flex-column align-items-center justify-content-center">
	<h4 class="display-4">New Book</h4>
	<form:form action="/books/add" method="post" modelAttribute="book">
		<div class="mb-3">
			<form:label for="title" class="form-label" path="title">Title:</form:label>
			<form:errors path="title" class="text-danger" />
			<form:input type="text" class="form-control" path="title"/>
		</div>
		<div class="mb-3">
		  <form:label for="description" class="form-label" path="description">Description:</form:label>
		  <form:errors path="description" class="text-danger" />
		  <form:input type="text" class="form-control" path="description"/>
		</div>
		<div class="mb-3">
		  <form:label for="language" class="form-label" path="language">Language:</form:label>
		  <form:errors path="language" class="text-danger" />
		  <form:input type="text" class="form-control" path="language"/>
		</div>
		<div class="mb-3">
			<form:label for="numberOfPages" class="form-label" path="numberOfPages">Pages:</form:label>
			<form:errors path="numberOfPages" class="text-danger" />
			<form:input type="number" class="form-control" min="100" path="numberOfPages"/>
		</div>
		<button type="submit" class="btn btn-primary">Send</button>
	</form:form>
</div>
</t:base>
	
