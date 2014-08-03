<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<%
	//validasi profile
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
       	  <td width="208"><span class="style2">Edit Profile</span></td>
  </tr>
  <tr>
  	<td valign="top">
		<form name="form1" action="doEditProfile.jsp">
		<table border="1">
			<tr>
				<td>
					Manager Name : 
				</td>
				<td>
					<input type="text" name="txtName" />
				</td>
			</tr>
			<tr>
				<td>
					Age : 
				</td>
				<td>
					<input type="text" name="txtAge" />
				</td>
			</tr>
			<tr>
				<td>
					Location : 
				</td>
				<td>
					<input type="text" name="txtLocation" />
				</td>
			</tr>
			<tr>
				<td>
					Hobby : 
				</td>
				<td>
					<input type="text" name="txtHobby" />
				</td>
			</tr>
			<tR>
				<td>
					Favourite Club : 
				</td>
				<td>
					<input type="text" name="txtFavClub" />
				</td>
			</tR>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" />
					<%
						//menampilkan pesan error 
						String err=request.getParameter("err");
						if(err!=null)
						{
							out.print(err);
						}
					%>
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
