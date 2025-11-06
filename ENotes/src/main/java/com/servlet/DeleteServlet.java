package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.PostDAO;
import com.DB.DBconnection;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
		Integer noteid= Integer.parseInt(request.getParameter("note_id"));
		
		PostDAO dao=new PostDAO(DBconnection.getConn());	
		
		boolean f=dao.DeleteNotes(noteid);
		HttpSession session =null;
		
		if(f) {
			
		      session=request.getSession();
			
			session.setAttribute("Updmsg", "Notes  Deleted successfully");
			response.sendRedirect("showNotes.jsp");
			System.out.println();
		}
		else {
		      session=request.getSession();
		      session.setAttribute("WrongMsg", "Something wents to wrong on server");
		      response.sendRedirect("showNotes.jsp");

			
		}
	}
}