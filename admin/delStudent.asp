<!--#include file="conn.asp" -->
<%
	delType = request.querystring("delType")
	rdcurl = request.querystring("addr")
	exec = "delete * from "
	if delType = 0 then
		exec = exec + "normal_stu_info where stu_id in ("&request.querystring("studentId")&")"
		'rdcurl = "listStudent.asp"
	else if delType = 1 then
		exec = exec + "gradut_stu_info where gdu_stu_id in ("&request.querystring("studentId")&")"
		'rdcurl = "listGraduStudent.asp"
	else if delType = 2 then
		exec = exec + "leaved_stu_info where lev_stu_id in ("&request.querystring("studentId")&")"
		'rdcurl = "listLeaveStudent.asp"
	end if
	end if
	end if
	conn.execute (exec)
	conn.close
	set conn=nothing
	'response.write("<script language=javascript>alert('³É¹¦É¾³ý£¡');window.history.go(-1);setTimeout('window.location.reload()', 1000);<script>")
	response.Redirect rdcurl
	Response.End 
	
%>