<!--#include file="conn.asp" -->
<%
eduname = request.form("eduname")

exec="insert into edu_type (edu_name) values('"&eduname&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('������ʽ��ӳɹ�!');window.location.href='addEduType.asp';</script>")
%>