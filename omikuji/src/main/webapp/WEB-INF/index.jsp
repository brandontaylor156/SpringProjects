<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Omikuji</title>
<t:base>
<div class="container d-flex vh-100 flex-column align-items-center justify-content-center">
	<h4 class="display-4">Send an Omikuji!</h4>
	<form action="/omikuji/process" method="post">
		<div class="mb-3">
			<label for="number" class="form-label">Pick any number from 5 to 25:</label>
			<input type="number" min="5" max="25" placeholder="5" name="number" required>
		</div>
		<div class="mb-3">
		  <label for="city" class="form-label">Enter the name of any city:</label>
		  <input type="text" class="form-control" id="city" name="city" aria-describedby="city">
		</div>
		<div class="mb-3">
		  <label for="person" class="form-label">Enter the name of any real person:</label>
		  <input type="text" class="form-control" id="person" name="person">
		</div>
		<div class="mb-3">
			<label for="hobby" class="form-label">Enter professional endeavor or hobby:</label>
			<input type="text" class="form-control" id="hobby" name="hobby">
		</div>
		<div class="mb-3">
			<label for="thing" class="form-label">Enter any type of living thing:</label>
			<input type="text" class="form-control" id="thing" name="thing">
		</div>
		<div class="mb-3">
			<label for="somthingNice" class="form-label">Say something nice to someone:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" name="somethingNice" rows="3"></textarea>
		</div>
		
		<p class="">Send and show a friend</p>
		<button type="submit" class="btn btn-primary">Send</button>
	</form>
</div>

</t:base>
	
