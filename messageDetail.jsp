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
       	  <td width="208"><span class="style2">Message</span></td>
  </tr>
        <tr>
        	<td valign="top">
            	<table border="1">
               	  <tr>
                	<td width="151"><a href="sendMessage.jsp">Send Message</a></td>
                </tr>
                  <%
				  		//mencari jumlah inbox
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
					 	//mencari jumlah outbox
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
            <%
				//menampilkan detail message
				String subject=request.getParameter("subject");
				String query="select * from message where subject='" + subject + "'";
				ResultSet rs=st.executeQuery(query);
				rs.next();
			%>
            <td width="480" valign="top">
            	<table>
           	  <tr>
                	<td colspan="2" align="left" valign="top">Message Detail</td>
                </tr>
                <tr>
                	<td align="right">From : </td>
                    <td><%=rs.getString("From")%></td>
                </tr>
                <tr>
                	<td align="right">Date : </td>
                    <td><%=rs.getString("Date")%></td>
                </tr>
                <tr>
                	<td align="right">Subject : </td>
                    <td><%=rs.getString("Subject")%></td>
                </tr>
                <tr>
                	<td align="right" valign="top">Message : </td>
                    <td height="100" valign="top"><%=rs.getString("Description")%></td>
                </tr>
                <tr>
                	<td colspan="2" align="center">
                    	<a href="message.jsp">back</a>
                    </td>
                </tr>
                </table>
          </td>
        </tr>
        <%
			con.close();
		%>
</table>
</body>
</html>
