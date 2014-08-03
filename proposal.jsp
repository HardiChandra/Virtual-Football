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
.style1 {font-size: 24px}
-->
<!--
.style2 {font-size: 12px}
-->
</style>
</head>

<body background="Image/Field.jpg">
	<table align="right" bgcolor="#FFFFFF" width="700">
<tr>
        	<td height="31" colspan="2" align="left" valign="top" bgcolor="#CCCCCC">
       	  	  <table width="500" cellspacing="2" cellpadding="2" align="center">
		  <tr>
                    	<td><a href="home.jsp">Home</span></a></td>
                        <td><a href="team.jsp">Team</span></a></td>
                        <td><a href="player.jsp">Player</span></a></td>
                        <td><a href="message.jsp">Message</span></a></td>
                        <td><a href="transfer.jsp">Transfer</span></a></td>
                        <td><a href="about.jsp">About</span></a></td>
                  </tr>
                </table>
    		</td>
      </tr>
      <tr height="60">
      	<td valign="top">
       	<span class="style1">Welcome to virtual footbal</span>        </td>
      </tr>
      <tr>
      	<td valign="top">
       	<span class="style2">Make a proposal</span>        </td>
      </tr>
      <tr>
      	<td>
        	<form name="formtrans" action="doProposal.jsp">
        	<table border="1">
            	<%
					String player=request.getParameter("name"); //menampung hasil kiriman
					String query="select * from player where name='" + player + "'"; //mengeset query
					ResultSet rs=st.executeQuery(query); //menjalankan query dan ditampung ke rs
					while(rs.next()) //jika masih ada record berikutnya
					{
				%>
            	<tr>
                	<td align="right">Player Name : </td>
                    <td><%=rs.getString("name")%><input type="hidden" name="txtName" value="<%=player%>" /></td>
                </tr>
                <tr>
                	<td align="right">Position : </td>
                    <td><%=rs.getString("position")%></td>
                </tr>
                <tr>
                	<td align="right">Price : </td>
                    <td><%=rs.getString("price")%></td>
                </tr>
                <tr>
                	<td align="right">Type : </td>
                    <td>
                    	<select name="transType">
                    		<option value="Loan">Loan</option>
                    		<option value="Transfer">Transfer</option>                            
                    	</select>
                    </td>
                </tr>
                <tr>
                	<td align="right">Money : </td>
                    <td><input type="text" name="txtMoney" /></td>
                </tr>
				<tr>
                	<td colspan="2">
                    	<%
							//tampilkan pesan error
							String psErr=request.getParameter("err");
							if(psErr!=null)
							{
								out.print(psErr);
							}
						%>
                    </td>
                </tr>
                <%
					}
					con.close();
				%>
                <tr>
                	<td colspan="2"><input type="submit" /></td>
                </tr>
            </table>
            </form>
        </td>
      </tr>
</table>
</body>
</html>
