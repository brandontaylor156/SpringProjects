<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title></title>
<t:base>
<div class="d-flex vh-100 align-items-center justify-content-center flex-column">
	<h1 class="display-1">Welcome User!</h1>
	<div class="lead d-flex">
		<a href="/your_server/counter">counter page</a>
	</div>
</div>
</t:base>
	
