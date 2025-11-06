package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.PreparedStatement;

import com.DAO.UserDAO;
import com.DB.DBconnection;
import com.User.UserDetails;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String email=request.getParameter("uemail");
		String pwd=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(pwd);
		
		
		UserDAO dao=new UserDAO(DBconnection.getConn());
		UserDetails user=dao.loginUser(us);
		HttpSession ses;
		
		if(user !=null) {
			
			 ses=request.getSession();
			 ses.setAttribute("userD", user);
			response.sendRedirect("Home.jsp");
		}
		else {	 
				 ses=request.getSession();
				 ses.setAttribute("login-failed", "invalid credentials");
				 response.sendRedirect("login.jsp");
			 
			 
			
		}
			
			
		}
		
	}
	
	


