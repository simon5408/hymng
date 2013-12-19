<!--#include file="conn.asp" -->
<%
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="update edu_type set edu_name='"&eduname&"' where edu_id= "&eduId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('教育方式修改成功!');window.location.href='listEduType.asp';</script>")
'response.Redirect "adminConsole.asp"
%>