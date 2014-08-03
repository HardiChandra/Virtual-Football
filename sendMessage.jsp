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
       	  <td width="197" height="29" valign="top"><span class="style2">Message</span></td>
  </tr>
       <tr>
       <td valign="top">
  <table border="1">
               	  <tr>
                	<td width="151"><a href="sendMessage.jsp">Send Message</a></td>
                </tr>
                  <%
						String query3="select * from message where To='" + a + "'";
						//mengeset query3
						Statement st3=con.createStatement(1004,1008); //membuat statement 3
						ResultSet rs3=st3.executeQuery(query3); //menampung hasil query3 ke rs3
						int i=0;  //inisialisasi i=0
						while(rs3.next()) //selama query 3 masih ada
						{
							i++; //i+1
						}
					%>
					<tr>
						<td><a href="message.jsp">inbox(<%=i%>)</a></td>
					</tr>
					 <%
						String query4="select * from message where From='" + a + "'"; //mengeset query4
						Statement st4=con.createStatement(1004,1008); //membuat statement
						ResultSet rs4=st4.executeQuery(query4); //mengeset rs4 atas hasil query4
						int j=0; //inisialisasi j=0
						while(rs4.next()) //jika rs4 belum berakhir
						{
							j++; //j+1
						}
					%>
					<tr>
						<td><a href="outbox.jsp">outbox(<%=j%>)</a></td>
					</tr>
                </table>
         </td>
         <td width="491" valign="top">
         	<form action="doSendMessage.jsp">
            <table>
            	<tr>
                	<td colspan="2">Send Message</td>
                </tr>
                <tr>
                	<td align="right">To : </td>
                    <td><input type="text" name="txtTo" /></td>
                </tr>
                <tr>
                	<td align="right">Subject : </td>
                    <td><input type="text" name="txtSubject" /></td>
                </tr>
                <tr>
                	<td align="right" valign="top">Message : </td>
                    <td><textarea rows="4" name="txtMessage"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2">
                    	<%
							String err=request.getParameter("err"); //menampung hasil pesan err kedalam variabel err
							if(err!=null) //jika err tidak null
							{
								out.print(err); //cetak err
							}
						%>
                    </td>
                </tr>
                <tr>
                	<td colspan="2">
                    	<table>
                        	<tr>
                            	<td><input type="submit" value="Send" /></td>
                                <td><input type="button" value="Cancel" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </form>
         </td>
       </tr>
       <%
	   	con.close();
	   %>
</table>
</body>
</html>
