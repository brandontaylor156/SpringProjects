<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>New Product</title>
<t:base>
<div class="container">
	<h3 class="display-3 text-center m-5">New Product</h3>
	<a href="/">Home</a>
	
	<form:form action="/products/new" method="post" modelAttribute="product">
	
	<div class="mb-3">
		<form:label for="name" class="form-label" path="name">Name</form:label>
		<form:errors path="name" class="text-danger"/>
		<form:input type="text" class="form-control" path="name"/>
	</div>
	<div class="mb-3">
		<form:label for="description" class="form-label" path="description">Description</form:label>
		<form:errors path="description" class="text-danger"/>
		<form:input type="text" class="form-control" path="description"/>
	</div>
	<div class="mb-3">
		<form:label for="price" class="form-label" path="price">Price</form:label>
		<form:errors path="price" class="text-danger"/>
		<form:input type="text" class="form-control" path="price"/>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>

</t:base>
	
