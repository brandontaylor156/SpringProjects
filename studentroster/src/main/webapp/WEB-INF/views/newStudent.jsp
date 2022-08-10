<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Student</title>
<t:base>
<div class="container vh-100 d-flex align-items-center justify-content-center flex-column">
	<a href="/dorms">Dorms</a>
	<form:form action="/students/new" method="post" modelAttribute="student">
		<div class="mb-3">
			<form:label for="firstName" class="form-label" path="firstName">First Name:</form:label>
			<form:errors path="firstName" class="text-danger" />
			<form:input type="text" class="form-control" path="firstName" />
		</div>
		<div class="mb-3">
			<form:label for="lastName" class="form-label" path="lastName">Last Name:</form:label>
			<form:errors path="firstName" class="text-danger" />
			<form:input type="text" class="form-control" path="lastName" />
		</div>
		<div class="mb-3">
			<form:label for="dorm" class="form-label" path="dorm">Dorm:</form:label>
			<form:errors path="dorm" class="text-danger" />
			<form:select path="dorm">
				<c:forEach var="dorm" items="${dorms}">
				<form:option value="${dorm.id}">
					${dorm.name}
				</form:option>
				</c:forEach>
			</form:select>
		</div>
		<button type="submit" class="btn btn-primary">Add</button>
	</form:form>
</div>
</t:base>
	
