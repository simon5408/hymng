<!--#include file="conn.asp" -->
<%
comId = request.form("comId")
comName = request.form("comName")
userId = request.form("userId")
username = request.form("username")

exec="update com_info set com_name='"&comName&"',user_id="&userId&",username='"&username&"' where com_id= "&comId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('推荐机构信息编辑成功!');window.location.href='listComName.asp';</script>")
'response.Redirect "adminConsole.asp"
%>