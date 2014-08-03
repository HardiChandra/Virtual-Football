<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//validasi session
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
<table width="700" align="right" bgcolor="#FFFFFF" height="350">
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
       	  <td width="197" height="33"><span class="style2">Message</span></td>
  </tr>
       <tr>
       <td valign="top">
            	<table border="1">
               	  <tr>
                	<td width="151"><a href="sendMessage.jsp">Send Message</a></td>
                </tr>
                  <%
				  		//menampilkan pesan dimana tujuan adalah user yang login
						String query3="select * from message where To='" + a + "'";
						Statement st3=con.createStatement(1004,1008);
						ResultSet rs3=st3.executeQuery(query3);
						int i=0;
						while(rs3.next())
						{
							i++;
						}
					%>
					<tr>
						<td><a href="message.jsp">inbox(<%=i%>)</a></td>
					</tr>
					 <%
						String query4="select * from message where From='" + a + "'";
						Statement st4=con.createStatement(1004,1008);
						ResultSet rs4=st4.executeQuery(query4);
						int j=0;
						while(rs4.next())
						{
							j++;
						}
					%>
					<tr>
						<td><a href="outbox.jsp">outbox(<%=j%>)</a></td>
					</tr>
                </table>
         </td>
            <td width="491" valign="top">
            	<table width="439" border="1">
<tr>
                    	<td width="83" height="50" valign="top">Outbox</td>
                  </tr>
                    <tr>
                    	<td>To</td>
                        <td width="92">Subject</td>
                      <td width="203">Date</td>
                  </tr>
                  <%
				  		//tampilakn pesan dimana asal pengirimnya adalah user yang login
				  		String username=(String)session.getAttribute("user");
				  		String query="select * from message where From='" + username + "'";
						ResultSet rs=st.executeQuery(query);
						while(rs.next())
						{
					%>
                    		<tr>
                            	<td><%=rs.getString("to")%></td>
                            	<td><a href="messageDetail.jsp?subject=<%=rs.getString("subject")%>"><%=rs.getString("Subject")%></a></td>
                            	<td><%=rs.getString("Date")%></td>                                
                            </tr>
                    <%
						}
						con.close();
				  %>
                </table>
         </td>
       </tr>
</table>
</body>
</html>
