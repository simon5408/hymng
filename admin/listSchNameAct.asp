<!--#include file="conn.asp" -->
<%
exec="select * from school"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>