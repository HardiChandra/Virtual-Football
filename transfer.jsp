<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//melakukan validasi session
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
				String subject=request.getParameter("subject"); //mengambil hasil yang dikirim
				String query="select * from message where subject='" + subject + "'"; //mengeset query
				ResultSet rs=st.executeQuery(query); //menampung hasil query ke rs
				rs.next(); //maju 1 record
			%>
          <td width="524" valign="top">
   	  <table>
            	<tr>
                	<td colspan="2">
                    	Pending Proposal
                    </td>
                </tr>
                <tR>
                	<td>
                    	<table width="550" border="1">
<tR>
                            	<td>Player Name</td>
                                <td>Club</td>
                                <td>Amount</td>
                                <td>Type</td>
                                <td>Date</td>
                                <td>Status</td>
                                <td></td>
                            </tR>
                            <%
								String query5="select NamaClub from Club c, Login l where c.clubID=l.clubID and username='" + a + "'"; //mengeset query mengambil nama club
								Statement st5=con.createStatement(1004,1008); //membuat statement baru
								ResultSet rs5=st5.executeQuery(query5); //menjalankan query 5 dan menampung hasilnya di rs5
								if(rs5.next()) //maju 1 record dari rs5
								{
								
								String query2="select TransferID,Name,NamaCLub,Amount,Type,[Date],Status from transfer t, Club c, Player p where t.ClubID=c.ClubID and t.PlayerID=p.playerID and RequestFrom='" + rs5.getString(1) + "'"; //mengeset query2
								Statement st3=con.createStatement(1004,1008); //membuat statement baru
								ResultSet rs2=st3.executeQuery(query2); //mengeset query menjadi rs2
								while(rs2.next()) //jika masih ada record
								{
							%>
                            		<tr>
                                    	<td><a href="player.jsp?find=<%=rs2.getString("Name")%>&stat=name"><%=rs2.getString("Name")%></a></td>
                                        <td><%=rs2.getString("NamaClub")%></td>
                                        <td><%=rs2.getString("Amount")%></td>
                                        <td><%=rs2.getString("Type")%></td>
                                        <td><%=rs2.getString("Date")%></td>
                                        <td><%=rs2.getString("Status")%></td>
										<%
																		String stat=rs2.getString("Status");
											if(stat.equals("pending"))
											{
										%>
                                        <td><a href="doCancel.jsp?id=<%=rs2.getInt(1)%>">cancel</a></td>
										<%
											}
										%>
                                    </tr>
                            <%
								}
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
