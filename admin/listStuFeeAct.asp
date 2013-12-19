<!--#include file="conn.asp" -->
<%
feeType = request.querystring("feeType")
exec="select * from stu_fee where 1=1 "
if feeType <> "" then
	exec =exec + " and fee_type ="&feeType&" "
end if
exec = exec + "order by stu_id asc"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>