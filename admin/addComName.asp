<!--#include file="conn.asp" -->
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
		function doSbmit(){
			var comName = $("#comName").val();
			if($.trim(comName) == ""){
				alert("�Ƽ�����Ϊ�����");
				$("#comName").focus();
				$("#comName").addClass('errInpt');
				return false;
			}else{
				$("#comName").removeClass('errInpt');
			}
			
			var userId = $("#userId").val();
			if($.trim(userId) == "-99"){
				alert("��������Ϊ��ѡ�");
				$("#userId").focus();
				$("#userId").addClass('errInpt');
				return false;
			}else{
				$("#userId").removeClass('errInpt');
				$("#username").val($("#userId").find('option:selected').text());
			}
			
			document.addComName.submit();
		}

	</script>

</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "�����Ƽ�������Ϣ"
%>
	<!-- ͷ�������˵��� -->
	<!--#include file="top.asp" -->

	<!-- ��߲����� -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- ���幦����(��ʼ) -->
	<form  name="addComName" method="post" action="addComNameAct.asp">
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="120" height="50" align="right">�Ƽ�������</th>
			<td width="" align="left"><input type="text" name="comName" id="comName" style="width:355px"></td>
		</tr>
		<tr>
			<th width="120" height="50" align="right">����������</th>
			<td width="" align="left">
				<input type="hidden" name="username" id="username" value="" />
				<select id="userId" name="userId">
					<option value="-99">- ѡ�� -</option>
					<%
						exec1="select * from user_info where user_id <> 1"
						set rs1=server.createobject("adodb.recordset")
						rs1.open exec1,conn,1,1
						for i= 1 to rs1.recordcount
						if rs1.eof then
						exit for
						end if
					%>
					<option value="<%=rs1("user_id")%>"><%=rs1("show_name")%></option>
					<% 
						rs1.movenext
						next 
					%>
				</select>
			</td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">�� ��</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">ˢ ��</a>
	</div>
	</form>
	<!-- ���幦����(����) -->
	</div>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>
