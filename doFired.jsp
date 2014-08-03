<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung username kiriman yang ingin didelete
	String username=request.getParameter("username");
	
	//mendelete user
	String query="delete from login where username='" + username + "'";
	st.executeUpdate(query);
	response.sendRedirect("homeAdmin.jsp");
	con.close();
%>
