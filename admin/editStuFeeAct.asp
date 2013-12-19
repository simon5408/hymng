<!--#include file="conn.asp" -->
<%
sfeeId = request.form("sfeeId")
stuId = request.form("stuId")
stuName = request.form("stuName")
feeType = request.form("feeType")
stuFee = request.form("stuFee")
stuYear = request.form("stuYear")
stuMonth = request.form("stuMonth")
stuMobile= Request.QueryString("stuMobile")

exec="update stu_fee set stu_id="&stuId&",stu_name='"&stuName&"',fee_type="&feeType&",stu_fee="&stuFee&",stu_year="&stuYear&",stu_month="&stuMonth&",stu_mobile='"&stuMobile&"' where sfee_id= "&sfeeId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学生费用信息修改成功!');window.location.href='listStuFee.asp';</script>")
'response.Redirect "adminConsole.asp"
%>