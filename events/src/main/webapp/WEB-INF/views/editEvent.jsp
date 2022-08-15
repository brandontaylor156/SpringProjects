<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Edit Event</title>
<t:base>
<div class="container mt-5">
	<h3 class="display-3">${event.name}</h3>
	<form:form action="/events/${event.id}/edit" method="post" modelAttribute="event">
		<input type="hidden" name="_method" value="put">
		<form:input type="hidden" path="host" value="${id}"/>
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Name:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name" value="${currentEvent.name}"/>
		</div>
		<div class="mb-3">
			<form:label for="date" class="form-label" path="date">Date:</form:label>
			<form:errors path="date" class="text-danger" />
			<form:input type="date" class="form-control" path="date" value="${currentEvent.date}"/>
		</div>
		<div class="mb-3 inline">
			<div>
				<form:label for="location" path="location" class="form-label">Location:</form:label>
				<form:errors path="location" class="text-danger" />
				<form:input type="text" class="form-control" path="location" value="${currentProject.location}"/>
			</div>
				<form:select class="form-select form-select-sm" path="state" value="${currentProject.state}">
  						<option value="Alabama">AL</option>
  						<option value="Alaska">AK</option>
  						<option value="Arizona">AZ</option>
  						<option value="Arkansas">AR</option>
  						<option value="California">CA</option>
  						<option value="Colorado">CO</option>
  						<option value="Connecticut">CT</option>
  						<option value="Delaware">DE</option>
  						<option value="Florida">FL</option>
  						<option value="Georgia">GA</option>
  						<option value="Hawaii">HI</option>
  						<option value="Idaho">ID</option>
  						<option value="Illinois">IL</option>
  						<option value="Indiana">IN</option>
  						<option value="Iowa">IA</option>
  						<option value="Kansas">KS</option>
  						<option value="Kentucky">KY</option>
  						<option value="Louisiana">LA</option>
  						<option value="Maine">ME</option>
  						<option value="Maryland">MD</option>
  						<option value="Massachusetts">MA</option>
  						<option value="Michigan">MI</option>
  						<option value="Minnesota">MN</option>
  						<option value="Mississippi">MS</option>
  						<option value="Missouri">MO</option>
  						<option value="Montana">MT</option>
  						<option value="Nebraska">NE</option>
  						<option value="Nevada">NV</option>
  						<option value="New Hampshire">NH</option>
  						<option value="New Jersey">NJ</option>
  						<option value="New Mexico">NM</option>
  						<option value="New York">NY</option>
  						<option value="North Carolina">NC</option>
  						<option value="North Dakota">ND</option>
  						<option value="Ohio">OH</option>
  						<option value="Oklahoma">OK</option>
  						<option value="Oregon">OR</option>
  						<option value="Pennsylvania">PA</option>
  						<option value="Rhode Island">RI</option>
  						<option value="South Carolina">SC</option>
  						<option value="South Dakota">SD</option>
  						<option value="Tennessee">TN</option>
  						<option value="Texas">TX</option>
  						<option value="Utah">UT</option>
  						<option value="Vermont">VT</option>
  						<option value="Virginia">VA</option>
  						<option value="Washington">WA</option>
  						<option value="West Virginia">WV</option>
  						<option value="Wisconsin">WI</option>
  						<option value="Wyoming">WY</option>
			</form:select>
		</div>
		<div class="in-line">
			<a class="btn btn-danger" href="/dashboard">Cancel</a>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form:form>
</div>
</t:base>
	
