<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Questions Dashboard</title>
<t:base>
<div class="container">
	<h1 class="display-1 text-center m-5">Questions Dashboard</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Question</th>
				<th>Tags</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="question" items="${questions}">
			<tr>
				<td><a href="/questions/${question.id}">${question.question}</a></td>
				<td>
					<c:forEach var="tag" items="${question.tags}">${tag.subject}<c:if test = "${question.tags.indexOf(tag)<question.tags.size()-1}">, </c:if></c:forEach>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
<a class="lead" href="/questions/new">New Question</a>
</div>
</t:base>
	
