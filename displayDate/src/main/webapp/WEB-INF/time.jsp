<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<t:base>
	<div onload="displayInfo('time')" class="d-flex vh-100 align-items-center justify-content-center">
		<h1 id="time"><c:out value="${time}"/></h1>
	</div>
</t:base>

