<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Events</title>
<t:base>
<div class="container">
	<h1 class="display-1 m-5">Welcome, ${user.firstName}</h1>
	<a class="lead" href="/logout">Logout</a>
	
	<p class="lead">Here are some of the events in your state:</p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Name</th>
				<th>Date</th>
				<th>City</th>
				<th>Host</th>
				<th>Action/Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="event" items="${stateEvents}">
			<tr>
				<td><a href="/events/${event.id}">${event.name}</a></td>
				<td>${event.date}</td>
				<td>${event.location}</td>
				<td>${event.host.firstName}</td>
				<td>
					<c:choose>
						<c:when test="${event.host.id == user.id}">
							<a href="/events/${event.id}/edit" class="btn btn-success">Edit</a>
							<form action="/events/${event.id}/delete" method="post">
    							<input type="hidden" name="_method" value="delete">
    							<button class="btn btn-danger" type="submit">Delete</button>
							</form>
						</c:when>
						<c:when test="${event.users.contains(user)}">
							<p>Joining</p>
							<form action="/events/${event.id}/cancel" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-danger" type="submit">Cancel</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/events/${event.id}/join" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-primary" type="submit">Join</button>
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<p class="lead">Here are some of the events in other states:</p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Name</th>
				<th>Date</th>
				<th>City</th>
				<th>State</th>
				<th>Host</th>
				<th>Action/Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="event" items="${otherEvents}">
			<tr>
				<td><a href="/events/${event.id}">${event.name}</a></td>
				<td>${event.date}</td>
				<td>${event.location}</td>
				<td>${event.state}</td>
				<td>${event.host.firstName}</td>
				<td>
					<c:choose>
						<c:when test="${event.host.id == user.id}">
							<a href="/events/${event.id}/edit" class="btn btn-success">Edit</a>
							<form action="/events/${event.id}/delete" method="post">
    							<input type="hidden" name="_method" value="delete">
    							<button class="btn btn-danger" type="submit">Delete</button>
							</form>
						</c:when>
						<c:when test="${event.users.contains(user)}">
							<p>Joining</p>
							<form action="/events/${event.id}/cancel" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-danger" type="submit">Cancel</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/events/${event.id}/join" method="post">
    							<input type="hidden" name="_method" value="put">
    							<button class="btn btn-primary" type="submit">Join</button>
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h3 class="display-3">Create an Event</h3>
	<form:form action="/events/new" method="post" modelAttribute="event">
		<form:input type="hidden" path="host" value="${user.id}"/>
		<div class="mb-3">
			<form:label for="name" class="form-label" path="name">Name:</form:label>
			<form:errors path="name" class="text-danger" />
			<form:input type="text" class="form-control" path="name"/>
		</div>
		<div class="mb-3">
			<form:label for="date" class="form-label" path="date">Date:</form:label>
			<form:errors path="date" class="text-danger" />
			<form:input type="date" class="form-control" path="date"/>
		</div>
		<div class="mb-3 inline">
			<div>
				<form:label for="location" path="location" class="form-label">Location:</form:label>
				<form:errors path="location" class="text-danger" />
				<form:input type="text" class="form-control" path="location" />
			</div>
				<form:select class="form-select form-select-sm" path="state">
  						<option selected value="Alabama">AL</option>
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
		<button type="submit" class="btn btn-primary">Create</button>
	</form:form>
</div>
</t:base>