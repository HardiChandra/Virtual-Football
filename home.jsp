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
.style1 {
	color: #0000FF;
	font-size: 24px;
}
.style2 {
	color: #0000FF;
	font-size: 12px;
}
.style3 {
	font-size: 12px;
	color: #000000;
}
-->
</style>
</head>

<body background="Image/Field.jpg">
	<table align="right" bgcolor="#FFFFFF" height="514">
		<tr>
        	<td width="700" height="31" colspan="2" align="left" valign="top" bgcolor="#CCCCCC">
           	  <table width="587" cellspacing="2" cellpadding="2" align="center">
				<tr>
                    	<td><a href="home.jsp">Home</a></td>
                        <td><a href="team.jsp">Team</a></td>
                        <td><a href="player.jsp">Player</a></td>
                        <td><a href="message.jsp">Message</a></td>
                        <td><a href="transfer.jsp">Transfer</a></td>
                        <td><a href="about.jsp">About</a></td>
                </tr>
              </table>
			</td>
      	</tr>
        <tr>
        	<td valign="top">
            	<table width="701" height="388">
                	<tr>
                    	<td width="549">
                        	<table>
                            	<tr>
                                	<td width="633">
                                      <span class="style1">Welcome To Our Website</span><br />
                                      <br />
                                      <span class="style2">News Report</span>                    
                           		  </td>
                              	</tr>
                                <tr>
                                	<td>
                                    	Date<br />                                    
                                    	<table cellpadding="2" cellspacing="2">
										  <%
										  		//tampilakan 5 news teratas
                                                String query="SELECT * FROM news ORDER BY NewsID DESC;";
												ResultSet rs=st.executeQuery(query);
												for(int i=0;i<5;i++)
												{
													rs.next();
													out.print("<tr>");
														out.print("<td valign=top width=100>");
														out.print("<span class=style3>");
															out.print(rs.getString("Date"));
														out.print("</span>");
														out.print("</td>");
														out.print("<td width=400>");
														out.print("<span class=style3>");
															out.print(rs.getString("News"));
														out.print("</span>");
														out.print("</td>");
													out.print("</tr>");
													
												}
											%>
                                        </table>
                                    </td>
                                </Tr>
                                <tr>
                                	<td><a href="news.jsp">more<br /></a></td>
                                </tr>
                                <tr>
                                	<td colspan="2" align="left">
                                    	<table width="373">
											<tr>
												<td colspan="2" align="left" bgcolor="#CCCCCC">MY PROFILE</td>
											</tr>
                                        	<tr>
                                           		<td width="82"><img src="Image/NoAvatar.jpeg" width="75" height="75" /></td>
												<td width="279" align="left">
													<%
														if(session.getAttribute("user")!=null)
														{
														String query2="select * from login where username='" + a + "'";
														ResultSet rs2=st.executeQuery(query2);
														rs2.next();
														out.print("Manager name : " + rs2.getString("Name") + "<br>");
														out.print("Age : " + rs2.getString(3) + "<br>");
														out.print("Location : " + rs2.getString(5) + "<br>");
														out.print("Hobby : " + rs2.getString(6) + "<br>");
														out.print("Favourite Club : " + rs2.getString(7) + "<br>");
														st.close();
														}
													%>                
                                              </td>
                                            </tr>
											<tr>
												<td align="center">
													<a href="editProfile.jsp"><span class="style2">edit profile</span></a>
												</td>
											</tr>
                                      </table>
                                    </td>
                                </tr>
                                
                          </table>
                   	  </td>
                        <td width="140" valign="top">
							<table>
                            	<tr>
									<td width="132" align="right">
										<span class="style2"><a href="logout.jsp">Logout</a></span>									</td>
								</tr>
								<tr>
									<td bgcolor="#cccccc">Messages</td>
								</tr>
                                <%
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
									con.close();
								%>
								<tr>
									<td><a href="outbox.jsp">outbox(<%=j%>)</a></td>
								</tr>
								<tr>
									<td bgcolor="#cccccc">Transfer</td>										
								</tr>
								<tr>
									<td><a href="transfer.jsp">Pending Proposal</a></td>
								</tr>
								<tr>
									<td><a href="transferRequest.jsp">Transfer Request</a></td>
								</tr>
								<tr>
									<td bgcolor="#cccccc">Calendar</td>
								</tr>
								<tr>
									<Td>
										<table>
											<tr>
												<td colspan="7" align="center"><span class="style3">January 2008</span></td>
											</tr>
											<tr>
												<td>M</td>
												<td>T</td>
												<td>W</td>
												<td>T</td>
												<td>F</td>
												<td>S</td>
												<td>S</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
											</tr>
											<tr>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>
												<td>10</td>
												<td>11</td>
												<td>12</td>
											</tr>
											<tr>
												<td>13</td>
												<td>14</td>
												<td>15</td>
												<td>16</td>
												<td>17</td>
												<td>18</td>
												<td>19</td>
											</tr>
											<tr>
												<td>20</td>
												<td>21</td>
												<td bgcolor="#ccccccc">22</td>
												<td>23</td>
												<td>24</td>
												<td>25</td>
												<td>26</td>
											</tr>
											<tr>
												<td>27</td>
												<td>28</td>
												<td>29</td>
												<td>30</td>
												<td>31</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="7">
													<table width="136">
														<tr>
															<td align="left"><a href="#"><< dec</a></td>
															<td align="right"><a href="#">feb >></a></td>															
														</tr>
												  </table>
												</td>
											</tr>
										</table>
									</Td>
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
