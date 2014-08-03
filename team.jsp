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
       	<tr>
			<td width="228" height="50" valign="top">
            	<span class="style2">
            	<%
					String username=(String)session.getAttribute("user"); //mengambil username dari session 
					String query="select NamaClub, Image, Balance, Stadium, League, c.ClubID from Login l, Club c where c.ClubID=l.clubID and l.username='" + username + "'"; //mengeset query 
					ResultSet rs=st.executeQuery(query); //menampung hasil query ke rs
					if(rs.next()) //jika ada record berikutnya, maju 1 record
					{
						out.print(rs.getString(1)); //menampilkan hasil
					
				%>
			  's Overview</span>
            </td>
	  </tr>
        <tr>
       	  <td height="281" valign="top">
       	  <table>
            	<tr>
                	<td colspan="2">
						<%
        	                out.print(rs.getString(1) + "'s information");
	                    %>
                    </td>
                </tr>
                <tr>
                	<td align="right" valign="top">Logo : </td>
                    <td><img src="<%=rs.getString(2)%>" width="75" height="75" /></td>
                </tr>
                <tr>
                	<td align="right">Manager : </td>
                    <td><%=username%></td>
                </tr>
                <tr>
                	<td align="right">Balance : </td>
                    <td><%=rs.getString(3)%></td>
                </tr>
                <tr>
                	<td align="right">Stadium : </td>
                    <td><%=rs.getString(4)%></td>
                </tr>
                <tr>
                	<td align="right">League : </td>
                    <td><%=rs.getString(5)%></td>
                </tr>

            </table>
          </td>
          <td width="460" valign="top">
   	  <table border="1">
            	<tr>
                	<td colspan="5" align="left">
                    	Squad View
                    </td>
                </tr>
                <tr>
                	<td>Nationality</td>
                    <td>Player</td>
                    <td>Age</td>
                    <td>Position</td>
                    <td>Price</td>
                </tr>
                <%
					String query2="select * from player where ClubID=" + rs.getInt(6) + "";
					//mengeset query2
					Statement st2=con.createStatement(1004,1008); //membuat statement2
					ResultSet rs2=st2.executeQuery(query2); //mengeset rs2 dari hasil query2
					while(rs2.next()) //jika bukan record terakhir
					{
				%>
				<tr>
                	<td><a href="player.jsp?find=<%=rs2.getString(3)%>&stat=nationality"><%=rs2.getString(3)%></a></td>
                	<td><a href="player.jsp?find=<%=rs2.getString(4)%>&stat=name"><%=rs2.getString(4)%></a></td>
                	<td><a href="player.jsp?find=<%=rs2.getString(5)%>&stat=age"><%=rs2.getString(5)%></a></td>
                   	<td><a href="player.jsp?find=<%=rs2.getString(6)%>&stat=position"><%=rs2.getString(6)%></a></td>
                	<td><a href="player.jsp?find=<%=rs2.getString(7)%>&stat=price"><%=rs2.getInt(7)%></a></td>                    
                </tr>					
			<%
					}
					}
				%>
            </table>
          </td>
      </tr>
	</table>
    <%
		con.close(); //tutup koneksi
	%>
</html>
