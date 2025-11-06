<%@page import="com.User.post"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnection"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	session.setAttribute("Login-error", "Please login 1st");
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>

<link rel="stylesheet" href="Cssfile/style.css">

<%@include file="Allcomponent/component.jsp"%>
</head>
<body>
	<%@include file="Allcomponent/navbar.jsp"%>

	<div class="container">
		<h2 class="text-center">All Notes :</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					PostDAO ob = new PostDAO(DBconnection.getConn());
					List<post> pos = ob.getData(user3.getId());

					for (post po : pos) {
				%>

				<div class="card mt-3">

					<img alt="" src="img/sn.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">

					<div class="card-body p-4">
						<h5 class="card-title "><%=po.getTitle() %></h5>
						<p><%=po.getContent() %></p>

						<p>
							<b class="text-success">Published By: <%=user3.getName() %></b><br>
							<b class="text-primary"><%=po.getPdate() %></b>
						</p>

						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">
								<i class="fa fa-trash" aria-hidden="true"></i>
							</a>
							<a href="edit.jsp?note_id=<%=po.getId() %>" class="btn btn-primary">
								<i class="fa-solid fa-pen-to-square"></i>
							</a>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>

			</div>
		</div>
	</div>
	<br><br><br><br>

	<%@include file="Allcomponent/footer.jsp"%>

	
	<%
	    String update = (String) session.getAttribute("Updmsg");
	    String delete = (String) session.getAttribute("WrongMsg");
	%>

	<% if(update != null) { %>
	<script>
	Swal.fire({
	  icon: 'success',
	  title: 'Note Updated!',
	  text: '<%=update%>',
	  confirmButtonText: 'OK'
	});
	</script>
	<% session.removeAttribute("Updmsg"); } %>

	<% if(delete != null) { %>
	<script>
	Swal.fire({
	  icon: 'error',
	  title: 'Action Failed!',
	  text: '<%=delete%>',
	  confirmButtonText: 'OK'
	});
	</script>
	<% session.removeAttribute("WrongMsg"); } %>

</body>
</html>
