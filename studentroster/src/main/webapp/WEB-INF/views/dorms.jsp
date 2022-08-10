<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Dorms</title>
<t:base>
<div class="container d-flex align-items-center justify-content-center flex-column">
	<h3 class="display-3">Dorms</h3>
	<div>
		<a href="/dorms/new">Add a new dorm</a> | <a href="/students/new">Add a new student</a>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Dorm</th>
				<th>Students</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dorm" items="${dorms}">
			<tr>
				<td><a href="/dorms/${dorm.id}">${dorm.name}</a></td>
				<td>${dorm.students.size()}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</t:base>
	
