<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Date</title>
<t:base>
	<div onload="displayInfo('date')" class="d-flex vh-100 align-items-center justify-content-center">
		<h1 id="date"><c:out value="${date}"/></h1>
	</div>
</t:base>
