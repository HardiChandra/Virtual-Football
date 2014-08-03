<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung id hasil kiriman
	String id=request.getParameter("id");
	String username=(String)request.getAttribute("user");

	//mengubah status menjadi approved
	String query="update Transfer set status='approve' where Transferid=" + id;
	st.executeUpdate(query);

	String query3="select RequestTo,RequestFrom,Name,Amount,p.PlayerID from transfer t, Player p where p.playerID=t.playerID and Transferid=" + id;
	Statement st2=con.createStatement(1004,1008);
	
	ResultSet rs=st2.executeQuery(query3);
	rs.next();
	String reqFrom=rs.getString("RequestFrom");
	String sambung=rs.getString("RequestTo") + " has approve a proposal from " + reqFrom + " to Bid " + rs.getString("Name") + " as $" + rs.getString("amount");
	
	//menambahkan berita baru di database
	String query2="insert into news([Date],News) values(date(),'" + sambung + "')";
	Statement st3=con.createStatement(1004,1008);
	st3.executeUpdate(query2);
	
	String query5="select c.ClubID from login l,club c where NamaClub='" + reqFrom + "' and c.ClubID=l.ClubID";
	Statement st5=con.createStatement(1004,1008);
	ResultSet rs4=st5.executeQuery(query5);
	rs4.next();
	String query4="update Player set ClubID=" + rs4.getInt("ClubID") + " where PlayerID=" + rs.getInt("PlayerID");
	Statement st7=con.createStatement(1004,1008);	
	st7.executeUpdate(query4);
	con.close();
	response.sendRedirect("transferRequest.jsp");
%>