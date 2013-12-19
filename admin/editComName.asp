<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("comId")
	exec="select * from com_info where (com_id="&Idx&")"
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
			var comName = $("#comName").val();
			if($.trim(comName) == ""){
				alert("推荐机构为必填项！");
				$("#comName").focus();
				$("#comName").addClass('errInpt');
				return false;
			}else{
				$("#comName").removeClass('errInpt');
			}
			
			var userId = $("#userId").val();
			if($.trim(userId) == "-99"){
				alert("所属机构为必选项！");
				$("#userId").focus();
				$("#userId").addClass('errInpt');
				return false;
			}else{
				$("#userId").removeClass('errInpt');
				$("#username").val($("#userId").find('option:selected').text());
			}
			
			document.editComName.submit();
		}

	</script>

</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "编辑推荐机构信息"
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<form  name="editComName" method="post" action="editComNameAct.asp">
	<input type="hidden" name="comId" value="<%=Idx%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="100" height="50" align="right">推荐机构：</th>
			<td width="" align="left"><input type="text" name="comName" id="comName" style="width:355px"value="<%=rs("com_name")%>"></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">教育方式：</th>
			<td width="" align="left">
				<input type="hidden" name="username" id="username" value="<%=rs("username")%>" />
				<select id="userId" name="userId">
					<option value="-99">- 选择 -</option>
					<%
						exec1="select * from user_info where user_id <> 1"
						set rs1=server.createobject("adodb.recordset")
						rs1.open exec1,conn,1,1
						for i= 1 to rs1.recordcount
						if rs1.eof then
						exit for
						end if
					%>
					<option value="<%=rs1("user_id")%>" <% if rs("user_id") = rs1("user_id") then%>selected<%end if%>><%=rs1("show_name")%></option>
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
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">保 存</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">刷 新</a>
		<a href="listComName.asp" class="easyui-linkbutton" icon="icon-back">返 回</a>
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
