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
	
	lacksql="select * from normal_stu_info where 1=1 "
	
	userId = session("user_id")
	' 所属用户
	if  userId <> 1 then
		lacksql = lacksql + " and (user_id="&userId&" or sub_user_id="&userId&") "
	end if
	
	'学生姓名
	if stuName <> "" then
		lacksql =lacksql + " and stu_name like '%"&stuName&"%' "
	end if
	'手机
	if smobile <> "" then
		lacksql =lacksql + " and smobile like '%"&smobile&"%' "
	end if
	'入学时间范围
	if fromYear <> "" and toYear <> "" then
		lacksql =lacksql + " and (stu_in_year between #"&fromYear&"# and #"&toYear&"#) "
	end if
	'返利时间范围
	if fromTypeFeeYear <> "" and toTypeFeeYear <> "" then
		lacksql =lacksql + " and ((type_fee1_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee2_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee3_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee4_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)) "
	end if
	'已收费用时间范围
	if fromFeeYear <> "" and toFeeYear <> "" then
		lacksql =lacksql + " and (fee1_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee2_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee3_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee4_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee5_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee6_year between #"&fromFeeYear&"# and #"&toFeeYear&"#) "
	end if
	'注册机构
	if usersId <> 0 then
		lacksql =lacksql + " and user_id ="&usersId&" "
	end if
	'推荐机构
	if subUserId <> 0 then
		lacksql =lacksql + " and sub_user_id ="&subUserId&" "
	end if
	'推荐人
	if comId <> 0 then
		lacksql =lacksql + " and com_id ="&comId&" "
	end if
	'教师
	if teacher <> "" then
		lacksql =lacksql + " and teacher like '%"&teacher&"%' "
	end if
	'入学年份
	if inYear <> "" then
		lacksql =lacksql + " and in_year like '%"&inYear&"%' "
	end if
	'学校名称
	if schId <> 0 then
		lacksql =lacksql + " and sch_id ="&schId&" "
	end if
	'教育方式
	if eduId <> 0 then
		lacksql =lacksql + " and edu_id="&eduId&" "
	end if
	'学位要求
	if isDegree <>0 then
		lacksql =lacksql + " and is_degree="&isDegree&" "
	end if
	'专本套
	if isZbtao <>0 then
		lacksql =lacksql + " and is_zbtao="&isZbtao&" "
	end if
	'层次
	if arrange <> 0 then
		lacksql =lacksql + " and arrange="&arrange&" "
	end if
	'所学专业
	if specId <> 0 then
		lacksql =lacksql + " and spec_id="&specId&" "
	end if
	'学习中心
	if centerId <> 0 then
		lacksql =lacksql + " and center_id="&centerId&" "
	end if
	'交费年
	if stuFeeYear <> 0 then
		lacksql =lacksql + " and stu_fee_year="&stuFeeYear&" "
	end if
	'交费月
	if stuFeeMonth <> 0 then
		lacksql =lacksql + " and stu_fee_month="&stuFeeMonth&" "
	end if
	
	'lacksql="select * from normal_stu_info where (user_id="&userId&" or sub_user_id="&userId&")" 
	
	set rs100=server.createobject("adodb.recordset")
	rs100.open lacksql,conn,1,1 

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
	session("typeName") = "未交费学生信息管理"
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
		<th>老师</th>
		<th>年份</th>
		<th>学校</th>
		<th>层次</th>
		<th>专业</th>
		<th>专本套</th>
		<th>入学时间</th>
		<th>交费时间</th>
		<th>交费金额</th>
	</tr>
	<%
		thisYear = cint(trim(year(now())))
		thisMonth = cint(trim(month(now())))
		
		dim indx, totalLackFee
		indx = 1
		for j= 1 to rs100.recordcount
		if rs100.eof or rs100.bof then
		exit for
		end if
		
		feeYear = cint(rs100("stu_fee_year"))
		feeMonth = cint(rs100("stu_fee_month"))

		if feeYear <> 0 and feeYear <> 0 and ((feeYear < thisYear) or (feeYear = thisYear and feeMonth < thisMonth+1)) then
		
		'入学时间
		inYearStr = "-"
		
		
		if(rs100("stu_in_year") <> "" and rs100("stu_in_year") <> "1970-01-01" and rs100("stu_in_year") <> "1970-1-1") then
			inYearStr = rs100("stu_in_year")
		end if
		
		'层次
		arrange = rs100("arrange")
		select case arrange
			case 1
			arrangeStr="高起专"
			case 2
			arrangeStr="高起本"
			case 3
			arrangeStr="专升本"
			case 4
			arrangeStr="无"
		end select
		
		totalLackFee = totalLackFee + rs100("stu_fee")
	%>
	<tr>
		<td><%=indx%></td>
		<td><span title="备注：&#13;&#10;<%=rs100("smemo")%>&#13;&#10;---------&#13;&#10;学生说明：&#13;&#10;<%=rs100("stu_info")%>"><%=rs100("stu_name")%></span></td>
		<td><%=rs100("smobile")%>&nbsp;</td>
		<td><%=rs100("username")%></td>
		<%
			subUsername = "-"
			if(IsNull(rs100("sub_username"))) then 
				subUsername= "-"
			else
				subUsername= rs100("sub_username")
			end if
		%>
		<td><%=subUsername%></td>
		<td>
			<% if rs100("teacher")<>"" then  %>
				<%=rs100("teacher")%>
			<% else %>
				-
			<% end if %>
		</td>
		<td><%=rs100("com_name")%></td>
		<td><%=rs100("in_year")%></td>
		<td><%=rs100("sch_name")%></td>
		<td><%=arrangeStr%></td>
		<td><%=rs100("spec_name")%></td>
		<%
			iszbt = rs100("is_zbtao")
			select case iszbt
				case 1
				zbtStr="是"
				case 2
				zbtStr="否"
				case 3
				zbtStr="无"
			end select
		%>
		<td><%=zbtStr%></td>
		<td><%=inYearStr%></td>
		<td><%=rs100("stu_fee_year")%>-<%=rs100("stu_fee_month")%></td>
		<td><%=rs100("stu_fee")%>元</td>
	</tr>
	<% 
		indx = indx + 1
		end if
		rs100.movenext
		next 
	%>
	<tr>
		<td colspan="14" style="text-align:right; padding-right:2px; font-weight:bold; background:#dfdfdf">总计：</td>
		<td style="background:#dfdfdf"><%=totalLackFee%> 元</td>
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