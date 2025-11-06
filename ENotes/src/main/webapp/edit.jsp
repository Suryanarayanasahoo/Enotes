<%@page import="com.User.post"%>
<%@page import="com.DB.DBconnection"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user4 = (UserDetails) session.getAttribute("userD");
if (user4 == null) {
    session.setAttribute("Login-error", "Please login 1st");
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit notes</title>

<link rel="stylesheet" href="Cssfile/style.css">

<%@include file="Allcomponent/component.jsp"%>
</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDAO st = new PostDAO(DBconnection.getConn());
	post p = st.getDataById(noteid);
	%>

	<%@include file="Allcomponent/navbar.jsp"%>

	<div class="container-fluid py-5">
		<h1 class="text-center">Edit Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NotesEditServlet" method="post">

						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">
							<label>Enter Title</label>
							<input type="text" class="form-control" name="title" required="required" value="<%=p.getTitle()%>">
						</div>

						<div class="form-group">
							<label>Enter Content</label>
							<textarea rows="9" class="form-control" name="content" required="required"><%=p.getContent()%></textarea>
						</div>

						<div class="conteiner text-center mt-3">
							<button type="submit" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="Allcomponent/footer.jsp"%>

	

	<%
	    String update = (String)session.getAttribute("Updmsg");
	    String error = (String)session.getAttribute("WrongMsg");
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

	<% if(error != null) { %>
	<script>
	Swal.fire({
	  icon: 'error',
	  title: 'Update Failed!',
	  text: '<%=error%>',
	  confirmButtonText: 'OK'
	});
	</script>
	<% session.removeAttribute("WrongMsg"); } %>

</body>
</html>
