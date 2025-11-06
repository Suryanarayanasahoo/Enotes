<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% UserDetails user2= (UserDetails)session.getAttribute("userD");
	if(user2==null){
		response.sendRedirect("login.jsp");
		 session.setAttribute("Login-error", "Please login 1st");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Cssfile/style.css">

<%@include file="Allcomponent/component.jsp" %>
</head>
<body>
<%@include file="Allcomponent/navbar.jsp" %>


<div class="container-fluid">
<div class="card  pz-5" >
<div class="card-body text-center">
<img alt="" src="img/homepage.png" class="img-fluid mx-auto" style="max-width: 400px">
<h1>START TAKING YOUR NOTES</h1>
<a href="Addnotes.jsp" class="btn btn-outline-primary " >Start Here</a>

</div>
</div>
</div>
<%@include file="Allcomponent/footer.jsp" %>
</body>
</html>