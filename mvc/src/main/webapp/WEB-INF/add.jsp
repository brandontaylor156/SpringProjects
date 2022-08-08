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
	<form action="/books/add" method="post">
		<div class="mb-3">
			<label for="title" class="form-label">Title:</label>
			<input type="text" class="form-control" name="title">
		</div>
		<div class="mb-3">
		  <label for="description" class="form-label">Description:</label>
		  <input type="text" class="form-control" name="description">
		</div>
		<div class="mb-3">
		  <label for="language" class="form-label">Language:</label>
		  <input type="text" class="form-control" name="language">
		</div>
		<div class="mb-3">
			<label for="pages" class="form-label">Pages:</label>
			<input type="number" class="form-control" min="100" name="pages">
		</div>
		<button type="submit" class="btn btn-primary">Send</button>
	</form>
</div>
</t:base>
	
