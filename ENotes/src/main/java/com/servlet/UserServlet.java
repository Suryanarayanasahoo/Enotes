package com.servlet;

import java.io.IOError;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.rmi.server.ServerCloneException;

import com.DAO.UserDAO;
import com.DB.DBconnection;
import com.User.UserDetails;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public void doPost( HttpServletRequest req, HttpServletResponse res) throws ServerException, IOException
	{
		String name =req.getParameter("fname");
		String email =req.getParameter("uemail");
		String password =req.getParameter("upassword");
		
		UserDetails us= new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBconnection.getConn());
		 boolean f= dao.addUser(us);
		 HttpSession ses;
		 if(f) {
			 ses=req.getSession();
			 ses.setAttribute("reg-sucess", "Registerd sucessfully");
			 res.sendRedirect("register.jsp");
		 }
		 else {
			 ses=req.getSession();
			 ses.setAttribute("failed-msg", "something wents to wrong");
			 res.sendRedirect("register.jsp");
		 }
		 
		
	}

}
