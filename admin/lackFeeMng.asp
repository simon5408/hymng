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
	'��ѧʱ�䷶Χ
	fromYear = session("fromYear")
	toYear = session("toYear")
	'����ʱ�䷶Χ
	fromTypeFeeYear = session("fromTypeFeeYear")
	toTypeFeeYear = session("toTypeFeeYear")
	'���շ���ʱ�䷶Χ
	fromFeeYear = session("fromFeeYear")
	toFeeYear = session("toFeeYear")
	
	lacksql="select * from normal_stu_info where 1=1 "
	
	userId = session("user_id")
	' �����û�
	if  userId <> 1 then
		lacksql = lacksql + " and (user_id="&userId&" or sub_user_id="&userId&") "
	end if
	
	'ѧ������
	if stuName <> "" then
		lacksql =lacksql + " and stu_name like '%"&stuName&"%' "
	end if
	'�ֻ�
	if smobile <> "" then
		lacksql =lacksql + " and smobile like '%"&smobile&"%' "
	end if
	'��ѧʱ�䷶Χ
	if fromYear <> "" and toYear <> "" then
		lacksql =lacksql + " and (stu_in_year between #"&fromYear&"# and #"&toYear&"#) "
	end if
	'����ʱ�䷶Χ
	if fromTypeFeeYear <> "" and toTypeFeeYear <> "" then
		lacksql =lacksql + " and ((type_fee1_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee2_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee3_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee4_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)) "
	end if
	'���շ���ʱ�䷶Χ
	if fromFeeYear <> "" and toFeeYear <> "" then
		lacksql =lacksql + " and (fee1_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee2_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee3_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee4_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee5_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee6_year between #"&fromFeeYear&"# and #"&toFeeYear&"#) "
	end if
	'ע�����
	if usersId <> 0 then
		lacksql =lacksql + " and user_id ="&usersId&" "
	end if
	'�Ƽ�����
	if subUserId <> 0 then
		lacksql =lacksql + " and sub_user_id ="&subUserId&" "
	end if
	'�Ƽ���
	if comId <> 0 then
		lacksql =lacksql + " and com_id ="&comId&" "
	end if
	'��ʦ
	if teacher <> "" then
		lacksql =lacksql + " and teacher like '%"&teacher&"%' "
	end if
	'��ѧ���
	if inYear <> "" then
		lacksql =lacksql + " and in_year like '%"&inYear&"%' "
	end if
	'ѧУ����
	if schId <> 0 then
		lacksql =lacksql + " and sch_id ="&schId&" "
	end if
	'������ʽ
	if eduId <> 0 then
		lacksql =lacksql + " and edu_id="&eduId&" "
	end if
	'ѧλҪ��
	if isDegree <>0 then
		lacksql =lacksql + " and is_degree="&isDegree&" "
	end if
	'ר����
	if isZbtao <>0 then
		lacksql =lacksql + " and is_zbtao="&isZbtao&" "
	end if
	'���
	if arrange <> 0 then
		lacksql =lacksql + " and arrange="&arrange&" "
	end if
	'��ѧרҵ
	if specId <> 0 then
		lacksql =lacksql + " and spec_id="&specId&" "
	end if
	'ѧϰ����
	if centerId <> 0 then
		lacksql =lacksql + " and center_id="&centerId&" "
	end if
	'������
	if stuFeeYear <> 0 then
		lacksql =lacksql + " and stu_fee_year="&stuFeeYear&" "
	end if
	'������
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
	<title>��Դ����-��̨����ƽ̨</title>
	<LINK href="../css/onto_style.css" type="text/css" rel="stylesheet">
	<!-- ���ڿؼ� -->
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
	session("typeName") = "δ����ѧ����Ϣ����"
	session("leftZero") = "1"
	
%>

	<div id="right" style="width:100%; top:0px;">
		<div id="listDiv">
<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5; font-family:'΢���ź�', Helvetica, sans-serif;">
	<tr>
		<th>����</th>
		<th>ѧԱ</th>
		<th>�ֻ�</th>
		<th>ע�����</th>
		<th>�Ƽ�����</th>
		<th>�Ƽ���</th>
		<th>��ʦ</th>
		<th>���</th>
		<th>ѧУ</th>
		<th>���</th>
		<th>רҵ</th>
		<th>ר����</th>
		<th>��ѧʱ��</th>
		<th>����ʱ��</th>
		<th>���ѽ��</th>
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
		
		'��ѧʱ��
		inYearStr = "-"
		
		
		if(rs100("stu_in_year") <> "" and rs100("stu_in_year") <> "1970-01-01" and rs100("stu_in_year") <> "1970-1-1") then
			inYearStr = rs100("stu_in_year")
		end if
		
		'���
		arrange = rs100("arrange")
		select case arrange
			case 1
			arrangeStr="����ר"
			case 2
			arrangeStr="����"
			case 3
			arrangeStr="ר����"
			case 4
			arrangeStr="��"
		end select
		
		totalLackFee = totalLackFee + rs100("stu_fee")
	%>
	<tr>
		<td><%=indx%></td>
		<td><span title="��ע��&#13;&#10;<%=rs100("smemo")%>&#13;&#10;---------&#13;&#10;ѧ��˵����&#13;&#10;<%=rs100("stu_info")%>"><%=rs100("stu_name")%></span></td>
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
				zbtStr="��"
				case 2
				zbtStr="��"
				case 3
				zbtStr="��"
			end select
		%>
		<td><%=zbtStr%></td>
		<td><%=inYearStr%></td>
		<td><%=rs100("stu_fee_year")%>-<%=rs100("stu_fee_month")%></td>
		<td><%=rs100("stu_fee")%>Ԫ</td>
	</tr>
	<% 
		indx = indx + 1
		end if
		rs100.movenext
		next 
	%>
	<tr>
		<td colspan="14" style="text-align:right; padding-right:2px; font-weight:bold; background:#dfdfdf">�ܼƣ�</td>
		<td style="background:#dfdfdf"><%=totalLackFee%> Ԫ</td>
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