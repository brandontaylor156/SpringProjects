<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>The WatchList</title>
<t:base>
<div class="container">
	<h1 class="display-1 mt-5">Welcome, ${user.username}</h1>
	<a class="lead" href="/logout">Logout</a>
	<a class="lead" href="/movies/new">Add a Movie to Your Watch List</a>
	
	<h6 class="display-6">Global Watch List</h6>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Movie Title</th>
				<th>Genre</th>
				<th>Released Year</th>
				<th class="text-center">Actions</th>
				<th>Seen It?</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="movie" items="${globalWatchlist}">
			<tr>
				<td><a href="/movies/${movie.id}">${movie.title}</a></td>
				<td>${movie.genre}</td>
				<td>${movie.year}</td>
				<td class="text-center">
					<c:choose>
						<c:when test="${movie.creator.id == user.id}">
							<div class="row">
								<div class="col">
									<a href="/movies/${movie.id}/edit" class="btn btn-success">Edit</a>
								</div>
								<div class="col">
									<form action="/movies/${movie.id}/delete" method="post">
    									<input type="hidden" name="_method" value="delete">
    									<button class="btn btn-danger" type="submit">Delete</button>
									</form>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<p> Edit Delete </p>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${movie.users.contains(user)}">
							<form action="/movies/${movie.id}/cancel" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-warning" type="submit">Undo</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/movies/${movie.id}/join" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-primary" type="submit">Seen</button>
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h6 class="display-6">Your Watch List</h6>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Movie Title</th>
				<th>Genre</th>
				<th>Released Year</th>
				<th class="text-center">Actions</th>
				<th>Seen It?</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="movie" items="${yourWatchlist}">
			<tr>
				<td><a href="/movies/${movie.id}">${movie.title}</a></td>
				<td>${movie.genre}</td>
				<td>${movie.year}</td>
				<td class="text-center">
					<div class="row">
						<div class="col">
							<a href="/movies/${movie.id}/edit" class="btn btn-success">Edit</a>
						</div>
						<div class="col">
							<form action="/movies/${movie.id}/delete" method="post">
    							<input type="hidden" name="_method" value="delete">
    							<button class="btn btn-danger" type="submit">Delete</button>
							</form>
						</div>
					</div>
				</td>
				<td>
					<c:choose>
						<c:when test="${movie.users.contains(user)}">
							<form action="/movies/${movie.id}/cancel" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-warning" type="submit">Undo</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/movies/${movie.id}/join" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-primary" type="submit">Seen</button>
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</t:base>