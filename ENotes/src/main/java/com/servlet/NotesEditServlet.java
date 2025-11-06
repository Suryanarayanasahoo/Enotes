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

@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		try {
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			
			String Title=request.getParameter("title");
			String Content=request.getParameter("content");
			
			
			PostDAO dao=new PostDAO(DBconnection.getConn());
			boolean f=dao.PostUpdate(noteid, Title, Content);
			
			if(f) {
				System.out.println("data updated successfully");
				
				HttpSession session=request.getSession();
				session.setAttribute("Updmsg", "Note update successfully");
				response.sendRedirect("showNotes.jsp");
				
			}
			else {
				System.out.println("data not updated ");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}

}
