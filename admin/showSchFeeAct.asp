<!--#include file="conn.asp" -->
<%
stuYear = Request.QueryString("stuYear")
stuMonth = Request.QueryString("stuMonth")
exec="select * from stu_fee where (stu_year="&stuYear&" and stu_month="&stuMonth&")"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>