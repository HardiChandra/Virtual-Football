<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //menginstalasi class jdbcodbcdriver
	Connection con=DriverManager.getConnection("jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=" + application.getRealPath("db.mdb")); //mengeset variabel con sebagai connection
	Statement st=con.createStatement(1004,1008); //membuat statement
%>