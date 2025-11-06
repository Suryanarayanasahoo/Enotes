<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Style/style.css">
<link rel="stylesheet" href="Cssfile/style.css">

<style type="text/css">
/* Center horizontally and slightly shift upward */
.container-fluid {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding-top: 8vh;
	background-color: #f8f9fa;
}

/* Card styling */
.card {
	width: 100%;
	max-width: 400px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border: none;
	border-radius: 10px;
}
</style>

<%@include file="Allcomponent/component.jsp"%>
</head>
<body>

	<%@include file="Allcomponent/navbar.jsp"%>

	<div class="container-fluid">
		<div class="card">
			<div class="card-header text-center bg-primary text-white">
				<h4>Login</h4>
			</div>

			<div class="card-body">
				<form action="LoginServlet" method="post">
					<div class="form-group mb-3">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							name="uemail" required="required"> <small
							class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>

					<div class="form-group mb-3">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							name="upassword" required="required">
					</div>

					<!-- Centered Submit Button -->
					<div class="text-center">
						<button type="submit" class="btn btn-primary px-5">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="Allcomponent/footer.jsp"%>

	

	<%
	String FMsg = (String) session.getAttribute("login-failed");
	String withoutLogin = (String) session.getAttribute("Login-error");
	String lgMsg = (String) session.getAttribute("logoutMsg");
	%>

	<%
	if (FMsg != null) {
	%>
	<script>
	Swal.fire({
	  icon: 'error',
	  title: 'Login Failed!',
	  text: '<%=FMsg%>',
	  confirmButtonText: 'Retry'
	});
	</script>
	<%
	session.removeAttribute("login-failed");
	}
	%>

	<%
	if (withoutLogin != null) {
	%>
	<script>
	Swal.fire({
	  icon: 'warning',
	  title: 'Please Login First!',
	  text: '<%=withoutLogin%>',
	  confirmButtonText: 'OK'
	});
	</script>
	<%
	session.removeAttribute("Login-error");
	}
	%>

	<%
	if (lgMsg != null) {
	%>
	<script>
	Swal.fire({
	  icon: 'success',
	  title: 'Logged Out Successfully!',
	  text: '<%=lgMsg%>
		',
			confirmButtonText : 'OK'
		});
	</script>
	<%
	session.removeAttribute("logoutMsg");
	}
	%>

</body>
</html>
