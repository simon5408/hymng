<!--#include file="conn.asp" -->
<%
username = request.form("username")
showname = request.form("showname")
paswrd = request.form("password")

exec="insert into user_info (username,show_name,paswrd) values('"&username&"','"&showname&"','"&paswrd&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('�û���Ϣ��ӳɹ�!');window.location.href='addUserInfo.asp';</script>")
%>