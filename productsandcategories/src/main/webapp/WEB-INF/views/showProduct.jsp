<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Product Page</title>
<t:base>
<div class="container">
	<h1 class="display-1 text-center m-5">${product.name}</h1>
	<a class="lead" href="/">Home</a>
	<h3 class="display-3">Categories:</h3>
	<ul>
		<c:forEach var="category" items="${product.categories}">
		<li>${category.name}</li>
		</c:forEach>
	</ul>
	
	<c:if test="${categories.size() > 0}">
	<form action="/products/${product.id}/addCategory" method="post">
	<input type="hidden" name="_method" value="put">
		<div class="mb-3">
			<label for="categories" class="form-label">Category:</label>
			<select name="category">
				<c:forEach var="category" items="${categories}">
				<option value="${category.id}">
					${category.name}
				</option>
				</c:forEach>
			</select>
			<button type="submit" class="btn btn-primary">Add Category</button>
		</div>
	</form>
	</c:if>
</div>
</t:base>
	
