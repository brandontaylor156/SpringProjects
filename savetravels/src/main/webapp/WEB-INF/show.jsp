<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Show Expense</title>
<t:base>
<a href="/expenses">go back</a>
<div class="container">
	<h3 class="display-3">Expense Details</h3>
	<div class="row">
		<div class="col-6">Expense Name:</div>
		<div class="col-6">${expense.name}</div>
	</div>
	<div class="row">
		<div class="col-6">Expense Description:</div>
		<div class="col-6">${expense.description}</div>
	</div>
	<div class="row">
		<div class="col-6">Vendor:</div>
		<div class="col-6">${expense.vendor}</div>
	</div>
	<div class="row">
		<div class="col-6">Amount Spent:</div>
		<div class="col-6"><fmt:formatNumber type="CURRENCY" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2" value="${expense.amount}"/></div>
	</div>
</div>
</t:base>
	
