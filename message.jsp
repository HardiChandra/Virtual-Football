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
	<table align="right" bgcolor="#FFFFFF" width="700">
<tr>
        	<td height="31" colspan="2" align="left" valign="top" bgcolor="#CCCCCC">
       	  	  <table width="500" cellspacing="2" cellpadding="2" align="center">
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
	<tr height="60" valign="top">
    	<td width="151"><span class="style2">Message</span></td>
    </tr>
    <tr>
    	<td valign="top">
   	  <table border="1">
            	<tr>
                	<td width="122"><a href="sendMessage.jsp">Send Message</a></td>
                </tr>
                  <%
				  		//mencari jumlah inbox
						String query3="select * from message where To='" + a + "' and status not like 3";
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
						String query4="select * from message where From='" + a + "' and status not like 3";
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
        <td width="537" valign="top">
   	  <table>
            	<tr>
                	<td width="442" align="left">Inbox</td>
        </tr>
                <tr>
					<td align="left">
                    	<form name="formMsg" action="message.jsp">
                        <table border="1">
                        	<tr>
                            	<td>Search message from </td>
                                <td><input type="text" name="txtSearch" /></td>
                                <td><input type="submit" value="Go!" />
                            </tr>
                        </table>
                        </form>
                    </td>
                </tr>
                <tr>
                	<td>
                    	<form action="message.jsp" name="form3">
                    	<table>
							<tR>
                            	<td>
                                	Show Message
                                </td>
                                <td>
                                	<input type="text" name="txtJmlData" />
                                </td>
                                <td>
                                	Per Page
                                </td>
                                <td>
                                	<input type="submit" value="Show" />
                                </td>
                            </tR>
                        </table>
                        </form>
					</td>
                </tr>
                <tr>
                	<td>
                    	<table width="431" border="1">
<tr>
                            	<td width="71" align="center">From</td>
                <td width="96" align="center">Subject</td>
                <td width="105" align="center">Date</td>
                <td width="36"></td>
                          </tr>
                            <%
								//melakukan pencarian dan paging
								String search=request.getParameter("txtSearch");
								String query=new String();
								if(search==null)
								{
									query="select * from message where to='" + a + "' and status not like 3";
								}
								else
								{
									query="select * from message where to='" + a + "' and from like '%" + search + "%' and status not like 3";
								}							
								ResultSet rs=st.executeQuery(query);
								String jmlPerPage=request.getParameter("txtJmlData");
								int jmlPerPageInt=0;
								int jmlRecord=0;
								int pageKeInt=0;
								if(jmlPerPage==null)
								{
									jmlPerPageInt=3;
								}
								else
								{
									jmlPerPageInt=Integer.parseInt(jmlPerPage); //jmlPerPageInt=1
								}
								String pageKe=request.getParameter("page");
								if(pageKe==null)
								{
									pageKeInt=1;
								}
								else
								{
									pageKeInt=Integer.parseInt(pageKe); //pageKeInt=2
								}
								while(rs.next())
								{
									jmlRecord++;
								}
								rs.first();
								rs.previous();
								int jumlahHalaman=jmlRecord/jmlPerPageInt; //3
								if(jmlRecord%jmlPerPageInt!=0)
								{
									jumlahHalaman++;
								}
								for(int j2=0;j2<(pageKeInt-1)*jmlPerPageInt;j2++) //j2=0;j2<1*1;j++
								{
									rs.next();
								}
								int k=0;
								
								while(rs.next()&&k<jmlPerPageInt)
								{
							%>
                            <tR>
								<%
									int angka=rs.getInt("status");
									if(angka!=3)
									{
								%>
								
                            	<td><%=rs.getString("From")%></td>
                                <td>
									<% 
										if(angka==1)
										{
											out.print("<b><i><a href=doMessageDetail.jsp?subject=" + rs.getString("Subject") + ">");
												out.print(rs.getString("Subject"));
											out.print("</a></b></i>");												
										}
										else if(angka==2)
										{
											out.print("<a href=doMessageDetail.jsp?subject=" + rs.getString("Subject") + ">");
												out.print(rs.getString("Subject"));
											out.print("</a>");
										}
									%>
                                </td>
                                <td><%=rs.getString("Date")%></td>
                                <td><a href="doDeleteMsg.jsp?msgid=<%=rs.getString("MessageID")%>">delete</a></td>
                            </tR>
							<%
								}
							%>
                            <%		
									k=k+1;
								}
								con.close();
							%>
                            <tr>
                            	<td colspan="4">
                                	<%
										//menampilkan halaman
										int l=1;
										while(l<jumlahHalaman+1)
										{
									%>
                                    		<a href="message.jsp?page=<%=l%>&txtJmlData=<%=jmlPerPageInt%>"><%=l%></a>
                                    <%
											l++;
										}
									%>
                                </td>
                            </tr>
                        </table>
                  </td>
                </tr>
            </table>
      </td>
    </tr>
</table>
</body>
</html>
