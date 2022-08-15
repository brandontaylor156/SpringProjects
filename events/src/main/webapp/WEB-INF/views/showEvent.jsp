<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>${event.name}</title>
<t:base>
<div class="container mt-5">
	<a href="/dashboard">Dashboard</a>

	<div class="row">
		<div class="col">
			<h3 class="display-3">${event.name}</h3>
			<p class="lead">Host: ${event.host.firstName} ${event.host.lastName}</p>
			<p class="lead">Date: ${event.date}</p>
			<p class="lead">Location: ${event.location}, ${event.state}</p>
			<p class="lead">People who are attending this event: ${event.users.size()}</p>
			<br/>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Location</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${event.users}">
					<tr>
						<td>${user.firstName} ${user.lastName}</td>
						<td>${user.location}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col">
			<h3 class="display-3">Message Wall</h3>
			
			<c:forEach var="comment" items="${event.comments}">
				<p><span class="fw-bold">${comment.commenter.firstName} ${comment.commenter.lastName} says:</span></p>
				<p>${comment.text}</p>
				<p>-------------------------------</p>
			</c:forEach>
			
			<form:form action="/events/${event.id}/comments" method="post" modelAttribute="comment">
			<form:input type="hidden" path="commenter" value="${id}"/>
			<form:input type="hidden" path="event" value="${event.id}"/>
				<div class="mb-3">
					<form:label for="text" class="form-label" path="text">Add Comment:</form:label>
					<form:errors path="text" class="text-danger" />
					<form:textarea class="form-control" path="text"/>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
	
		</div>
	</div>
	
</div>
</t:base>
	
	
