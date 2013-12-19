<!--#include file="conn.asp" -->
<%
schId = request.form("schId")
schName = request.form("schName")
schInfo = request.form("schInfo")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="update school set sch_name='"&schName&"',sch_info='"&schInfo&"',edu_id="&eduId&",edu_name='"&eduname&"' where sch_id= "&schId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学校信息修改成功!');window.location.href='listSchName.asp';</script>")
'response.Redirect "adminConsole.asp"
%>