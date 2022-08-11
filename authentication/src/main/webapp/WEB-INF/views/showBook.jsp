<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>${book.title}</title>
<t:base>
<div class="container d-flex justify-content-between align-items-start mt-5">
	<h3 class="display-3">${book.title}</h3>
	<a href="/books">back to the shelves</a>
</div>
<div class="container">
	<h6 class="display-6"><span class="text-danger">${book.user.username}</span> read <span class="text-primary">${book.title}</span> by <span class="text-success">${book.author}</span></h6>
	<h6 class="display-6">Here are Bella's thoughts:</h6>
	<p class="lead mt-5">${book.thoughts}</p>
</div>
<div class="container">
	<c:if test="${book.user.id == userId}">
		<a href="/books/${book.id}/edit" class="btn btn-primary">Edit</a>
		<form action="/books/${book.id}/delete" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<button class="btn btn-danger" type="submit">Delete</button>
		</form>
	</c:if>
</div>
</t:base>
	
