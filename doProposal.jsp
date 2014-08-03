<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//menampung hasil kiriman
	String money=request.getParameter("txtMoney");
	String name=request.getParameter("txtName");
	String type=request.getParameter("transType");
	int moneyInt=0;
	//validasi
	if(money==null||money=="")
	{
		response.sendRedirect("proposal.jsp?err=Money must be filled&name=" + name);
	}
	try
	{
		moneyInt=Integer.parseInt(money);
				String username=(String)session.getAttribute("user");
		String query="select NamaClub from login l, club c where l.clubid=c.clubid and username='" + username + "'";
		ResultSet rs=st.executeQuery(query);
		rs.next();
		String clubPenawar=rs.getString("NamaClub");
		String clubDitawar=(String)session.getAttribute("club");
		String sambung=clubPenawar + " has send a proposal to bid " + name + " as $" + money + " to " + clubDitawar;
		
		//menginsert proposal tentang penawaran ke news
		String query2="insert into news([Date],News) values(date(),'" + sambung + "')";
		Statement st2=con.createStatement(1004,1008);
		st2.executeUpdate(query2);
		
		String query4="select PlayerID,c.ClubID from Player p, Club c where c.ClubID=p.ClubID and name='" + name + "'";
		Statement st3=con.createStatement(1004,1008);
		ResultSet rs3=st3.executeQuery(query4);
		rs3.next();
		
		//menginsert data penawaran kedalam transfer
		String query3="insert into Transfer(PlayerID,ClubID,Amount,Type,[Date],RequestFrom,RequestTo,Status) values('" + rs3.getInt(1) + "','" + rs3.getInt(2) + "','" + money + "','" + type + "',date(),'" + clubPenawar + "','" + clubDitawar + "','pending')";
		Statement st4=con.createStatement(1004,1008);
		st4.executeUpdate(query3);
		response.sendRedirect("home.jsp");
	}catch(Exception e)
	{
		response.sendRedirect("proposal.jsp?err=Money must be number&name=" + name);
	}
	con.close();
%>