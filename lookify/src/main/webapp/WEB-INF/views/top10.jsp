<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Top Songs</title>
<t:base>
<div class="container">
	<a href="/dashboard">Dashboard</a>
	<h3 class="display-3">Top Ten Songs</h3>
	<c:forEach var="song" items="${topTen}">
	<p>${song.rating} <a href="/songs/${song.id}">${song.title}</a> ${song.artist}</p>
</c:forEach>
</div>
</t:base>
	
