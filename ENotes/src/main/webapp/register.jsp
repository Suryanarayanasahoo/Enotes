<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Cssfile/style.css">

<style type="text/css">
/* Center horizontally and move card slightly upward */
.container-fluid {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding-top: 8vh; /* adjust up/down position */
	background-color: #f8f9fa; /* soft background */
}

/* Card styling */
.card {
	width: 100%;
	max-width: 450px;
	border: none;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.card-header {
	background: linear-gradient(90deg, #007bff, #0056b3);
	color: white;
	text-align: center;
	font-weight: 500;
	font-size: 1.3rem;
}
</style>

<%@include file="Allcomponent/component.jsp"%>
</head>
<body>

	<%@include file="Allcomponent/navbar.jsp"%>

	<div class="container-fluid">
		<div class="card">
			<div class="card-header">Register</div>

			<div class="card-body">
				<form action="UserServlet" method="post">
					<div class="form-group mb-3">
						<label for="fullname">Full Name</label>
						<input type="text"	class="form-control" id="fullname" placeholder="Enter your full name" name="fname" required="required">
					</div>

					<div class="form-group mb-3">
						<label for="email">Email Address</label>
						<input type="email"	class="form-control" id="email" placeholder="Enter your email" name="uemail" required="required">
					</div>

					<div class="form-group mb-3">
						<label for="password">Password</label>
						<input type="password" class="form-control" id="password" placeholder="Enter password" name="upassword" required="required">
					</div>

					<div class="form-group mb-3">
						<label for="confirmPassword">Confirm Password</label>
						<input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password" required="required">
					</div>

					<div class="form-group form-check mb-3">
						<input type="checkbox" class="form-check-input" id="terms" required="required">
						<label class="form-check-label" for="terms"> I agree to
							the <a href="#">terms and conditions</a>
						</label>
					</div>

					<!-- Centered Submit Button -->
					<div class="text-center">
						<button type="submit" class="btn btn-primary px-5">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="Allcomponent/footer.jsp"%>

	

	<%
	    String regMsg =(String)session.getAttribute("reg-sucess");
	    String FMsg =(String)session.getAttribute("failed-msg");
	%>

	<% if(regMsg != null) { %>
	<script>
	Swal.fire({
	  icon: 'success',
	  title: '<%=regMsg%>',
	  text: 'You can login now.',
	  confirmButtonText: 'OK'
	});
	</script>
	<%
	    session.removeAttribute("reg-sucess");
	}
	%>

	<% if(FMsg != null) { %>
	<script>
	Swal.fire({
	  icon: 'error',
	  title: 'Registration Failed!',
	  text: '<%=FMsg%>',
	  confirmButtonText: 'Try Again'
	});
	</script>
	<%
	    session.removeAttribute("failed-msg");
	}
	%>

</body>
</html>
