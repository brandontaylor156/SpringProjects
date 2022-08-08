<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Reading Books</title>
<t:base>
<div class="container d-flex vh-100 flex-column align-items-center justify-content-center">
	<h3 class="display-3">Title: <c:out value="${book.title}"/></h3>
	<p class="lead">Description: <c:out value="${book.description}"/></p>
	<p class="lead">Language: <c:out value="${book.language}"/></p>
	<p class="lead">Number of Pages: <c:out value="${book.numberOfPages}"/></p>
</div>
</t:base>
	
