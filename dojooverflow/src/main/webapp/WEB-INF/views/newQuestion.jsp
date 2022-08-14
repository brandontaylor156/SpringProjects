<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Question</title>
<t:base>
<div class="container">
	<a href="/questions">Dashboard</a>
	<h1 class="display-1 text-center m-5">What is your question?</h1>
	<form:form action="/questions/new" method="post" modelAttribute="Question">
		<div class="mb-3">
		<form:label for="question" class="form-label" path="question">Question:</form:label>
			<form:errors path="question" class="text-danger" />
			<form:input type="text" class="form-control" path="question"/>
		</div>
		<div class="mb-3">
		<label for="list" class="form-label">Tags:</label>
			<h6 class="text-danger">${errorMsg}</h6>	
			<input type="text" class="form-control" name="list"/>
		</div>
		<button type="submit" class="btn btn-primary">Create</button>
	</form:form>
</div>
</t:base>
	
