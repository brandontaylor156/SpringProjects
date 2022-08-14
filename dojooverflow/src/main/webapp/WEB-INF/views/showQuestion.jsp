<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Question Profile</title>
<t:base>
<div class="container">
	<a href="/questions">Dashboard</a>
	<h1 class="display-1 m-3">${question.question}</h1>
	<h3 class="display-3">Tags:</h3>
	
	<h3 class="in-line">
		<c:forEach var="tag" items="${question.tags}">
			<button type="button">${tag.subject}</button>
		</c:forEach>
	</h3>
	
	<div class="row">
		<div class="col">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Answers</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="answer" items="${question.answers}">
					<tr>
						<td>${answer.answer}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col">
			<form:form action="/questions/${question.id}" method="post" modelAttribute="Answer">
			<form:input type="hidden" path="question" value="${question.id}"/>
			<div class="mb-3">
				<form:label for="answer" class="form-label" path="answer">Answer:</form:label>
				<form:errors path="answer" class="text-danger" />
				<form:textarea class="form-control" path="answer"/>
			</div>
			<button type="submit" class="btn btn-primary">Create</button>
			</form:form>
		</div>
	</div>
</div>
</t:base>
	
