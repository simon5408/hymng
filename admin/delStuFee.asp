<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from stu_fee where sfee_id = "&request.querystring("sfeeId"))
	conn.close
	set conn=nothing
	response.write "<script language='javascript'>" & chr(13) 
	response.write "alert('�ɹ�ɾ����');" & Chr(13) 
	response.write "window.history.go(-1);for(var i=0;i<1;i++){window.location.reload();}"&Chr(13) 
	response.write "</script>" & Chr(13) 
	Response.End 
	
%>