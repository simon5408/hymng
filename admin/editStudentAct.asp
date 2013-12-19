<!--#include file="conn.asp" -->
<%
stuId = request.form("stuId")
stuName = request.form("stuName")
stuNo = request.form("stuNo")
stuPsw = request.form("stuPsw")
stuInYear = CDate(request.form("stuInYear"))
stuInfo = request.form("stuInfo")
userId = request.form("userId")
username = request.form("username")
subUserId = request.form("subUserId")
subUsername = request.form("subUsername")
eduId = request.form("eduId")
eduname = request.form("eduname")

comId = request.form("comId")
comName = request.form("comName")
inYear = request.form("inYear")
sphone = request.form("sphone")
smobile = request.form("smobile")
teacher = request.form("teacher")
schId = request.form("schId")
schName = request.form("schName")
isDegree = request.form("isDegree")
arrange = request.form("arrange")
isZbtao = request.form("isZbtao")
specId = request.form("specId")
specName = request.form("specName")
centerId = request.form("centerId")
schCenter = request.form("schCenter")

totalTypeFee = request.form("totalTypeFee")
typeFee1 = request.form("typeFee1")
typeFee2 = request.form("typeFee2")
typeFee3 = request.form("typeFee3")
typeFee4 = request.form("typeFee4")
typeFee1Year = CDate(request.form("typeFee1Year"))
typeFee2Year = CDate(request.form("typeFee2Year"))
typeFee3Year = CDate(request.form("typeFee3Year"))
typeFee4Year = CDate(request.form("typeFee4Year"))
typeFee1Memo = request.form("typeFee1Memo")
typeFee2Memo = request.form("typeFee2Memo")
typeFee3Memo = request.form("typeFee3Memo")
typeFee4Memo = request.form("typeFee4Memo")

totalFee = request.form("totalFee")
fee1 = request.form("fee1")
fee2 = request.form("fee2")
fee3 = request.form("fee3")
fee4 = request.form("fee4")
fee5 = request.form("fee5")
fee6 = request.form("fee6")
fee7 = request.form("fee7")
fee8 = request.form("fee8")
fee1Year = CDate(request.form("fee1Year"))
fee2Year = CDate(request.form("fee2Year"))
fee3Year = CDate(request.form("fee3Year"))
fee4Year = CDate(request.form("fee4Year"))
fee5Year = CDate(request.form("fee5Year"))
fee6Year = CDate(request.form("fee6Year"))
fee8Year = CDate(request.form("fee8Year"))
fee7Year = CDate(request.form("fee7Year"))
fee1Memo = request.form("fee1Memo")
fee2Memo = request.form("fee2Memo")
fee3Memo = request.form("fee3Memo")
fee4Memo = request.form("fee4Memo")
fee5Memo = request.form("fee5Memo")
fee6Memo = request.form("fee6Memo")
fee7Memo = request.form("fee7Memo")
fee8Memo = request.form("fee8Memo")
fee1Bill = request.form("fee1Bill")
fee2Bill = request.form("fee2Bill")
fee3Bill = request.form("fee3Bill")
fee4Bill = request.form("fee4Bill")
fee5Bill = request.form("fee5Bill")
fee6Bill = request.form("fee6Bill")
fee7Bill = request.form("fee7Bill")
fee8Bill = request.form("fee8Bill")

factTotalFee = request.form("factTotalFee")

totalRefundFee = request.form("totalRefundFee")
refundFee1 = request.form("refundFee1")
refundFee2 = request.form("refundFee2")
refundFee1Year = CDate(request.form("refundFee1Year"))
refundFee2Year = CDate(request.form("refundFee2Year"))
refundFee1Memo = request.form("refundFee1Memo")
refundFee2Memo = request.form("refundFee2Memo")

stuFee = request.form("stuFee")
stuFeeYear = request.form("stuFeeYear")
stuFeeMonth = request.form("stuFeeMonth")
smemo = request.form("smemo")
ticheng = request.form("ticheng")

watchStatus = request.form("watchStatus")

if watchStatus <> 1 then
	watchStatus = 0
end if

'学生状态
stuStatus = request.form("stuStatus")
if stuStatus = 1 then
' 已毕业
	'1 删除在读学生信息
	execDel = "delete * from normal_stu_info where stu_id = "&stuId&""
	conn.execute (execDel)
	
	'2 新增毕业学生信息 
	exec="insert into gradut_stu_info ( stu_name, stu_no, stu_psw, stu_in_year, stu_info, edu_id, edu_name, user_id, username, sub_user_id, sub_username, com_id, com_name, in_year, sphone, smobile, teacher, sch_id, sch_name, is_degree, arrange, is_zbtao, spec_id, spec_name, center_id,  sch_center, total_type_fee, type_fee1, type_fee2, type_fee3, type_fee4, type_fee1_year, type_fee2_year, type_fee3_year, type_fee4_year, type_fee1_memo, type_fee2_memo, type_fee3_memo, type_fee4_memo, total_fee, fee1, fee2, fee3, fee4, fee5, fee6, fee7, fee8, fee1_year, fee2_year, fee3_year, fee4_year, fee5_year, fee6_year, fee7_year, fee8_year, fee1_memo, fee2_memo, fee3_memo, fee4_memo, fee5_memo, fee6_memo, fee7_memo, fee8_memo, fee1_bill, fee2_bill, fee3_bill, fee4_bill, fee5_bill, fee6_bill, fee7_bill, fee8_bill, fact_total_fee, total_refund_fee, refund_fee1, refund_fee2, refund_fee1_year, refund_fee2_year,   refund_fee1_memo, refund_fee2_memo, stu_fee, stu_fee_year, stu_fee_month, smemo, ticheng) values ('"&stuName&"', '"&stuNo&"', '"&stuPsw&"', '"&stuInYear&"', '"&stuInfo&"', "&eduId&", '"&eduname&"', "&userId&", '"&username&"', "&subUserId&", '"&subUsername&"', "&comId&", '"&comName&"', '"&inYear&"', '"&sphone&"', '"&smobile&"', '"&teacher&"', "&schId&", '"&schName&"', "&isDegree&", "&arrange&", "&isZbtao&", "&specId&", '"&specName&"', "&centerId&", '"&schCenter&"',"&totalTypeFee&", "&typeFee1&", "&typeFee2&", "&typeFee3&", "&typeFee4&", '"&typeFee1Year&"', '"&typeFee2Year&"', '"&typeFee3Year&"', '"&typeFee4Year&"', '"&typeFee1Memo&"', '"&typeFee2Memo&"', '"&typeFee3Memo&"', '"&typeFee4Memo&"', "&totalFee&","&fee1&", "&fee2&", "&fee3&", "&fee4&", "&fee5&", "&fee6&", "&fee7&", "&fee8&", '"&fee1Year&"', '"&fee2Year&"', '"&fee3Year&"', '"&fee4Year&"', '"&fee5Year&"', '"&fee6Year&"', '"&fee7Year&"', '"&fee8Year&"', '"&fee1Memo&"', '"&fee2Memo&"', '"&fee3Memo&"', '"&fee4Memo&"', '"&fee5Memo&"', '"&fee6Memo&"', '"&fee7Memo&"', '"&fee8Memo&"', '"&fee1Bill&"', '"&fee2Bill&"', '"&fee3Bill&"', '"&fee4Bill&"', '"&fee5Bill&"', '"&fee6Bill&"', '"&fee7Bill&"', '"&fee8Bill&"', "&factTotalFee&", "&totalRefundFee&", "&refundFee1&", "&refundFee2&", '"&refundFee1Year&"', '"&refundFee2Year&"', '"&refundFee1Memo&"', '"&refundFee2Memo&"', "&stuFee&", "&stuFeeYear&", "&stuFeeMonth&", '"&smemo&"', '"&ticheng&"')"
	conn.execute exec

else if stuStatus = 2 then
' 已退学
	'1 删除在读学生信息
	execDel = "delete * from normal_stu_info where stu_id = "&stuId&""
	conn.execute (execDel)
	
	'2 新增退学学生信息 
	exec="insert into leaved_stu_info (  stu_name, stu_no, stu_psw, stu_in_year, stu_info, edu_id, edu_name, user_id, username, sub_user_id, sub_username, com_id, com_name, in_year, sphone, smobile, teacher, sch_id, sch_name, is_degree, arrange, is_zbtao, spec_id, spec_name, center_id,  sch_center, total_type_fee, type_fee1, type_fee2, type_fee3, type_fee4, type_fee1_year, type_fee2_year, type_fee3_year, type_fee4_year, type_fee1_memo, type_fee2_memo, type_fee3_memo, type_fee4_memo, total_fee, fee1, fee2, fee3, fee4, fee5, fee6, fee7, fee8, fee1_year, fee2_year, fee3_year, fee4_year, fee5_year, fee6_year, fee7_year, fee8_year, fee1_memo, fee2_memo, fee3_memo, fee4_memo, fee5_memo, fee6_memo, fee7_memo, fee8_memo, fee1_bill, fee2_bill, fee3_bill, fee4_bill, fee5_bill, fee6_bill, fee7_bill, fee8_bill, fact_total_fee, total_refund_fee, refund_fee1, refund_fee2, refund_fee1_year, refund_fee2_year,   refund_fee1_memo, refund_fee2_memo, stu_fee, stu_fee_year, stu_fee_month, smemo, ticheng) values ('"&stuName&"', '"&stuNo&"', '"&stuPsw&"', '"&stuInYear&"', '"&stuInfo&"', "&eduId&", '"&eduname&"', "&userId&", '"&username&"', "&subUserId&", '"&subUsername&"', "&comId&", '"&comName&"', '"&inYear&"', '"&sphone&"', '"&smobile&"', '"&teacher&"', "&schId&", '"&schName&"', "&isDegree&", "&arrange&", "&isZbtao&", "&specId&", '"&specName&"', "&centerId&", '"&schCenter&"',"&totalTypeFee&", "&typeFee1&", "&typeFee2&", "&typeFee3&", "&typeFee4&", '"&typeFee1Year&"', '"&typeFee2Year&"', '"&typeFee3Year&"', '"&typeFee4Year&"', '"&typeFee1Memo&"', '"&typeFee2Memo&"', '"&typeFee3Memo&"', '"&typeFee4Memo&"', "&totalFee&","&fee1&", "&fee2&", "&fee3&", "&fee4&", "&fee5&", "&fee6&", "&fee7&", "&fee8&", '"&fee1Year&"', '"&fee2Year&"', '"&fee3Year&"', '"&fee4Year&"', '"&fee5Year&"', '"&fee6Year&"', '"&fee7Year&"', '"&fee8Year&"', '"&fee1Memo&"', '"&fee2Memo&"', '"&fee3Memo&"', '"&fee4Memo&"', '"&fee5Memo&"', '"&fee6Memo&"', '"&fee7Memo&"', '"&fee8Memo&"', '"&fee1Bill&"', '"&fee2Bill&"', '"&fee3Bill&"', '"&fee4Bill&"', '"&fee5Bill&"', '"&fee6Bill&"', '"&fee7Bill&"', '"&fee8Bill&"', "&factTotalFee&", "&totalRefundFee&", "&refundFee1&", "&refundFee2&", '"&refundFee1Year&"', '"&refundFee2Year&"', '"&refundFee1Memo&"', '"&refundFee2Memo&"', "&stuFee&", "&stuFeeYear&", "&stuFeeMonth&", '"&smemo&"', '"&ticheng&"')"
	conn.execute exec

else
' 在读
	exec="update normal_stu_info set stu_name='"&stuName&"',stu_no='"&stuNo&"', stu_psw='"&stuPsw&"', stu_in_year='"&stuInYear&"', stu_info='"&stuInfo&"', edu_id="&eduId&", edu_name='"&eduname&"', user_id="&userId&", username='"&username&"', sub_user_id="&subUserId&", sub_username='"&subUsername&"', com_id="&comId&", com_name='"&comName&"', in_year='"&inYear&"', sphone='"&sphone&"', smobile='"&smobile&"', teacher='"&teacher&"', sch_id="&schId&", sch_name='"&schName&"', is_degree="&isDegree&", arrange="&arrange&", is_zbtao="&isZbtao&", spec_id="&specId&", spec_name='"&specName&"', center_id="&centerId&", sch_center='"&schCenter&"', total_type_fee="&totalTypeFee&", type_fee1="&typeFee1&", type_fee2="&typeFee2&", type_fee3="&typeFee3&", type_fee4="&typeFee4&", type_fee1_year='"&typeFee1Year&"', type_fee2_year='"&typeFee2Year&"', type_fee3_year='"&typeFee3Year&"', type_fee4_year='"&typeFee4Year&"', type_fee1_memo='"&typeFee1Memo&"', type_fee2_memo='"&typeFee2Memo&"', type_fee3_memo='"&typeFee3Memo&"', type_fee4_memo='"&typeFee4Memo&"', total_fee="&totalFee&",fee1="&fee1&", fee2="&fee2&", fee3="&fee3&", fee4="&fee4&", fee5="&fee5&", fee6="&fee6&", fee7="&fee7&", fee8="&fee8&", fee1_year='"&fee1Year&"', fee2_year='"&fee2Year&"', fee3_year='"&fee3Year&"', fee4_year='"&fee4Year&"', fee5_year='"&fee5Year&"', fee6_year='"&fee6Year&"', fee7_year='"&fee7Year&"', fee8_year='"&fee8Year&"', fee1_memo='"&fee1Memo&"', fee2_memo='"&fee2Memo&"', fee3_memo='"&fee3Memo&"', fee4_memo='"&fee4Memo&"', fee5_memo='"&fee5Memo&"', fee6_memo='"&fee6Memo&"', fee7_memo='"&fee7Memo&"', fee8_memo='"&fee8Memo&"', fee1_bill='"&fee1Bill&"', fee2_bill='"&fee2Bill&"', fee3_bill='"&fee3Bill&"', fee4_bill='"&fee4Bill&"', fee5_bill='"&fee5Bill&"', fee6_bill='"&fee6Bill&"', fee7_bill='"&fee7Bill&"', fee8_bill='"&fee8Bill&"', fact_total_fee="&factTotalFee&", total_refund_fee="&totalRefundFee&", refund_fee1="&refundFee1&", refund_fee2="&refundFee2&", refund_fee1_year='"&refundFee1Year&"', refund_fee2_year='"&refundFee2Year&"', refund_fee1_memo='"&refundFee1Memo&"', refund_fee2_memo='"&refundFee2Memo&"', stu_fee="&stuFee&", stu_fee_year="&stuFeeYear&", stu_fee_month="&stuFeeMonth&", smemo='"&smemo&"', ticheng='"&ticheng&"', watch_status="&watchStatus&" where stu_id= "&stuId&""

	conn.execute exec
	
end if
end if

conn.close
set conn=nothing
response.write("<script language=javascript>alert('学生信息编辑成功!');window.close();</script>")
%>