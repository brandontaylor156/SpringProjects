<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Read Share</title>
<t:base>
<div class="container-fluid vh-100 d-flex flex-column align-items-center justify-content-center p-5">
	<h2 class="display-2">Save Travels</h2>
	<table class="table table striped">
		<thead>
			<tr>
				<th scope="col">Expense</th>
				<th scope="col">Vendor</th>
				<th scope="col">Amount</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expense" items="${expenses}">
			<tr>
				<td>${expense.name}</td>
				<td>${expense.vendor}</td>
				<td><fmt:formatNumber type="CURRENCY" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2" value="${expense.amount}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h4 class="display-4">Add an expense</h4>
	<form:form action="/expenses/add" method="post" modelAttribute="expense">
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Expense:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name"/>
		</div>
		<div class="mb-3">
		  <form:label for="vendor" class="form-label" path="vendor">Vendor:</form:label>
		  <form:errors path="vendor" class="text-danger" />
		  <form:input type="text" class="form-control" path="vendor"/>
		</div>
		<div class="mb-3">
		  <form:label for="amount" class="form-label" path="amount">Amount:</form:label>
		  <form:errors path="amount" class="text-danger" />
		  <form:input type="text" class="form-control" path="amount"/>
		</div>
		<div class="mb-3">
			<form:label for="description" class="form-label" path="description">Description:</form:label>
			<form:errors path="description" class="text-danger" />
			<form:input type="text" class="form-control" path="description"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>
</t:base>
	
