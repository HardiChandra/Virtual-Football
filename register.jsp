<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style2 {
	color: #0033FF;
	font-weight: bold;
	font-size: 24px;
}
.style6 {color: #0000FF}
.style8 {color: #0000FF; font-size: 12px; }
-->
</style>
</head>

<body background="Image/Field.jpg">
	<table width="700" height="514" align="right" bgcolor="#FFFFFF">
<tr>
        	<td width="1000" height="31" colspan="2" align="left" valign="top" bgcolor="#CCCCCC">
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
        <tr>
       	  <td valign="top">
        	<span class="style2">Welcome To Virtual Football</span><br /><br />
            <span class="style6">register</span><br />
            <form name="form1" action="doRegister.jsp">
            <table>
            	<tr>
                	<td>Username</td>
                    <td><input type="text" name="txtUsername" /></td>
                </tr>
                <Tr>
                	<td>Password</td>
                    <td><input type="password" name="txtPassword" /></td>
                </Tr>
                <tr>
                	<td>Age</td>
                    <td><input type="text" name="txtAge" width="70" /></td>
                </tr>
                <tr>
                	<td>Club</td>
                    <td>
                    	<select name="cmbClub">
                        	<%
								String query="select * from club"; //mengeset query
								ResultSet rs=st.executeQuery(query); //menampung hasil query ke rs
								int i=1; //inisialisasi i=1
								while(rs.next()) //jika rs bukan recordterakhir
								{
							%>
                            		<option value="<%=i%>"><%=rs.getString("NamaClub")%></option>
                            <%
									i++; //i+1
								}
								con.close(); //tutup koneksi
							%>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td>
               	    <span class="style8">
                    	<%
							String psErr=request.getParameter("err"); //menmpung hasil err
							if(psErr!=null) //jika ada psErr
							{
								out.print(psErr); //cetak psErr
							}
						%>
                    </span>                    </td>
                </tr>
                <tr>
                	<td colspan="2" align="center"><input type="submit" value="Submit" /></td>
                </tr>
            </table>
            </form>
           </td>
        </tr>
	</table>
</body>
</html>