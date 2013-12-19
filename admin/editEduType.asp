<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("eduId")
	exec="select * from edu_type where (edu_id="&Idx&")"
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>慧源教育-后台管理平台</title>
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
			var eduname = $("#eduname").val();
			if($.trim(eduname) == ""){
				alert("教育方式为必填项！");
				$("#eduname").focus();
				$("#eduname").addClass('errInpt');
				return false;
			}else{
				$("#eduname").removeClass('errInpt');
			}
			
			document.editEduType.submit();
		}

	</script>

</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "编辑教育方式"
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<form  name="editEduType" method="post" action="editEduTypeAct.asp">
	<input type="hidden" name="eduId" value="<%=Idx%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="100" height="50" align="right">教育方式：</th>
			<td width="" align="left"><input type="text" name="eduname" id="eduname" style="width:355px" value="<%=rs("edu_name")%>"></td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">保 存</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">刷 新</a>
		<a href="listEduType.asp" class="easyui-linkbutton" icon="icon-back">返 回</a>
	</div>
	</form>
	<!-- 主体功能区(结束) -->
	</div>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>
