<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from user_info where user_id = "&request.querystring("userId"))
	conn.close
	set conn=nothing
	'response.write "<script language='javascript'>" & chr(13) 
	'response.write "alert('³É¹¦É¾³ý£¡');" & Chr(13) 
	'response.write "window.location.href=listUserInfo.asp"&Chr(13) 
	'response.write "<script>"&Chr(13) 
	response.Redirect "listUserInfo.asp"
	Response.End 
	
%>