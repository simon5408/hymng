<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("studentId")
	exec="select * from student_info where (student_id="&Idx&")"
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
					
	'教育方式
	eduType = rs("edu_type")
	select case eduType
		case 1
			eduTypeStr="网络教育"
		case 2
			eduTypeStr="自学考试"
		case 3
			eduTypeStr="成人高考"
		case 4
			eduTypeStr="其他"
	end select
						
	'层次
	arrange = rs("arrange")
	select case arrange
		case 1
			arrangeStr="高起专"
		case 2
			arrangeStr="高起本"
		case 3
			arrangeStr="专升本"
	end select

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>江苏学习网管理平台-编辑学生信息</title>
<link href="../css/wy.css" rel="stylesheet" type="text/css" />
<script src="../js/tiny_mce/tiny_mce.js"  type=text/javascript></script>
<script src="../js/TinyMceTools.js"    type=text/javascript></script>
<script language="javascript" type="text/javascript">
		//tinyMCE.init({
		//	mode : "textareas",
		//	theme: "advanced"
		//});
	</script>
<script language="javascript" type="text/javascript">
function doLogIn(){
	document.editStudent.submit();
}
function Trim(str)
{
  return  str.replace(/^\s*(.*?)[\s\n]*$/g,  '$1');
}
</script>
<style type="text/css">
#ta1 th{text-align:right;border:#666666 1px solid; margin-right:5px; background-color:#CCCCCC; width:120px}
#ta1 td{text-align:left;border:#666666 1px solid; padding-left:5px; width:280px}
</style>
</head>

<body>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	<!-- top head -->
	<!--#include file="top.asp" -->
	<!-- end top head -->
	</td>
  </tr>
</table>
<% username=session("username") 
	if username<>"" then 
%>
<!--#include file="conn.asp" -->
<table width="900" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:5px">
<tr>
	<td align="center">
		<form  name="editStudent" method="post" action="editStudentAct.asp">
		<table width="900" border="1" cellpadding="0" cellspacing="0" bordercolor="B5CEE5">
		   <tr>
		   		<td>
					<table width="99%" border="0" id="ta1" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="40" colspan="4"><b>报考情况</b></td>
						</tr>
						<tr>
							<th height="35">学号：</th>
							<td style=" "><%=rs("stu_log_name")%>&nbsp;</td>
							<th>说明：</th>
							<td><%=rs("stu_log_psd")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">所选学校：</th>
							<td><%=rs("sch_name")%></td>
							<th>所选专业：</th>
							<td><%=rs("spec_name")%></td>
						</tr>
						<tr>
							<th height="35">教育方式：</th>
							<td><%=eduTypeStr%></td>
							<th>报考层次：</th>
							<td><%=arrangeStr%></td>
						</tr>
						<tr>
							<th height="35">推荐人：</th>
							<td><%=rs("com_name")%></td>
							<th>入学批次：</th>
							<td><%=rs("in_year")%></td>
						</tr>
						<tr>
							<th height="35">学习中心：</th>
							<td colspan="3"><%=rs("sch_center")%></td>
						</tr>
						<tr>
							<td height="40" colspan="4"><b>基本信息</b></td>
						</tr>
						<tr>
							<th height="35">姓名：</th>
							<% 	stuInYears = "-"
							if(rs("stu_in_year") <> "1970-1-1" and rs("stu_in_year") <> "1970-01-01") then 
								stuInYears = rs("stu_in_year")
							end if
						%>
							<td><%=rs("stu_name")%><span style="padding-left:5px">(<b>入学时间:</b><%=stuInYears%>)</span><span style="padding-left:15px">(<b>老师:</b><%=rs("qq_no")%>)</span></td>
							<th>身份证：</th>
							<td><%=rs("id_no")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">固定电话：</th>
							<td><%=rs("sphone")%>&nbsp;</td>
							<th>移动电话：</th>
							<td><%=rs("smobile")%>&nbsp;</td>
						</tr>
						<tr>
							<th>家庭地址：</th>
							<td><%=rs("home_addr")%>&nbsp;</td>
							<th height="35">通讯地址：</th>
							<td><%=rs("saddr")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">总费用：</th>
							<td><%=rs("total_fee")%>元</td>
							<th height="35">具体费用：</th>
							<td>
							<% 	fee1Years = "-"
								if(rs("fee1_year") <> "1970-01-01" and rs("fee1_year") <> "1970-1-1") then 
									fee1Years = rs("fee1_year")
								end if
								fee2Years = "-"
								if(rs("fee2_year") <> "1970-01-01" and rs("fee2_year") <> "1970-1-1") then 
									fee2Years = rs("fee2_year")
								end if
								fee3Years = "-"
								if(rs("fee3_year") <> "1970-01-01" and rs("fee3_year") <> "1970-1-1") then 
									fee3Years = rs("fee3_year")
								end if
								fee4Years = "-"
								if(rs("fee4_year") <> "1970-01-01" and rs("fee4_year") <> "1970-1-1") then 
									fee4Years = rs("fee4_year")
								end if
								fee5Years = "-"
								if(rs("fee5_year") <> "1970-01-01" and rs("fee5_year") <> "1970-1-1") then 
									fee5Years = rs("fee5_year")
								end if
							%>
							<%
								fee1Memo = ""
								if(IsNull(rs("fee1_memo"))) then 
									fee1Memo = ""
								else
									fee1Memo = rs("fee1_memo")
								end if
								fee2Memo = ""
								if(IsNull(rs("fee2_memo"))) then 
									fee2Memo = ""
								else
									fee2Memo = rs("fee2_memo")
								end if
								fee3Memo = ""
								if(IsNull(rs("fee3_memo"))) then 
									fee3Memo = ""
								else
									fee3Memo = rs("fee3_memo")
								end if
								fee4Memo = ""
								if(IsNull(rs("fee4_memo"))) then 
									fee4Memo = ""
								else
									fee4Memo = rs("fee4_memo")
								end if
								fee5Memo = ""
								if(IsNull(rs("fee5_memo"))) then 
									fee5Memo = ""
								else
									fee5Memo = rs("fee5_memo")
								end if
							%>
							1,<%=rs("fee1")%>元(日期：<%=fee1Years%>)&nbsp;-说明：<%=fee1Memo%><br />
							2,<%=rs("fee2")%>元(日期：<%=fee2Years%>)&nbsp;-说明：<%=fee2Memo%><br />
							3,<%=rs("fee3")%>元(日期：<%=fee3Years%>)&nbsp;-说明：<%=fee3Memo%><br />
							4,<%=rs("fee4")%>元(日期：<%=fee4Years%>)&nbsp;-说明：<%=fee4Memo%><br />
							5,<%=rs("fee5")%>元(日期：<%=fee5Years%>)&nbsp;-说明：<%=fee5Memo%>
							</td>
						</tr>
						<tr>
							<th height="35">实际总费用：</th>
							<td><%=rs("fact_total_fee")%>元</td>
							<th height="35">实际具体费用：</th>
							<td>
							<% 	factFee1Years = "-"
								if(rs("fact_fee1_year") <> "1970-01-01" and rs("fact_fee1_year") <> "1970-1-1") then 
									factFee1Years = rs("fact_fee1_year")
								end if
								factFee2Years = "-"
								if(rs("fact_fee2_year") <> "1970-01-01" and rs("fact_fee2_year") <> "1970-1-1") then 
									factFee2Years = rs("fact_fee2_year")
								end if
								factFee3Years = "-"
								if(rs("fact_fee3_year") <> "1970-01-01" and rs("fact_fee3_year") <> "1970-1-1") then 
									factFee3Years = rs("fact_fee3_year")
								end if
								factFee4Years = "-"
								if(rs("fact_fee4_year") <> "1970-01-01" and rs("fact_fee4_year") <> "1970-1-1") then 
									factFee4Years = rs("fact_fee4_year")
								end if
								factFee5Years = "-"
								if(rs("fact_fee5_year") <> "1970-01-01" and rs("fact_fee5_year") <> "1970-1-1") then 
									factFee5Years = rs("fact_fee5_year")
								end if
							%>
							<%
								factFee1Memo = ""
								if(IsNull(rs("fact_fee1_memo"))) then 
									factFee1Memo = ""
								else
									factFee1Memo = rs("fact_fee1_memo")
								end if
								factFee2Memo = ""
								if(IsNull(rs("fact_fee2_memo"))) then 
									factFee2Memo = ""
								else
									factFee2Memo = rs("fact_fee2_memo")
								end if
								factFee3Memo = ""
								if(IsNull(rs("fact_fee3_memo"))) then 
									factFee3Memo = ""
								else
									factFee3Memo = rs("fact_fee3_memo")
								end if
								factFee4Memo = ""
								if(IsNull(rs("fact_fee4_memo"))) then 
									factFee4Memo = ""
								else
									factFee4Memo = rs("fact_fee4_memo")
								end if
								factFee5Memo = ""
								if(IsNull(rs("fact_fee5_memo"))) then 
									factFee5Memo = ""
								else
									factFee5Memo = rs("fact_fee5_memo")
								end if
							%>
							1,<%=rs("fact_fee1")%>元(日期：<%=factFee1Years%>)&nbsp;-说明：<%=factFee1Memo%><br />
							2,<%=rs("fact_fee2")%>元(日期：<%=factFee2Years%>)&nbsp;-说明：<%=factFee2Memo%><br />
							3,<%=rs("fact_fee3")%>元(日期：<%=factFee3Years%>)&nbsp;-说明：<%=factFee3Memo%><br />
							4,<%=rs("fact_fee4")%>元(日期：<%=factFee4Years%>)&nbsp;-说明：<%=factFee4Memo%><br />
							5,<%=rs("fact_fee5")%>元(日期：<%=factFee5Years%>)&nbsp;-说明：<%=factFee5Memo%>
							</td>
						</tr>
						<tr>
							<th height="35">总返利：</th>
							<td><%=rs("total_type_fee")%>元</td>
							<th height="35">实际返利：</th>
							<td>
							<% 	typeFee1Years = "-"
								if(rs("type_fee1_year") <> "1970-01-01" and rs("type_fee1_year") <> "1970-1-1") then 
									typeFee1Years = rs("type_fee1_year")
								end if
								typeFee2Years = "-"
								if(rs("type_fee2_year") <> "1970-01-01" and rs("type_fee2_year") <> "1970-1-1") then 
									typeFee2Years = rs("type_fee2_year")
								end if
								typeFee3Years = "-"
								if(rs("type_fee3_year") <> "1970-01-01" and rs("type_fee3_year") <> "1970-1-1") then 
									typeFee3Years = rs("type_fee3_year")
								end if
								typeFee4Years = "-"
								if(rs("type_fee4_year") <> "1970-01-01" and rs("type_fee4_year") <> "1970-1-1") then 
									typeFee4Years = rs("type_fee4_year")
								end if
								typeFee5Years = "-"
								if(rs("type_fee5_year") <> "1970-01-01" and rs("type_fee5_year") <> "1970-1-1") then 
									typeFee5Years = rs("type_fee5_year")
								end if
							%>
							<%
								typeFee1Memo = ""
								if(IsNull(rs("type_fee1_memo"))) then 
									typeFee1Memo = ""
								else
									typeFee1Memo = rs("type_fee1_memo")
								end if
								typeFee2Memo = ""
								if(IsNull(rs("type_fee2_memo"))) then 
									typeFee2Memo = ""
								else
									typeFee2Memo = rs("type_fee2_memo")
								end if
								typeFee3Memo = ""
								if(IsNull(rs("type_fee3_memo"))) then 
									typeFee3Memo = ""
								else
									typeFee3Memo = rs("type_fee3_memo")
								end if
								typeFee4Memo = ""
								if(IsNull(rs("type_fee4_memo"))) then 
									typeFee4Memo = ""
								else
									typeFee4Memo = rs("type_fee4_memo")
								end if
								typeFee5Memo = ""
								if(IsNull(rs("type_fee5_memo"))) then 
									typeFee5Memo = ""
								else
									typeFee5Memo = rs("type_fee5_memo")
								end if
							%>
							1,<%=rs("type_fee1")%>元(日期：<%=typeFee1Years%>)&nbsp;-说明：<%=typeFee1Memo%><br />
							2,<%=rs("type_fee2")%>元(日期：<%=typeFee2Years%>)&nbsp;-说明：<%=typeFee2Memo%><br />
							3,<%=rs("type_fee3")%>元(日期：<%=typeFee3Years%>)&nbsp;-说明：<%=typeFee3Memo%><br />
							4,<%=rs("type_fee4")%>元(日期：<%=typeFee4Years%>)&nbsp;-说明：<%=typeFee4Memo%><br />
							5,<%=rs("type_fee5")%>元(日期：<%=typeFee5Years%>)&nbsp;-说明：<%=typeFee5Memo%>
							</td>
						</tr>
						<tr>
						<th height="35"> 备注：</th>
						<td>
						<%=rs("smemo")%>&nbsp;
						</td>
						<th height="35">退还费用：</th>
							<td>
							<% 	refundFee1Years = ""
								if(rs("refund_fee1_year") <> "1970-01-01" and rs("refund_fee1_year") <> "1970-1-1") then 
									refundFee1Years = rs("refund_fee1_year")
								end if
								refundFee2Years = ""
								if(rs("refund_fee2_year") <> "1970-01-01" and rs("refund_fee2_year") <> "1970-1-1") then 
									refundFee2Years = rs("refund_fee2_year")
								end if
								refundFee3Years = ""
								if(rs("refund_fee3_year") <> "1970-01-01" and rs("refund_fee3_year") <> "1970-1-1") then 
									refundFee3Years = rs("refund_fee3_year")
								end if
								refundFee4Years = ""
								if(rs("refund_fee4_year") <> "1970-01-01" and rs("refund_fee4_year") <> "1970-1-1") then 
									refundFee4Years = rs("refund_fee4_year")
								end if
								refundFee5Years = ""
								if(rs("refund_fee5_year") <> "1970-01-01" and rs("refund_fee5_year") <> "1970-1-1") then 
									refundFee5Years = rs("refund_fee5_year")
								end if
							%>
<%
								refundFee1 = 0
								if(IsNull(rs("refund_fee1"))) then 
									refundFee1= 0
								else
									refundFee1= rs("refund_fee1")
								end if
								refundFee2 = 0
								if(IsNull(rs("refund_fee2"))) then 
									refundFee2 = 0
								else
									refundFee2 = rs("refund_fee2")
								end if
								refundFee3 = 0
								if(IsNull(rs("refund_fee3"))) then 
									refundFee3 = 0
								else
									refundFee3 = rs("refund_fee3")
								end if
								refundFee4 = 0
								if(IsNull(rs("refund_fee4"))) then 
									refundFee4 = 0
								else
									refundFee4 = rs("refund_fee4")
								end if
								refundFee5 = 0
								if(IsNull(rs("refund_fee5"))) then 
									refundFee5 = 0
								else
									refundFee5 = rs("refund_fee5")
								end if
							%>
							<%
								refundFee1Memo = ""
								if(IsNull(rs("refund_fee1_memo"))) then 
									refundFee1Memo = ""
								else
									refundFee1Memo = rs("refund_fee1_memo")
								end if
								refundFee2Memo = ""
								if(IsNull(rs("refund_fee2_memo"))) then 
									refundFee2Memo = ""
								else
									refundFee2Memo = rs("refund_fee2_memo")
								end if
								refundFee3Memo = ""
								if(IsNull(rs("refund_fee3_memo"))) then 
									refundFee3Memo = ""
								else
									refundFee3Memo = rs("refund_fee3_memo")
								end if
								refundFee4Memo = ""
								if(IsNull(rs("refund_fee4_memo"))) then 
									refundFee4Memo = ""
								else
									refundFee4Memo = rs("refund_fee4_memo")
								end if
								refundFee5Memo = ""
								if(IsNull(rs("refund_fee5_memo"))) then 
									refundFee5Memo = ""
								else
									refundFee5Memo = rs("refund_fee5_memo")
								end if
							%>
							1,<%=refundFee1%>元(日期：<%=refundFee1Years%>)&nbsp;-说明：<%=refundFee1Memo%><br />
							2,<%=refundFee2%>元(日期：<%=refundFee2Years%>)&nbsp;-说明：<%=refundFee2Memo%><br />
							3,<%=refundFee3%>元(日期：<%=refundFee3Years%>)&nbsp;-说明：<%=refundFee3Memo%><br />
							4,<%=refundFee4%>元(日期：<%=refundFee4Years%>)&nbsp;-说明：<%=refundFee4Memo%><br />
							5,<%=refundFee5%>元(日期：<%=refundFee5Years%>)&nbsp;-说明：<%=refundFee5Memo%>
							</td>
					  </tr>
					</table>
				</td>
		   </tr>
		</table>
		</form>
	</td>
</tr>
</table>
<%
	conn.close
	set conn=nothing
%>
<%
    else
%>
<table width="900" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:5px">
	<tr>
		<td height="40px" width="450" align="right" valign="middle">
			<img src="../images/tieshi.png" border="0" />&nbsp; 
		</td>
		<td  width="450" valign="middle">
			<a href="../login.asp" class="headTitle">请登陆</a>
		</td>
	</tr>
</table>
 
<%
 end if 
%>

<!-- foot -->
<!--#include file="foot.asp" -->
<!-- end foot-->
</body>
</html>
