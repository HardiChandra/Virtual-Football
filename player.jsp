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
      <tr height="60">
      		<td valign="top"><span class="style2">Player Biography</span></td>	
      </tr>
      <tr>
      	<td>
        	<table>
            	<%
				//melakukan pencarian
				String find=request.getParameter("find");
				String stat=request.getParameter("stat");
				if(find==null||find=="")
				{
				}
				else if(find!=null||find!="")
				{
					String query=new String();
					if(stat.equals("nationality"))
					{
						query="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and nationality='" + find + "'";
					}
					else if(stat.equals("name"))
					{
						query="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and name='" + find + "'";
					}
					else if(stat.equals("age"))
					{
						query="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and age=" + find + "";
					}
					else if(stat.equals("position"))
					{
						query="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and position='" + find + "'";
					}
					else if(stat.equals("price"))
					{
						query="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and price<=" + find + "";
					}
					ResultSet rs=st.executeQuery(query);
					if(rs.next())
					{
			%>
            			<tr>
                        	<td colspan="2" valign="top"><%=rs.getString("name")%>'s information</td>
                        </tr>	
                        <tr>
                        	<td valign="top">Photo : </td>
                            <td><img src="Image/NoAvatar.jpeg" width="60" height="60"</td>
                        </tr>
                        <tr>
                        	<td align="right">Player Name : </td>
                            <td><%=rs.getString("name")%></td>
                        </tr>
                        <tr>
                        	<td align="right">Nationality : </td>
                            <td><%=rs.getString("Nationality")%></td>
                        </tr>
                        <tr>
                        	<td align="right">Club : </td>
                            <td><% out.print(rs.getString("NamaClub")); String club=rs.getString(3); session.setAttribute("club",club); %></td>
                        </tr>
                        <tr>
                        	<td align="right">Age : </td>
                            <td><%=rs.getInt("age")%></td>
                        </tr>
                        <tr>
                        	<td align="right">Position : </td>
                            <td><%=rs.getString("position")%></td>
                        </tr>
                        <tr>
                        	<td align="right">Price : </td>
                            <td><%=rs.getString("price")%></td>
                        </tr>
                        <%
							//menampilkan profil pemain
							String username=(String)session.getAttribute("user");
							String query2="select NamaClub from login l, club c where l.clubID=c.clubID and username='" + username + "'";
							Statement st2=con.createStatement(1004,1008);
							ResultSet rs2=st2.executeQuery(query2);
							rs2.next();
							if(club.equals(rs2.getString(1)))
							{
							}
							else
							{
						%>
                        		<tr>
                                	<td colspan="2"><a href="proposal.jsp?name=<%=rs.getString("name")%>">Make Proposal</a></td>
                                </tr>
						<%	
							}
						%>
            <%
					}
				}
			%>
            </table>
        </td>
        <td valign="top">
        	<table>
            	<tr>
                	<td colspan="5">
                    	<form name="search" action="player.jsp">
                        	<table>
                            	<tr>
                                	<td>
                                        <select name="stat">
                                            <option value="nationality">Nationality</option>
                                            <option value="name">Name</option>
                                            <option value="age">Age</option>
                                            <option value="position">Position</option>
                                            <option value="price">Price</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="find" />
                                    </td>
                                    <td>
                                    	<input type="submit" />
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
                	<% 	
						//menampilakan hasil pencarian
						String stat2=request.getParameter("stat");
						String find2=request.getParameter("find");
						String query3=new String();
						if(find==null||find=="")
						{
							query3="select * from player";
						}
						else if(find!=null||find!="")
						{
							
							if(stat.equals("nationality"))
							{
								query3="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and nationality like '%" + find + "%'";
							}
							else if(stat.equals("name"))
							{
								query3="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and name like '%" + find + "%'";
							}
							else if(stat.equals("age"))
							{
								query3="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and age=" + find + "";
							}
							else if(stat.equals("position"))
							{
								query3="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and position like '%" + find + "%'";
							}
							else if(stat.equals("price"))
							{
								query3="select Name, Nationality, NamaClub, Age, Position, Price from player p, club c where c.clubID=p.clubID and price<=" + find + "";
							}
						}
							Statement st3=con.createStatement(1004,1008);
							ResultSet rs3=st3.executeQuery(query3);
							while(rs3.next())
							{
					%>
                    		<tr>
                            	<td><a href="player.jsp?find=<%=rs3.getString("nationality")%>&stat=nationality"><%=rs3.getString("nationality")%></a></td>
                                <td><a href="player.jsp?find=<%=rs3.getString("name")%>&stat=name"><%=rs3.getString("name")%></a></td>
                                <td><a href="player.jsp?find=<%=rs3.getString("age")%>&stat=age"><%=rs3.getString("age")%></a></td>
                                <td><a href="player.jsp?find=<%=rs3.getString("position")%>&stat=position"><%=rs3.getString("position")%></a></td>
                                <td><a href="player.jsp?find=<%=rs3.getString("price")%>&stat=price"><%=rs3.getString("price")%></a></td>
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
