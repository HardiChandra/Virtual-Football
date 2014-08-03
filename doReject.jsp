<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung hasil kiriman
	String id=request.getParameter("id");
	//mengupdate status dari transgfer
	String query="update Transfer set status='rejected' where Transferid=" + id;
	st.executeUpdate(query);

	String query3="select RequestTo,RequestFrom,Name,Amount from transfer t, Player p where p.playerID=t.playerID and Transferid=" + id;
	Statement st2=con.createStatement(1004,1008);
	
	ResultSet rs=st2.executeQuery(query3);
	rs.next();
	String sambung=rs.getString("RequestTo") + " has rejected a proposal from " + rs.getString("RequestFrom") + " to Bid " + rs.getString("Name") + " as $" + rs.getString("amount");
	
	//menambahkan status reject ke dalam news
	String query2="insert into news([Date],News) values(date(),'" + sambung + "')";
	Statement st3=con.createStatement(1004,1008);
	st3.executeUpdate(query2);
	con.close();
	response.sendRedirect("transferRequest.jsp");
%>