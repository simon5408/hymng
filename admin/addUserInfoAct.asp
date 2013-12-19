<!--#include file="conn.asp" -->
<%
username = request.form("username")
showname = request.form("showname")
paswrd = request.form("password")

exec="insert into user_info (username,show_name,paswrd) values('"&username&"','"&showname&"','"&paswrd&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('用户信息添加成功!');window.location.href='addUserInfo.asp';</script>")
%>