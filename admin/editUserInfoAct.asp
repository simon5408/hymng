<!--#include file="conn.asp" -->
<%
userId = request.form("userId")
username = request.form("username")
showname = request.form("showname")
paswrd = request.form("password")

exec="update user_info set username='"&username&"',show_name='"&showname&"',paswrd='"&paswrd&"' where user_id= "&userId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('用户信息修改成功!');window.location.href='listUserInfo.asp';</script>")
'response.Redirect "adminConsole.asp"
%>