<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Dashboard</title>
<t:base>
<div class="container d-flex justify-content-between mt-5">
	<div>
		<h1 class="display-1">Welcome, ${username}</h1>
		<p class="lead">Books from everyone's shelves:</p>
	</div>
	<div>
		<a href="/logout">logout</a>
		<a href="/books/new">+ Add a book to my shelf!</a>
	</div>
</div>
<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books}">
			<tr>
				<td>${book.id}</td>
				<td><a href="/books/${book.id}">${book.title}</a></td>
				<td>${book.author}</td>
				<td>${book.user.username}</td>
				<td>
				<c:if test="${book.user.id == userId}">
					<a href="/books/${book.id}/edit" class="btn btn-sm btn-primary">Edit</a>
					<form action="/books/${book.id}/delete" method="post">
    					<input type="hidden" name="_method" value="delete">
    					<button class="btn btn-sm btn-danger" type="submit">Delete</button>
					</form>
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


</t:base>
	
