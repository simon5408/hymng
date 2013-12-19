<!--#include file="conn.asp" -->
<%
comName = request.form("comName")
userId = request.form("userId")
username = request.form("username")

exec="insert into com_info(com_name,user_id,username) values('"&comName&"',"&userId&",'"&username&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('推荐机构信息添加成功!');window.location.href='addComName.asp';</script>")
%>