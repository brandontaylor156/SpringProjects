<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<title>The WatchList</title>
<t:base>
	<div class="container">
		<h1 class="display-1 mt-5">Welcome, ${user.username}</h1>
		<a class="lead" href="/logout">Logout</a> <a class="lead"
			href="/movies/new">Add a Movie to Your Watch List</a>

		<form action="/movies/search">
			<input type="search" name="search"> <input type="submit"
				value="Search">
		</form>

		<h6 class="display-6">Global Watch List</h6>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Movie Title</th>
					<th>Genre</th>
					<th>Released Year</th>
					<th>Actions</th>
					<th>Seen It?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="movie" items="${globalWatchlist}">
					<tr>
						<td class="align-middle"><a href="/movies/${movie.id}">${movie.title}</a></td>
						<td class="align-middle">${movie.genre}</td>
						<td class="align-middle">${movie.year}</td>
						<td class="d-flex align-items-center gap-2">
							<c:choose>
								<c:when test="${movie.creator.id == user.id}">

									<a href="/movies/${movie.id}/edit" class="btn btn-success">Edit</a>
									<form class="mb-0" action="/movies/${movie.id}/delete" method="post">
										<input type="hidden" name="_method" value="delete">
										<button class="btn btn-danger" type="submit">Delete</button>
									</form>
									
								</c:when>
								<c:otherwise>
									<button class="btn btn-success" disabled>Edit</button>
									<button class="btn btn-danger" disabled>Delete</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${movie.users.contains(user)}">
									<form class="mb-0" action="/movies/${movie.id}/cancel" method="post">
										<input type="hidden" name="_method" value="put">
										<button class="btn btn-warning" type="submit">Undo</button>
									</form>
								</c:when>
								<c:otherwise>
									<form class="mb-0" action="/movies/${movie.id}/join" method="post">
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
					<th>Actions</th>
					<th>Seen It?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="movie" items="${yourWatchlist}">
					<tr>
						<td class="align-middle"><a href="/movies/${movie.id}">${movie.title}</a></td>
						<td class="align-middle">${movie.genre}</td>
						<td class="align-middle">${movie.year}</td>
						<td class="d-flex align-items-center gap-2">
							<a href="/movies/${movie.id}/edit" class="btn btn-success">Edit</a>
							<form class="mb-0" action="/movies/${movie.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete">
								<button class="btn btn-danger" type="submit">Delete</button>
							</form>
						</td>
						<td><c:choose>
								<c:when test="${movie.users.contains(user)}">
									<form class="mb-0" action="/movies/${movie.id}/cancel" method="post">
										<input type="hidden" name="_method" value="put">
										<button class="btn btn-warning" type="submit">Undo</button>
									</form>
								</c:when>
								<c:otherwise>
									<form class="mb-0" action="/movies/${movie.id}/join" method="post">
										<input type="hidden" name="_method" value="put">
										<button class="btn btn-primary" type="submit">Seen</button>
									</form>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</t:base>