<!--#include file="conn.asp" -->
<%
exec="select * from com_info"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>