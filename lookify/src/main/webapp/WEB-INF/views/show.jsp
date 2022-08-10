<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Details</title>
<t:base>
<div class="container mt-5">
<a href="/dashboard">Dashboard</a> 
	<h3 class="display-3">Song Details</h3>
	<div class="row">
		<div class="col-6">Title:</div>
		<div class="col-6">${song.title}</div>
	</div>
	<div class="row">
		<div class="col-6">Artist:</div>
		<div class="col-6">${song.artist}</div>
	</div>
	<div class="row">
		<div class="col-6">Rating (1-10):</div>
		<div class="col-6">${song.rating}</div>
	</div>
	<form action="/songs/${song.id}" method="post">
    	<input type="hidden" name="_method" value="delete">
    	<input type="submit" value="Delete">
	</form> 
</div>
</t:base>
	