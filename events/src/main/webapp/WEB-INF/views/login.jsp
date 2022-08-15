<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "t" tagdir="/WEB-INF/tags" %>

<title>Welcome</title>
<t:base>
<div class="container mt-5">
	<h6 class="display-6 mb-5">Welcome</h6>
	
	<div class="row">
		<div class="col">
			<h6 class="display-6">Register</h6>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<div class="mb-3">
					<form:label for="firstName" path="firstName" class="form-label">First Name:</form:label>
					<form:errors path="firstName" class="text-danger" />
					<form:input type="text" class="form-control" path="firstName" />
				</div>
				<div class="mb-3">
					<form:label for="lastName" path="lastName" class="form-label">Last Name:</form:label>
					<form:errors path="lastName" class="text-danger" />
					<form:input type="text" class="form-control" path="lastName" />
				</div>
				<div class="mb-3">
					<form:label for="email" path="email" class="form-label">Email:</form:label>
					<form:errors path="email" class="text-danger" />
					<form:input type="text" class="form-control" path="email" />
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
				<div class="mb-3">
					<form:label for="password" path="password" class="form-label">Password:</form:label>
					<form:errors path="password" class="text-danger" />
					<form:input type="password" class="form-control" path="password" />
				</div>
				<div class="mb-3">
					<form:label for="confirm" path="confirm" class="form-label">Confirm:</form:label>
					<form:errors path="confirm" class="text-danger" />
					<form:input type="password" class="form-control" path="confirm" />
				</div>
				<button type="submit" class="btn btn-primary">Register</button>
			</form:form>
		</div>
		<div class="col">
			<h6 class="display-6">Log In</h6>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="mb-3">
					<form:label for="email" path="email" class="form-label">Email:</form:label>
					<form:errors path="email" class="text-danger" />
					<form:input type="text" path="email" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label for="password" path="password" class="form-label">Password:</form:label>
					<form:errors path="password" class="text-danger" />
					<form:input type="password" path="password" class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary">Log In</button>
			</form:form>
		</div>
	</div>
</div>
</t:base>
	