<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//validasi apakah user telah login
	String a=(String)session.getAttribute("user");
	if(a==null||a=="")
	{
		response.sendRedirect("index.jsp?err=you must login first");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style2 {font-size: 24px}
-->
</style>
</head>

<body background="Image/Field.jpg">
<table width="700" align="right" bgcolor="#FFFFFF">
<tr>
        	<td height="31" colspan="2" align="left" valign="top" bgcolor="#CCCCCC">
           	  <table width="587" cellspacing="2" cellpadding="2" align="center">
				<tr>
                    	<td><span class="style1"><a href="home.jsp">Home</a></span></td>
                        <td><span class="style1"><a href="team.jsp">Team</a></span></td>
                        <td><span class="style1"><a href="player.jsp">Player</a></span></td>
                        <td><span class="style1"><a href="message.jsp">Message</a></span></td>
                        <td><span class="style1"><a href="transfer.jsp">Transfer</a></span></td>
                        <td><span class="style1"><a href="about.jsp">About</a></span></td>
                </tr>
              </table>
	</td>
  </tr>
  <tr height="70" valign="top">
       	  <td width="164"><span class="style2">Transfer</span></td>
  </tr>
        <tr>
        	<td valign="top">
            	<table border="1">
               	  <tr>
                	<td width="151"><a href="transfer.jsp">View Pending Proposal</a></td>
                </tr>
                  
					<tr>
						<td><a href="transferRequest.jsp">View Transfer Request</a></td>
					</tr>
					<tr>
						<td><a href="news.jsp">News</a></td>
					</tr>
                </table>
            </td>
            <%
				String subject=request.getParameter("subject");
				String query="select * from message where subject='" + subject + "'";
				ResultSet rs=st.executeQuery(query);
				rs.next();
			%>
          <td width="524" valign="top">
   	  <table>
            	<tr>
                	<td colspan="2">
                    	Transfer Request
                    </td>
                </tr>
                <tR>
                	<td>
                    	<table width="550" border="1">
<tR>
                            	<td>Player Name</td>
                                <td>Request From</td>
                                <td>Amount</td>
                                <td>Type</td>
                                <td>Date</td>
                                <td></td>
                            </tR>
                            <%
								String query3="select NamaClub from Club c, Login l where c.clubID=l.clubID and username='" + a + "'";	//mengambil namaclub dari user yang telah login
								Statement st4=con.createStatement(1004,1008); //membuat statement baru
								ResultSet rs3=st4.executeQuery(query3); //menampung hasil query ke rs
								rs3.next(); //maju satu record
								
								
								String query2="select TransferID,RequestFrom,Amount,Type,[Date],Name from transfer t, Club c, Player p where t.ClubID=c.ClubID and t.PlayerID=p.playerID and Status='Pending' and RequestTo='" + rs3.getString(1) + "'";
								//mengambil data-data
								Statement st3=con.createStatement(1004,1008); //membuat statement baru
								ResultSet rs2=st3.executeQuery(query2); //menjalankan query2 dan ditampung ke rs2
								while(rs2.next()) //jika record belum habis
								{
							%>
                            		<tr>
                                    	<td><a href="player.jsp?find=<%=rs2.getString("Name")%>&stat=name"><%=rs2.getString("Name")%></a></td>
                                        <td><%=rs2.getString("RequestFrom")%></td>
                                        <td><%=rs2.getString("Amount")%></td>
                                        <td><%=rs2.getString("Type")%></td>                                        
                                        <td><%=rs2.getString("Date")%></td>
                                        <td><a href="doApprove.jsp?id=<%=rs2.getInt(1)%>">approve</a>
                                        <a href="doReject.jsp?id=<%=rs2.getInt(1)%>">reject</a></td>
                                    </tr>
                            <%
								}
							%>
                        </table>
                  </td>
                </tR>	
            </table>
          </td>
  </tr>
        <%
			con.close(); //menutup koneksi
		%>
</table>
</body>
</html>
