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
   	  <table width="518">
<tr>
                	<td colspan="2">
                    	News
                    </td>
                </tr>
                <tR>
                	<td valign="top">
                    	<form name="" action="news.jsp">
                        <table border="1">
                        	<tr>
                            	<td>Search</td>
                                <td><input type="text" name="txtSearch" /></td>
                                <td><input type="submit" /></td>
                            </tr>
                        </table>
                        </form>
                    </td>
                </tR>
                <tr>
                	<td>
                    	Date
                    </td>
                </tr>	
                <tr>
                	<td>
                    	<table>
                		<%
							//menampilkan semua pesan yang dicari 
							String search=request.getParameter("txtSearch");
							String query2=new String();
							if(search==null)
							{
								query2="select * from news order by date desc";
							}
							else
							{
								query2="select * from news where news like '%" + search + "%'order by date desc";
							}
					Statement st2=con.createStatement(1004,1008);
					ResultSet rs2=st2.executeQuery(query2);
					while(rs2.next())
					{
				%>
                		<tr>
                        	<td><%=rs2.getString("Date")%></td>
                        	<td><%=rs2.getString("News")%></td>                            
                        </tr>
                <%
					}
				%>    
                </table>
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
