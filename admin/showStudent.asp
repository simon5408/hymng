<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("studentId")
	exec="select * from student_info where (student_id="&Idx&")"
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
					
	'������ʽ
	eduType = rs("edu_type")
	select case eduType
		case 1
			eduTypeStr="�������"
		case 2
			eduTypeStr="��ѧ����"
		case 3
			eduTypeStr="���˸߿�"
		case 4
			eduTypeStr="����"
	end select
						
	'���
	arrange = rs("arrange")
	select case arrange
		case 1
			arrangeStr="����ר"
		case 2
			arrangeStr="����"
		case 3
			arrangeStr="ר����"
	end select

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ѧϰ������ƽ̨-�༭ѧ����Ϣ</title>
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
							<td height="40" colspan="4"><b>�������</b></td>
						</tr>
						<tr>
							<th height="35">ѧ�ţ�</th>
							<td style=" "><%=rs("stu_log_name")%>&nbsp;</td>
							<th>˵����</th>
							<td><%=rs("stu_log_psd")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">��ѡѧУ��</th>
							<td><%=rs("sch_name")%></td>
							<th>��ѡרҵ��</th>
							<td><%=rs("spec_name")%></td>
						</tr>
						<tr>
							<th height="35">������ʽ��</th>
							<td><%=eduTypeStr%></td>
							<th>������Σ�</th>
							<td><%=arrangeStr%></td>
						</tr>
						<tr>
							<th height="35">�Ƽ��ˣ�</th>
							<td><%=rs("com_name")%></td>
							<th>��ѧ���Σ�</th>
							<td><%=rs("in_year")%></td>
						</tr>
						<tr>
							<th height="35">ѧϰ���ģ�</th>
							<td colspan="3"><%=rs("sch_center")%></td>
						</tr>
						<tr>
							<td height="40" colspan="4"><b>������Ϣ</b></td>
						</tr>
						<tr>
							<th height="35">������</th>
							<% 	stuInYears = "-"
							if(rs("stu_in_year") <> "1970-1-1" and rs("stu_in_year") <> "1970-01-01") then 
								stuInYears = rs("stu_in_year")
							end if
						%>
							<td><%=rs("stu_name")%><span style="padding-left:5px">(<b>��ѧʱ��:</b><%=stuInYears%>)</span><span style="padding-left:15px">(<b>��ʦ:</b><%=rs("qq_no")%>)</span></td>
							<th>���֤��</th>
							<td><%=rs("id_no")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">�̶��绰��</th>
							<td><%=rs("sphone")%>&nbsp;</td>
							<th>�ƶ��绰��</th>
							<td><%=rs("smobile")%>&nbsp;</td>
						</tr>
						<tr>
							<th>��ͥ��ַ��</th>
							<td><%=rs("home_addr")%>&nbsp;</td>
							<th height="35">ͨѶ��ַ��</th>
							<td><%=rs("saddr")%>&nbsp;</td>
						</tr>
						<tr>
							<th height="35">�ܷ��ã�</th>
							<td><%=rs("total_fee")%>Ԫ</td>
							<th height="35">������ã�</th>
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
							1,<%=rs("fee1")%>Ԫ(���ڣ�<%=fee1Years%>)&nbsp;-˵����<%=fee1Memo%><br />
							2,<%=rs("fee2")%>Ԫ(���ڣ�<%=fee2Years%>)&nbsp;-˵����<%=fee2Memo%><br />
							3,<%=rs("fee3")%>Ԫ(���ڣ�<%=fee3Years%>)&nbsp;-˵����<%=fee3Memo%><br />
							4,<%=rs("fee4")%>Ԫ(���ڣ�<%=fee4Years%>)&nbsp;-˵����<%=fee4Memo%><br />
							5,<%=rs("fee5")%>Ԫ(���ڣ�<%=fee5Years%>)&nbsp;-˵����<%=fee5Memo%>
							</td>
						</tr>
						<tr>
							<th height="35">ʵ���ܷ��ã�</th>
							<td><%=rs("fact_total_fee")%>Ԫ</td>
							<th height="35">ʵ�ʾ�����ã�</th>
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
							1,<%=rs("fact_fee1")%>Ԫ(���ڣ�<%=factFee1Years%>)&nbsp;-˵����<%=factFee1Memo%><br />
							2,<%=rs("fact_fee2")%>Ԫ(���ڣ�<%=factFee2Years%>)&nbsp;-˵����<%=factFee2Memo%><br />
							3,<%=rs("fact_fee3")%>Ԫ(���ڣ�<%=factFee3Years%>)&nbsp;-˵����<%=factFee3Memo%><br />
							4,<%=rs("fact_fee4")%>Ԫ(���ڣ�<%=factFee4Years%>)&nbsp;-˵����<%=factFee4Memo%><br />
							5,<%=rs("fact_fee5")%>Ԫ(���ڣ�<%=factFee5Years%>)&nbsp;-˵����<%=factFee5Memo%>
							</td>
						</tr>
						<tr>
							<th height="35">�ܷ�����</th>
							<td><%=rs("total_type_fee")%>Ԫ</td>
							<th height="35">ʵ�ʷ�����</th>
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
							1,<%=rs("type_fee1")%>Ԫ(���ڣ�<%=typeFee1Years%>)&nbsp;-˵����<%=typeFee1Memo%><br />
							2,<%=rs("type_fee2")%>Ԫ(���ڣ�<%=typeFee2Years%>)&nbsp;-˵����<%=typeFee2Memo%><br />
							3,<%=rs("type_fee3")%>Ԫ(���ڣ�<%=typeFee3Years%>)&nbsp;-˵����<%=typeFee3Memo%><br />
							4,<%=rs("type_fee4")%>Ԫ(���ڣ�<%=typeFee4Years%>)&nbsp;-˵����<%=typeFee4Memo%><br />
							5,<%=rs("type_fee5")%>Ԫ(���ڣ�<%=typeFee5Years%>)&nbsp;-˵����<%=typeFee5Memo%>
							</td>
						</tr>
						<tr>
						<th height="35"> ��ע��</th>
						<td>
						<%=rs("smemo")%>&nbsp;
						</td>
						<th height="35">�˻����ã�</th>
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
							1,<%=refundFee1%>Ԫ(���ڣ�<%=refundFee1Years%>)&nbsp;-˵����<%=refundFee1Memo%><br />
							2,<%=refundFee2%>Ԫ(���ڣ�<%=refundFee2Years%>)&nbsp;-˵����<%=refundFee2Memo%><br />
							3,<%=refundFee3%>Ԫ(���ڣ�<%=refundFee3Years%>)&nbsp;-˵����<%=refundFee3Memo%><br />
							4,<%=refundFee4%>Ԫ(���ڣ�<%=refundFee4Years%>)&nbsp;-˵����<%=refundFee4Memo%><br />
							5,<%=refundFee5%>Ԫ(���ڣ�<%=refundFee5Years%>)&nbsp;-˵����<%=refundFee5Memo%>
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
			<a href="../login.asp" class="headTitle">���½</a>
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
