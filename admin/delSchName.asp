<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from school where sch_id = "&request.querystring("schId"))
	conn.close
	set conn=nothing
	'response.write "<script language='javascript'>" & chr(13) 
	'response.write "alert('³É¹¦É¾³ý£¡');" & Chr(13) 
	'response.write "window.history.go(-1);for(var i=0;i<1;i++){window.location.reload();}"&Chr(13) 
	'response.write "<script>" & Chr(13) 
	response.Redirect "listSchName.asp"
	Response.End 
	
%>