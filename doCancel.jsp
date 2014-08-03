<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>

<%
	//menampung id hasil pembatalan transfer
	String id=request.getParameter("id");
	
	//menghapus record transfer dimana id dari transfernya sama dengan id yang ingin dihapus
	String query="delete from Transfer where TransferID=" + id;
	st.executeUpdate(query);
	response.sendRedirect("transfer.jsp");
	con.close();
%>