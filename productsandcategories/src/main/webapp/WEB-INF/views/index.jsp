<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Home</title>
<t:base>
<div class="container">
	<h3 class="display-3 text-center m-5">Home Page</h3>
	<a class="lead" href="/products/new">New Product</a>
	<a class="lead" href="/categories/new">New Category</a>
</div>
<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th>Products</th>
				<th>Categories</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<ul>
						<c:forEach var="product" items="${products}">
						<li><a href="/products/${product.id}">${product.name}</a></li>
						</c:forEach>
					</ul>
				</td>
				<td>
					<ul>
						<c:forEach var="category" items="${categories}">
						<li><a href="/categories/${category.id}">${category.name}</a></li>
						</c:forEach>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</t:base>
	
