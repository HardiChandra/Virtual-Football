<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
.style4 {
	font-size: 12px;
	color: #FF0000;
}
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
        	<td width="467" height="388" valign="top">
       		  <span class="style2">Welcome To Virtual Football</span><br />
      <br />
            	Virtual Football merupakan website <em>game soccer manager</em> yang dimainkan secara online.<br />
                Disini, anda dapat menjadi manager dalam club sepakbola kesukaan kalian.<br />
                Banyak fitur yang disediakan, misalnya Transfer, Message, DLL                
         </td>
<td width="221" align="left" valign="top">
<form action="doLogin.jsp" name="form1">
           	  <table>
                	<tr>
                    	<td bgcolor="#CCCCCC" colspan="2">
                        	<span class="style1">Login</span>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                        	Username
                        </td>
                        <td>
                        	<input type="text" name="txtUsername" />
                        </td>
                    </tr>
                    <tr>
                    	<td>
                        	Password
                        </td>
                        <td>
                        	<input type="password" name="txtPassword" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="style4">
                          <%
						  		//menampilkan pesan error
								String psErr=request.getParameter("err");
								if(psErr!=null)
								{
									out.print(psErr);
								}
							%>
                            </span>                        </td>
                </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Login" /></td>
                    </tr>
                    <tr>
                    	<td colspan="2" align="center"><a href="register.jsp">Click here to register</a></td>
                    </tr>
        </table>
      </form>
         </td>
      </tr>
</table>
</body>
</html>
