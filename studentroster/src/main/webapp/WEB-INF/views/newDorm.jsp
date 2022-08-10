<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Dorm</title>
<t:base>
<div class="container vh-100 d-flex align-items-center justify-content-center flex-column">
	<a href="/dorms">Dorms</a>
	<h6 class="display-6">New Dorm</h6>
	<form:form action="/dorms/new" method="post" modelAttribute="dorm">
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Name:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name" />
		</div>
		<button type="submit" class="btn btn-primary">Create</button>
	</form:form>
</div>
</t:base>
	
