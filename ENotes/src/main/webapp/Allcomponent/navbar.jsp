<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-notes-medical"></i> ENotes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<%
			UserDetails user = (UserDetails) session.getAttribute("userD");
			%>
	

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		
		<%
			if (user != null) {
			%>
			<li class="nav-item active"><a class="nav-link" href="Home.jsp">
					<i class="fa fa-home" aria-hidden="true"></i>Home <span
					class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item"><a class="nav-link" href="Addnotes.jsp"> <i
					class="fa fa-plus-square" aria-hidden="true"></i> Add Notes
			</a></li>

			<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
					class="fa fa-sticky-note" aria-hidden="true"></i> Show Notes</a></li>
					<%} %>


		</ul>
		<form class="form-inline my-2 my-lg-0">


			
			<%
			if (user != null) {
			%>

			<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
				data-toggle="modal" data-target="#exampleModal">
				<i class="fa-solid fa-address-card"></i> <%=user.getName() %></a>
				 <a href="LogoutServlet" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"> <i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
				
				<%-- User  Modal --%>
				
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="container text-center">
						<i class="fa fa-user fa-3x"></i>
						<h5></h5>

						<table class="table">
							<tbody>
							
								<tr>
									<th>Full Name</th>
									<td><%=user.getName() %></td>
								</tr>

								<tr>
									<th>Email Id</th>
									<td><%=user.getEmail() %></td>
								</tr>
							</tbody>
						</table>


            </div>

					
            
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
			<%
			}

			else {
			%>

			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>
				Login</a> <a href="register.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"> <i class="fa fa-user-plus" aria-hidden="true"></i>
				SignUp
			</a>




			<%
			}
			%>
		</form>
	</div>	
</nav>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const logoutLink = document.querySelector('a[href="LogoutServlet"]');
    if (logoutLink) {
        logoutLink.addEventListener("click", function (e) {
            e.preventDefault();

            Swal.fire({
                title: "Logout?",
                text: "Are you sure you want to logout?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, Logout"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = logoutLink.href;
                }
            });
        });
    }
});
</script>