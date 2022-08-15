<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Project Details</title>
<t:base>
<div class="container mt-5">
	<a href="/dashboard">Dashboard</a>

	<div class="row">
		<div class="col">
			<p class="lead">Project:</p>
		</div>
		<div class="col">
			<p class="lead">${project.title}</p>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<p class="lead">Description:</p>
		</div>
		<div class="col">
			<p class="lead">${project.description}</p>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<p class="lead">Due Date:</p>
		</div>
		<div class="col">
			<p class="lead">${project.dueDate}</p>
		</div>
	</div>
	<c:if test="${project.lead.id == id}">
		<a href="/projects/${project.id}/edit" class="btn btn-success">Edit</a>
		<form action="/projects/${project.id}/delete" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<button class="btn btn-danger" type="submit">Delete</button>
		</form>
	</c:if>
	<c:forEach var="user" items="${project.users}">
		<c:if test="${user.id == id}">
			<a href="/projects/${project.id}/tasks">See tasks</a>
		</c:if>
	</c:forEach>
	
</div>
</t:base>
	
	
