<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>${language.name}</title>
<t:base>
<div class="container">
<a href="/languages/edit/${language.id}">Edit</a> 
	<form action="/languages/${language.id}" method="post">
    	<input type="hidden" name="_method" value="delete">
    	<input type="submit" value="Delete">
	</form> 
	<h3 class="display-3">Language Details</h3>
	<div class="row">
		<div class="col-6">Name:</div>
		<div class="col-6">${language.name}</div>
	</div>
	<div class="row">
		<div class="col-6">Creator:</div>
		<div class="col-6">${language.creator}</div>
	</div>
	<div class="row">
		<div class="col-6">Version:</div>
		<div class="col-6">${language.version}</div>
	</div>
</div>
</t:base>
	
