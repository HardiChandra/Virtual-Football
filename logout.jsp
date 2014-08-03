<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	session.invalidate(); //menghapius session
	response.sendRedirect("index.jsp"); //mengembalikan ke halaman index.jsp
%>