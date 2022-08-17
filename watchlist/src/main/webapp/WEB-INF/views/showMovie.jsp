<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>The WatchList</title>
<t:base>
<div class="container mt-3">
	<h3 class="display-3">Movie Details</h3>
	<div class="in-line">
		<a href="/dashboard" class="lead">Dashboard</a>
		<a href="/movies/new" class="lead">Add a Movie to Your Watch List</a>
	</div>
	<h6 class="display-6">Movie Title: ${movie.title}</h6>
	<p class="lead"><span class="fw-bold">Posted by:</span> ${movie.creator.username}</p>
	<p class="lead"><span class="fw-bold">Seen by:</span> ${movie.users.size()} People</p>
	<p class="lead"><span class="fw-bold">Genre:</span> ${movie.genre}</p>
	<p class="lead"><span class="fw-bold">Release Year:</span> ${movie.year}</p>
	<p class="lead"><span class="fw-bold">Description:</span> ${movie.description}</p>
	
	<c:if test="${movie.creator.id == id}">
	<div class="d-flex align-items-center gap-2">
		<a href="/movies/${movie.id}/edit" class="btn btn-info">Edit</a>
		<form class="mb-0" action="/movies/${movie.id}/delete" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<button class="btn btn-danger" type="submit">Delete</button>
		</form>
	</div>
	</c:if>
</div>
</t:base>
	
