<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Counter</title>
<t:base>
<div class="d-flex vh-100 align-items-center justify-content-center flex-column">
	<h1 class="display-3">You have visited <a href="/your_server">http://your_server</a> ${count} times</h1>
	<div class="lead d-flex">
		<a href="/your_server">Test another visit?</a>
	</div>
</div>
</t:base>
	
