<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% UserDetails user1= (UserDetails)session.getAttribute("userD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		 session.setAttribute("Login-error", "Please login 1st");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add notes</title>

<link rel="stylesheet" href="Cssfile/style.css">

<%@include file="Allcomponent/component.jsp"%>
</head>
<body>
	<%@include file="Allcomponent/navbar.jsp" %>
	<div class="container-fluid py-5">


		<h1 class="text-center">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							
							if(us!=null)
							{%>
							
							<input type="hidden" value="<%=us.getId()%>" name="uid">
								
							<% }%>
							
							<label for="exampleInputEmail1">Enter Title</label>
							 <input	type="text" class="form-control" id="exampleInputEmaill"aria-describedby="emailHelp" name="title" required="required">
						</div>

						<div class="form-group">
							<label for="exampleInputEmaill">Enter Content</label>
							<textarea rows="9" cols="" class="form-control" name="content" required="required"></textarea>

						</div>

						<div class="conteiner text-center">
							<button type="submit" class="btn btn-primary"> <i class="fa-solid fa-plus"></i>Add Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	I
	<%@include file="Allcomponent/footer.jsp"%>
</body>
</html>