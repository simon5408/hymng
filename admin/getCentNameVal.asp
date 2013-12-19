
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% 
	response.Charset = "gb2312"
	'Response.CacheControl = "no-cache"
	'Response.ContentType = "text/xml"
	response.cachecontrol="no-cache"
	response.addHeader "pragma","no-cache"
	response.expires=-1
	response.expiresAbsolute=now-1
 %>
 <!--#include file="conn.asp" -->
<%
	'session.CodePage = 65001
	eduId = unescape(request.querystring("eduId"))
	
	exec3="select * from center_info where edu_id="&eduId&""
	set rs3=server.createobject("adodb.recordset")
	rs3.open exec3,conn,1,1
	
	schInfo = "<option value=""0"">- Ñ¡Ôñ -</option>"
	
	for i= 1 to rs3.recordcount
	if rs3.eof then
	exit for
	end if
	centerId = cstr(rs3("center_id"))
	schCenter = rs3("sch_center")
	
	schInfo = schInfo + "<option value=" +centerId+">" + schCenter+"</option>"

	rs3.movenext
	next
	

	'Response.Write schInfo
	response.Write schInfo 

	
	conn.close
	set conn=nothing
%>