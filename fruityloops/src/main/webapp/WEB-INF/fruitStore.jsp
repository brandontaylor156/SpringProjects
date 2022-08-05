<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<title>Fruity Loops</title>
<t:base>
	<h1 class="display-1">Fruit Store</h1>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fruit" items="${fruits}">
					<tr>
						<td><c:out value="${fruit.getName()}"></c:out></td>
						<td><c:out value="${fruit.getPrice()}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</t:base>
	
