
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������ƽ̨-ѧ�������б�</title>
<link href="../css/wy.css" rel="stylesheet" type="text/css" />

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
<!--#include file="showSchFeeAct.asp" -->
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:5px">
<tr>
	<td align="center">
		
		<table width="600" border="0" cellpadding="0" cellspacing="0" bordercolor="B5CEE5">
		   <tr>
		   		<td>
					<table width="99%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #009966">
						
					</table>
					<table width="99%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #009966" >
					  <tr bgcolor="#cccccc">
						<th width="20%" height="30" class="logTitle">ѧ������</th>
						<th width="20%" height="30" class="logTitle">��������</th>
						<th width="20%" height="30" class="logTitle">��������</th>
						<th width="20%" height="30" class="logTitle">�ɷ�ʱ��</th>
					 </tr>
					  <%
					  	for i= 1 to rs.recordcount
						if rs.eof then
						exit for
						end if
						'��ʽ
						feeType=rs("fee_type")
						select case feeType
							case 1
							feeTypeStr="��ѧ�ڽ���"
							case 2
							feeTypeStr="��ѧ�꽻��"
						end select
					  %>
					  <tr>
						<td style="border-bottom:1px solid #cccccc" height="30" class="logTitle"><%=rs("stu_name")%></td>
						<td style="border-bottom:1px solid #cccccc" height="30" class="logTitle"><%=feeTypeStr%></td>
						<td style="border-bottom:1px solid #cccccc" height="30" class="logTitle">��<%=rs("stu_fee")%>Ԫ</td>
						<td style="border-bottom:1px solid #cccccc" height="30" class="logTitle">
							<%=rs("stu_year")%>��-<%=rs("stu_month")%>��
						</td>
						
					  </tr>
					  <% 
						rs.movenext
						next 
					  %>
					</table>
				</td>
		   </tr>
		</table>

	</td>
</tr>
</table>&nbsp;
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
