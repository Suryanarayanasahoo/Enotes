package com.DAO;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.User.UserDetails;
import com.User.post;

public class PostDAO {
	private Connection conn;

	public PostDAO(Connection connection) {
	    super();
	    this.conn = connection; // assign the parameter to the field
	}

	
	public boolean AddNotes(String ti, String co, int ui) {
		boolean f=false;
		
		try {
			String qu="insert into post(Title,Content,Uid) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public java.util.List<post>  getData(int id)
	{
		
		post po=null;
		java.util.List<post> list =new ArrayList<post>();
		
		try {
			
			String qu="select * from post where Uid=? order by id DESC ";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) 
			{
				po=new post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				
				list.add(po);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
	}
	
	public post getDataById(int noteid) {
		
		post p=null;
		
		try {
			
			String qu="select * from post where id=?";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, noteid);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				p=new post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return p;
		
	}
	
	public boolean PostUpdate(int nid , String ti, String co) 
	{
		boolean f=false;
		
		try {
			
			String qu="update post set Title=? , Content=? where id=?";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, nid);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
		
	}
	
	public boolean DeleteNotes(int nid) {
		boolean f=false;
		
		try {
			String qu="delete from post where id=?";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, nid);
			
			int x=ps.executeUpdate();
			if(x==1) {
				f=true;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}


	

}
