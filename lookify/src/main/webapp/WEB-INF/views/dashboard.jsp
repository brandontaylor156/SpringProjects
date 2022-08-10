<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Lookify!</title>
<t:base>
<div class="container mt-5">
	<div class="d-flex justify-content-between">
		<a href="/songs/new">Add New</a>
		<a href="/search/topTen">Top Songs</a>
		<form action="/search">
			<input type="search" name="search">
			<input type="submit" value="Search"> 
		</form>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Title</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="song" items="${songs}">
			<tr>
				<td><a href="/songs/${song.id}">${song.title}</a></td>
				<td>${song.rating}</td>
				<td>
					<form action="/songs/${song.id}" method="post">
    				<input type="hidden" name="_method" value="delete">
    				<input type="submit" value="Delete">
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</t:base>
	
