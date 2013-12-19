<!--#include file="conn.asp" -->
<%
	stuName = session("stuName")
	smobile = session("smobile")
	usersId = session("usersId")
	subUserId = session("subUserId")
	comId = session("comId")
	inYear = session("inYear")
	teacher = session("teacher")
	schId = session("schId")
	eduId = session("eduId")
	isDegree = session("isDegree")
	isZbtao = session("isZbtao")
	arrange = session("arrange")
	specId = session("specId")
	centerId = session("centerId")
	stuFeeYear = session("stuFeeYear")
	stuFeeMonth = session("stuFeeMonth")
	'入学时间范围
	fromYear = session("fromYear")
	toYear = session("toYear")
	'返利时间范围
	fromTypeFeeYear = session("fromTypeFeeYear")
	toTypeFeeYear = session("toTypeFeeYear")
	'已收费用时间范围
	fromFeeYear = session("fromFeeYear")
	toFeeYear = session("toFeeYear")
	
	chargesql="select * from normal_stu_info where 1=1 "
	
	userId = session("user_id")
	' 所属用户
	if  userId <> 1 then
		chargesql = chargesql + " and (user_id="&userId&" or sub_user_id="&userId&") "
	end if
	
	'学生姓名
	if stuName <> "" then
		chargesql =chargesql + " and stu_name like '%"&stuName&"%' "
	end if
	'手机
	if smobile <> "" then
		chargesql =chargesql + " and smobile like '%"&smobile&"%' "
	end if
	'入学时间范围
	if fromYear <> "" and toYear <> "" then
		chargesql =chargesql + " and (stu_in_year between #"&fromYear&"# and #"&toYear&"#) "
	end if
	'返利时间范围
	if fromTypeFeeYear <> "" and toTypeFeeYear <> "" then
		chargesql =chargesql + " and ((type_fee1_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee2_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee3_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee4_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)) "
	end if
	'已收费用时间范围
	if fromFeeYear <> "" and toFeeYear <> "" then
		chargesql =chargesql + " and (fee1_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee2_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee3_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee4_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee5_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee6_year between #"&fromFeeYear&"# and #"&toFeeYear&"#) "
	end if
	'注册机构
	if usersId <> 0 then
		chargesql =chargesql + " and user_id ="&usersId&" "
	end if
	'推荐机构
	if subUserId <> 0 then
		chargesql =chargesql + " and sub_user_id ="&subUserId&" "
	end if
	'推荐人
	if comId <> 0 then
		chargesql =chargesql + " and com_id ="&comId&" "
	end if
	'教师
	if teacher <> "" then
		chargesql =chargesql + " and teacher like '%"&teacher&"%' "
	end if
	'入学年份
	if inYear <> "" then
		chargesql =chargesql + " and in_year like '%"&inYear&"%' "
	end if
	'学校名称
	if schId <> 0 then
		chargesql =chargesql + " and sch_id ="&schId&" "
	end if
	'教育方式
	if eduId <> 0 then
		chargesql =chargesql + " and edu_id="&eduId&" "
	end if
	'学位要求
	if isDegree <>0 then
		chargesql =chargesql + " and is_degree="&isDegree&" "
	end if
	'专本套
	if isZbtao <>0 then
		chargesql =chargesql + " and is_zbtao="&isZbtao&" "
	end if
	'层次
	if arrange <> 0 then
		chargesql =chargesql + " and arrange="&arrange&" "
	end if
	'所学专业
	if specId <> 0 then
		chargesql =chargesql + " and spec_id="&specId&" "
	end if
	'学习中心
	if centerId <> 0 then
		chargesql =chargesql + " and center_id="&centerId&" "
	end if
	'交费年
	if stuFeeYear <> 0 then
		chargesql =chargesql + " and stu_fee_year="&stuFeeYear&" "
	end if
	'交费月
	if stuFeeMonth <> 0 then
		chargesql =chargesql + " and stu_fee_month="&stuFeeMonth&" "
	end if
	
	'chargesql="select * from normal_stu_info where (user_id="&userId&" or sub_user_id="&userId&")" 
	
	set rs200=server.createobject("adodb.recordset")
	rs200.open chargesql,conn,1,1 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>慧源教育-后台管理平台</title>
	<LINK href="../css/onto_style.css" type="text/css" rel="stylesheet">
	<!-- 日期控件 -->
	<script type='text/javascript' src="../js/datePicker/WdatePicker.js"></script>
	<script type='text/javascript' src="../js/datePicker/config.js"></script>
	<script type='text/javascript' src="../js/datePicker/lang/zh-cn.js"></script>
	
	<!-- jquery js -->
	<script language="javascript" src="../js/common/jQuery/jquery-1.4.4.min.js"></script>
	<script language="javascript" src="../js/common/jQuery/easyui/jquery.easyui.min.js"></script>
	
	<!-- jquery css -->
	<link rel="stylesheet" type="text/css" href="../js/common/jQuery/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../js/common/jQuery/easyui/themes/icon.css">
	
	<!-- private css -->
	<link rel="stylesheet" type="text/css" href="../css/manage/hyMng.css">
	
	<!-- attr css -->
	<link rel="stylesheet" type="text/css" href="../css/manage/hyAttr.css">
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "已交费学生信息管理"
	session("leftZero") = "1"

%>

	<div id="right" style="width:100%; top:0px;">
		<div id="listDiv">
<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5; font-family:'微软雅黑', Helvetica, sans-serif;">
	<tr>
		<th>序列</th>
		<th>学员</th>
		<th>手机</th>
		<th>注册机构</th>
		<th>推荐机构</th>
		<th>推荐人</th>
		<th>已收费用1</th>
		<th>已收费用2</th>
		<th>已收费用3</th>
		<th>已收费用4</th>
		<th>已收费用5</th>
		<th>已收费用6</th>
	</tr>
	<%
		dim totalCgeFee
		fromFeeYearStr = "1970-01-01"
		if session("fromFeeYear") <> "" then
			fromFeeYearDate = session("fromFeeYear")
		end if
		fromFeeYearDate = CDate(fromFeeYearStr)
		
		toFeeYearStr = "1970-01-01"
		if session("toFeeYear") <> "" then
			toFeeYearStr = session("toFeeYear")
		else
			toFeeYearStr = cstr(trim(year(now())))+"-"+cstr(trim(month(now())))+"-"+cstr(trim(day(now())))
		end if
		toFeeYearDate = CDate(toFeeYearStr)
	
		for j= 1 to rs200.recordcount
		if rs200.eof or rs200.bof then
		exit for
		end if
	%>
	<tr>
		<td><%=j%></td>
		<td><span title="备注：&#13;&#10;<%=rs200("smemo")%>&#13;&#10;---------&#13;&#10;学生说明：&#13;&#10;<%=rs200("stu_info")%>"><%=rs200("stu_name")%></span></td>
		<td><%=rs200("smobile")%>&nbsp;</td>
		<td><%=rs200("username")%></td>
		<%
			subUsername = "-"
			if(IsNull(rs200("sub_username"))) then 
				subUsername= "-"
			else
				subUsername= rs200("sub_username")
			end if
		%>
		<td><%=subUsername%></td>
		<td><%=rs200("com_name")%></td>
		<%
			dim fee1Year, fee1, fee1Memo, fee1Bill
			fee1YearStr = rs200("fee1_year")
			if fee1YearStr <> "1970-01-01" and fee1YearStr <> "1970-1-1" then
				fee1YearDate = CDate(fee1YearStr)
				if fee1YearDate < toFeeYearDate and fee1YearDate > fromFeeYearDate then
					fee1 = rs200("fee1")
					
					totalCgeFee = totalCgeFee + fee1
					
					fee1Year = fee1YearStr
					
					fee1Memo = "-"
					if IsNull(rs200("fee1_memo")) then 
						fee1Memo = "-"
					else 
						fee1Memo = rs200("fee1_memo")
					end if
					
					fee1Bill = "-"
					if IsNull(rs200("fee1_bill")) then 
						fee1Bill = "-"
					else 
						fee1Bill = rs200("fee1_bill")
					end if
				else 
					fee1 = 0
					fee1Year = "-"
					fee1Memo = "-"
					fee1Bill = "-"
				end if
			else
				fee1 = 0
				fee1Year = "-"
				fee1Memo = "-"
				fee1Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee1%> 元<br>
			日期：<%=fee1Year%><br>
			备注：<%=fee1Memo%><br>
			收据：<%=fee1Bill%>
		</td>
		<%
			dim fee2Year, fee2, fee2Memo, fee2Bill

			fee2YearStr = rs200("fee2_year")
			if fee2YearStr <> "" and fee2YearStr <> "1970-01-01" and fee2YearStr <> "1970-1-1" then
				fee2YearDate = CDate(fee2YearStr)
				if fee2YearDate < toFeeYearDate and fee2YearDate > fromFeeYearDate then
					fee2 = rs200("fee2")
					
					totalCgeFee = totalCgeFee + fee2
					
					fee2Year = fee2YearStr
					
					fee2Memo = "-"
					if IsNull(rs200("fee2_memo")) then 
						fee2Memo = "-"
					else 
						fee2Memo = rs200("fee2_memo")
					end if
					
					fee2Bill = "-"
					if IsNull(rs200("fee2_bill")) then 
						fee2Bill = "-"
					else 
						fee2Bill = rs200("fee2_bill")
					end if
				else 
					fee2 = 0
					fee2Year = "-"
					fee2Memo = "-"
					fee2Bill = "-"
				end if
			else
				fee2 = 0
				fee2Year = "-"
				fee2Memo = "-"
				fee2Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee2%> 元<br>
			日期：<%=fee2Year%><br>
			备注：<%=fee2Memo%><br>
			收据：<%=fee2Bill%>
		</td>
		<%
			dim fee3Year, fee3, fee3Memo, fee3Bill
			fee3YearStr = rs200("fee3_year")
			if fee3YearStr <> "1970-01-01" and fee3YearStr <> "1970-1-1" then
				fee3YearDate = CDate(fee3YearStr)
				if fee3YearDate < toFeeYearDate and fee3YearDate > fromFeeYearDate then
					fee3 = rs200("fee3")
					
					totalCgeFee = totalCgeFee + fee3
					
					fee3Year = fee3YearStr
					
					fee3Memo = "-"
					if IsNull(rs200("fee3_memo")) then 
						fee3Memo = "-"
					else 
						fee3Memo = rs200("fee3_memo")
					end if
					
					fee3Bill = "-"
					if IsNull(rs200("fee3_bill")) then 
						fee3Bill = "-"
					else 
						fee3Bill = rs200("fee3_bill")
					end if
				else 
					fee3 = 0
					fee3Year = "-"
					fee3Memo = "-"
					fee3Bill = "-"
				end if
			else
				fee3 = 0
				fee3Year = "-"
				fee3Memo = "-"
				fee3Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee3%> 元<br>
			日期：<%=fee3Year%><br>
			备注：<%=fee3Memo%><br>
			收据：<%=fee3Bill%>
		</td>
		<%
			dim fee4Year, fee4, fee4Memo, fee4Bill
			fee4YearStr = rs200("fee4_year")
			if fee4YearStr <> "1970-01-01" and fee4YearStr <> "1970-1-1" then
				fee4YearDate = CDate(fee4YearStr)
				if fee4YearDate < toFeeYearDate and fee4YearDate > fromFeeYearDate then
					fee4 = rs200("fee4")
					
					totalCgeFee = totalCgeFee + fee4
					
					fee4Year = fee4YearStr
					
					fee4Memo = "-"
					if IsNull(rs200("fee4_memo")) then 
						fee4Memo = "-"
					else 
						fee4Memo = rs200("fee4_memo")
					end if
					
					fee4Bill = "-"
					if IsNull(rs200("fee4_bill")) then 
						fee4Bill = "-"
					else 
						fee4Bill = rs200("fee4_bill")
					end if
				else 
					fee4 = 0
					fee4Year = "-"
					fee4Memo = "-"
					fee4Bill = "-"
				end if
			else
				fee4 = 0
				fee4Year = "-"
				fee4Memo = "-"
				fee4Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee4%> 元<br>
			日期：<%=fee4Year%><br>
			备注：<%=fee4Memo%><br>
			收据：<%=fee4Bill%>
		</td>
		<%
			dim fee5Year, fee5, fee5Memo, fee5Bill
			fee5YearStr = rs200("fee5_year")
			if fee5YearStr <> "1970-01-01" and fee5YearStr <> "1970-1-1" then
				fee5YearDate = CDate(fee5YearStr)
				if fee5YearDate < toFeeYearDate and fee5YearDate > fromFeeYearDate then
					fee5 = rs200("fee5")
					
					totalCgeFee = totalCgeFee + fee5
					
					fee5Year = fee5YearStr
					
					fee5Memo = "-"
					if IsNull(rs200("fee5_memo")) then 
						fee5Memo = "-"
					else 
						fee5Memo = rs200("fee5_memo")
					end if
					
					fee5Bill = "-"
					if IsNull(rs200("fee5_bill")) then 
						fee5Bill = "-"
					else 
						fee5Bill = rs200("fee5_bill")
					end if
				else 
					fee5 = 0
					fee5Year = "-"
					fee5Memo = "-"
					fee5Bill = "-"
				end if
			else
				fee5 = 0
				fee5Year = "-"
				fee5Memo = "-"
				fee5Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee5%> 元<br>
			日期：<%=fee5Year%><br>
			备注：<%=fee5Memo%><br>
			收据：<%=fee5Bill%>
		</td>
		<%
			dim fee6Year, fee6, fee6Memo, fee6Bill
			fee6YearStr = rs200("fee6_year")
			if fee6YearStr <> "1970-01-01" and fee6YearStr <> "1970-1-1" then
				fee6YearDate = CDate(fee6YearStr)
				if fee6YearDate < toFeeYearDate and fee6YearDate > fromFeeYearDate then
					fee6 = rs200("fee6")
					
					totalCgeFee = totalCgeFee + fee6
					
					fee6Year = fee6YearStr
					
					fee6Memo = "-"
					if IsNull(rs200("fee6_memo")) then 
						fee6Memo = "-"
					else 
						fee6Memo = rs200("fee6_memo")
					end if
					
					fee6Bill = "-"
					if IsNull(rs200("fee6_bill")) then 
						fee6Bill = "-"
					else 
						fee6Bill = rs200("fee6_bill")
					end if
				else 
					fee6 = 0
					fee6Year = "-"
					fee6Memo = "-"
					fee6Bill = "-"
				end if
			else
				fee6 = 0
				fee6Year = "-"
				fee6Memo = "-"
				fee6Bill = "-"
			end if
		%>
		<td>
			费用：<%=fee6%> 元<br>
			日期：<%=fee6Year%><br>
			备注：<%=fee6Memo%><br>
			收据：<%=fee6Bill%>
		</td>
	</tr>
	<% 
		rs200.movenext
		next 
	%>
	<tr>
		<td colspan="6" style="text-align:right; padding-right:2px; font-weight:bold; background:#dfdfdf">总计：</td>
		<td colspan="6" style="background:#dfdfdf"><%=totalCgeFee%> 元</td>
	</tr>
</table>
<%
	conn.close
	set conn=nothing
%>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>