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
        	<td height="31" colspan="7" align="left" valign="top" bgcolor="#CCCCCC">
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
	<tr height="60">
    	<td colspan="7">
			<span class="style2">Welcome To Virtual Football</span>
        </td>
    </tr>
    <tr>
    	<td colspan="7">Admin</td>
    </tr>
    <tr height="60">
    	<td colspan="7">
        	<form action="homeAdmin.jsp">
        	<table>
            	<tr>
			    	<td>Search by username</td>                	
                    <td><input type="text" name="txtSearch" /></td>
                    <td><input type="submit" /></td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
    <tr>
    	<td colspan="7">
            <table border="1">
                <tr>
                    <td>Username</td>
                    <td>Name</td>
                    <td>Age</td>
                    <td>Club</td>
                    <td>Favourite Club</td>
                    <td>Location</td>
                    <td></td>
                </tr>
    <%
		//menampilkan data2 dari user yang bukan admin
		String search=request.getParameter("txtSearch");
		String query=new String();
		if(search!=null)
		{
			query="select username,age,NamaClub,[Favourite Club],Location from login l, Club c where l.ClubID=c.ClubID and username not like 'admin' and username like '%" + search + "%'";
		}
		else
		{
			query="select username,age,NamaClub,[Favourite Club],Location from login l, Club c where l.ClubID=c.ClubID and username not like 'admin'";
		}
			ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
		%>
				<tr>
					<td><% out.print(rs.getString("username")); String usrn=rs.getString("username"); %></td>
					<td><%=usrn%></td>
					<td><%=rs.getString("age")%></td>
					<td><%=rs.getString("NamaClub")%></td>
					<td><%=rs.getString("Favourite Club")%></td>
					<td><%=rs.getString("Location")%></td>
					<td><a href="doFired.jsp?username=<%=usrn%>">fired</a></td>
				</tr>
		<%
			}
			con.close();
		%>    
                
            </table>
        </td>
  </tr>    
    <tr>
    	<td colspan="7">
        	<a href="logout.jsp">logout</a>
        </td>
    </tr>
</table>
</body>
</html>
