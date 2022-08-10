<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>${dorm.name} Students</title>
<t:base>
<div class="container d-flex align-items-center justify-content-center flex-column mt-5">
	<h3 class="display-3">${dorm.name} Students</h3>
	<a href="/dorms">Dorms</a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Dorm</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="student" items="${dorm.students}">
			<tr>
				<td>${student.firstName} ${student.lastName}</td>
				<td><a href="/students/delete/${student.id}">Remove</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</t:base>
	
