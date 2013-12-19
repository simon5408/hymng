<!--#include file="conn.asp" -->
<%
schName = request.form("schName")
schInfo = request.form("schInfo")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="insert into school (sch_name,sch_info,edu_id,edu_name) values('"&schName&"','"&schInfo&"',"&eduId&",'"&eduname&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学校信息添加成功!');window.location.href='addSchName.asp';</script>")
'response.Redirect "adminConsole.asp"
%>