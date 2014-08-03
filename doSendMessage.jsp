<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung hasil kiriman
	String to=request.getParameter("txtTo");
	String subject=request.getParameter("txtSubject");
	String message=request.getParameter("txtMessage");
	String from=(String)session.getAttribute("user");
	
	int status=0;
	//validasi kiriman
	if(to==null||to.equals(""))
	{
		response.sendRedirect("sendMessage.jsp?err=To must be filled!!");
	}
	else if(subject==null||subject.equals(""))
	{
		response.sendRedirect("sendMessage.jsp?err=Subject must be filled!!");
	}
	else if(message==null||message.equals(""))
	{
		response.sendRedirect("sendMessage.jsp?err=Message must be filled!!");
	}
	else
	{
		//memvalidasi apakah user tersebut ada dalam database
		String query="select username from login";
		ResultSet rs=st.executeQuery(query);
		while(rs.next())
		{
			if(to.equals(rs.getString(1)))
			{
				status=1;
			}
		}
		if(status==1)
		{
			//menginsert message baru ke database
			String query2="insert into message([From],To,Subject,Description,[Date],Status) values('" + from + "','" + to + "','" + subject + "','" + message + "', date(),1)";
			Statement st2=con.createStatement(1004,1008);
			st2.executeUpdate(query2);
			response.sendRedirect("sendMessage.jsp?err=Send message success!!");
		}
		else
		{
			response.sendRedirect("sendMessage.jsp?err=Manager with that name do not exist!!");
		}
	}
	con.close();
%>