<!--#include file="conn.asp" -->
<%
exec="select * from com_info"
userId = session("user_id")

set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>��Դ����-��̨����ƽ̨</title>
	<LINK href="../css/onto_style.css" type="text/css" rel="stylesheet">
	
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
	
	<script language="javascript" type="text/javascript">
		function doDel(id){
			if(confirm("ȷ��Ҫɾ�����Ƽ�������Ϣ��")){
				window.location.href="delComName.asp?comId="+id;
			}
		}
</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "�Ƽ�������Ϣ����"
%>
	<!-- ͷ�������˵��� -->
	<!--#include file="top.asp" -->

	<!-- ��߲����� -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- ���幦����(��ʼ) -->
	<div id="tbleDiv">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th>�Ƽ�����</th>
			<th>��������</th>
			<th style="width:80px;">����</th>
		</tr>
		
		<%
			for i= 1 to rs.recordcount
			if rs.eof then
			exit for
			end if
		%>
		<tr>
			<td><%=rs("com_name")%></td>
			<td><%=rs("username")%></td>
			<td style="width:80px;">
				<a href='editComName.asp?comId=<%=rs("com_id")%>' class="easyui-linkbutton" plain="true">�༭</a>
				<a href='javascript:doDel(<%=rs("com_id")%>)'class="easyui-linkbutton" plain="true">ɾ��</a>
			</td>
		</tr>
		<% 
			rs.movenext
			next 
		%>
	</table>
	</div>
	<!-- ���幦����(����) -->
	</div>
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
