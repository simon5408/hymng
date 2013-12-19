<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from edu_type where edu_id = "&request.querystring("eduId"))
	conn.close
	set conn=nothing
	'response.write "<script language='javascript'>" & chr(13) 
	'response.write "alert('³É¹¦É¾³ý£¡');" & Chr(13) 
	'response.write "window.location.href=listUserInfo.asp"&Chr(13) 
	'response.write "<script>"&Chr(13) 
	response.Redirect "listEduType.asp"
	Response.End 
	
%>