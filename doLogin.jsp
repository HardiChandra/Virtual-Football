<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung hasil kiriman
	String username=request.getParameter("txtUsername");
	String password=request.getParameter("txtPassword");
	
	//validasi inputan
	if(username==null||username=="")
	{
		response.sendRedirect("index.jsp?err=Username must be filled!!");
	}
	else if(password==null||password=="")
	{
		response.sendRedirect("index.jsp?err=Password must be filled!!");
	}
	else
	{
		//mengecek apakah usernama ada di tabase
		String query="select * from login where username='" + username + "' and password='" + password + "'";
		ResultSet rs=st.executeQuery(query);
		if(rs.next())
		{
			session.setAttribute("user",username);
			//bila user admin akan dilanjutkan ke halaman home admin
			if(username.equals("Admin")||username.equals("admin"))
			{
				session.setAttribute("user",username);
				response.sendRedirect("homeAdmin.jsp");
			}
			//bila user non admin akan dilanjutkan ke halaman home		
			else
			{
				session.setAttribute("user",username);			
				response.sendRedirect("home.jsp");
			}
		}
		else
		{
			response.sendRedirect("index.jsp?err=Wrong username or password!!");
		}
						
	}
	con.close();
%>