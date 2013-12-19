<!--#include file="conn.asp" -->
<%
stuId = request.form("stuId")
stuName = request.form("stuName")
feeType = request.form("feeType")
stuFee = request.form("stuFee")
stuYear = request.form("stuYear")
stuMonth = request.form("stuMonth")

exec="insert into stu_fee(stu_id,stu_name,stu_fee,stu_year,stu_month,fee_type) values("&stuId&",'"&stuName&"',"&stuFee&","&stuYear&","&stuMonth&","&feeType&")"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('学生费用已添加成功!');window.location.href='addStuFee.asp';</script>")
%>