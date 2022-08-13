<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Category Page</title>
<t:base>
<div class="container">
	<h1 class="display-1 text-center m-5">${category.name}</h1>
	<a class="lead" href="/">Home</a>
	<h3 class="display-3">Products:</h3>
	<ul>
		<c:forEach var="product" items="${category.products}">
		<li>${product.name}</li>
		</c:forEach>
	</ul>
	
	<c:if test="${products.size() > 0}">
	<form action="/categories/${category.id}/addProduct" method="post">
	<input type="hidden" name="_method" value="put">
		<div class="mb-3">
			<label for="products" class="form-label">Product:</label>
			<select name="product">
				<c:forEach var="product" items="${products}">
				<option value="${product.id}">
					${product.name}
				</option>
				</c:forEach>
			</select>
			<button type="submit" class="btn btn-primary">Add Product</button>
		</div>
	</form>
	</c:if>
</div>
</t:base>
	
