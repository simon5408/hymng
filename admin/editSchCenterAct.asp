<!--#include file="conn.asp" -->
<%
centerId = request.form("centerId")
schCenter = request.form("schCenter")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="update center_info set sch_center='"&schCenter&"',edu_id="&eduId&",edu_name='"&eduname&"' where center_id= "&centerId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学习中心编辑成功!');window.location.href='listSchCenter.asp';</script>")
'response.Redirect "adminConsole.asp"
%>