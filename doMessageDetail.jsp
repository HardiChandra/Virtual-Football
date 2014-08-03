<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	String subject=request.getParameter("subject");
	String query="update Message set status=2 where subject='" + subject + "'";
	st.executeUpdate(query);
	response.sendRedirect("messageDetail.jsp?subject=" + subject);
	con.close();
%>