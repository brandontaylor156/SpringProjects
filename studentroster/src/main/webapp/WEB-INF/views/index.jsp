<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Student Roster</title>
<t:base>
<div class="container d-flex vh-100 flex-column align-items-center justify-content-center">
	<h3 class="display-3">Student Roster</h3>
	<div class="d-flex justify-content-center g-5">
		<a href="/dorms">View Dorms</a> | <a href="/dorms/new">Add New Dorm</a> | <a href="/students/new">Add New Student</a>
	</div>
</div>
</t:base>
	
