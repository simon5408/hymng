<!--#include file="conn.asp" -->
<%
schCenter = request.form("schCenter")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="insert into center_info(sch_center,edu_id,edu_name) values('"&schCenter&"',"&eduId&",'"&eduname&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学习中心添加成功!');window.location.href='addSchCenter.asp';</script>")
%>