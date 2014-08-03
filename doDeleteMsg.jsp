<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung id dari message yang ingin diubah statusnya
	String id=request.getParameter("msgid");
	
	//jika id kosong, maka akan dilakukan update atas status tersebut
	if(id!=null)
	{
		String query="update Message set status=3 where MessageID=" + id;
		st.executeUpdate(query);
		response.sendRedirect("message.jsp");
	}
%>
