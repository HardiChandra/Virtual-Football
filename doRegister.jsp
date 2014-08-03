<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menanmpung hasil kiriman
	String username=request.getParameter("txtUsername");
	String password=request.getParameter("txtPassword");
	String umur=request.getParameter("txtAge");
	String club=request.getParameter("cmbClub");
	int clubInt=0;
	int status=1;
	//melakukan validasi
	if(username==null||username=="")
	{
		response.sendRedirect("register.jsp?err=Username Must Be Filled!!");
	}
	else if(password==null|password=="")
	{
		response.sendRedirect("register.jsp?err=Password Must Be Filled!!");
	}
	else if(umur==null||umur=="")
	{
		response.sendRedirect("register.jsp?err=Age Must Be Filled!!");
	}
	else
	{
		//menginsert user baru ke database
		String query2="select c.ClubID from login l, Club c where l.ClubID=c.ClubID";
		Statement st3=con.createStatement(1004,1008);
		ResultSet rs=st3.executeQuery(query2);
		clubInt=Integer.parseInt(club);
		while(rs.next())
		{
			if(clubInt==rs.getInt("ClubID"))
			{
				status=2;
			}
		}
		if(status==1)
		{
			String query="insert into login values('" + username + "','" + password + "','" + umur + "'," + club + ",'-','-','-','user','-')";
			st.executeUpdate(query);
			response.sendRedirect("index.jsp?err=Registration success!!");
		}
		else
		{
			response.sendRedirect("index.jsp?err=Another user has chosen that club!!");
		}
	}
	con.close();
%>