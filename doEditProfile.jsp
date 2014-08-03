<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung hasil kiriman
	String name=request.getParameter("txtName");
	String age=request.getParameter("txtAge");
	String location=request.getParameter("txtLocation");
	String hobby=request.getParameter("txtHobby");
	String favClub=request.getParameter("txtFavClub");
	String username=(String)session.getAttribute("user");
	
	//validasi null dan kosong
	if(name==null||age==null||location==null||hobby==null||favClub==null||name.equals("")||age.equals("")||location.equals("")||hobby.equals("")||favClub.equals(""))
	{
		response.sendRedirect("editProfile.jsp?err=All Field Must be Filled!!"); 
		//mengembalikan ke halaman editProfile.jsp dengan pesan errornya
	}
	else
	{
		String query="update login set age=" + age + ",location='" + location + "',hobby='" + hobby + "',[Favourite Club]='" + favClub + "',name='" + name + "' where username='" + username + "'"; //mengeset query
		st.executeUpdate(query); //menjalankan query
		con.close(); //menutup koneksi
		response.sendRedirect("home.jsp"); //meredirect ke halaman home.jsp
	}
%>