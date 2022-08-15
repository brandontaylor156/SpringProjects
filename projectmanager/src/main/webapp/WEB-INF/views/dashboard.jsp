<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Project Manager Dashboard</title>
<t:base>
<div class="container">
	<h1 class="display-1 m-5">Welcome, ${user.firstName}!</h1>
	<div class="in-line">
		<a class="lead" href="/projects/new">New Project</a>
		<a class="lead" href="/logout">Logout</a>
	</div>
	
	<h6 class="display-6">All Projects</h6>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Project</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${otherProjects}">
			<tr>
				<td><a href="/projects/${project.id}">${project.title}</a></td>
				<td>${project.lead.firstName} ${project.lead.lastName}</td>
				<td>${project.dueDate}</td>
				<td>
					<form action="/projects/${project.id}/join" method="post">
    					<input type="hidden" name="_method" value="put">
    					<button class="btn btn-primary" type="submit">join Team</button>
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h6 class="display-6">Your Projects</h6>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Project</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${projects}">
			<tr>
				<td><a href="/projects/${project.id}">${project.title}</a></td>
				<td>${project.lead.firstName} ${project.lead.lastName}</td>
				<td>${project.dueDate}</td>
				<td>
					<c:choose> 
						<c:when test="${project.lead.id == user.id}">
							<a href="/projects/${project.id}/edit" class="btn btn-success">edit</a>
							<form action="/projects/${project.id}/delete" method="post">
    							<input type="hidden" name="_method" value="delete">
    							<button class="btn btn-danger" type="submit">delete</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/projects/${project.id}/leave" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-warning" type="submit">Leave</button>
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