<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>The WatchList</title>
<t:base>
<div class="container mt-5">
	<h3 class="display-3">Movie Details</h3>
	<div class="in-line">
		<a href="/dashboard">Dashboard</a>
		<a href="/movies/new">Add a Movie to Your Watch List</a>
	</div>
	<h6 class="display-6">Movie Title: ${movie.title}</h6>
	<p class="lead">Seen by ${movie.users.size()} People</p>
	<p class="lead">Genre: ${movie.genre}</p>
	<p class="lead">Release Year: ${movie.year}</p>
	<p class="lead">Description: ${movie.description}</p>
	
	<c:if test="${movie.creator.id == id}">
	<div class="in-line">
		<a href="/movies/${movie.id}/edit">Edit</a>
		<a href="/movies/${movie.id}/delete">Delete</a>
	</div>
	</c:if>
</div>
</t:base>
	
