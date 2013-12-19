<!--#include file="conn.asp" -->
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

	<script language="javascript" src="getShName.js"></script>
	<script language="javascript" src="getSpecName.js"></script>
	<script language="javascript" src="getCentName.js"></script>
	<script language="javascript" src="getComName.js"></script>
	
	<script language="javascript" type="text/javascript">
		
		function changeRltnVal(obj){
			var thisVal = $(obj).val();
			if($.trim(thisVal) != "0"){
				// 学校
				getSchName(thisVal);

				// 专业
				getSpecName(thisVal);

				// 学习中心
				getCentName(thisVal);
			}
		}
		
		function changeComName(obj){
			var thisVal = $(obj).val();
			if($.trim(thisVal) != "0"){
				// 推荐人
				getComName(thisVal);
				
			}
		}

		
		function doSbmit(){
			// 学生姓名
			var stuName = $("#stuName").val();
			if($.trim(stuName) == ""){
				alert("学生姓名为必填项！");
				$("#stuName").focus();
				$("#stuName").addClass('errInpt');
				return false;
			}else{
				$("#stuName").removeClass('errInpt');
			}
			// 入学时间
			var stuInYears = $("#stuInYears").val();
			if($.trim(stuInYears) != ""){
				$("#stuInYear").val(stuInYears);
			}
			// 教育方式
			var eduId = $("#eduId").val();
			if($.trim(eduId) == "0"){
				alert("教育方式为必选项！");
				$("#eduId").focus();
				$("#eduId").addClass('errInpt');
				return false;
			}else{
				$("#eduId").removeClass('errInpt');
				$("#eduname").val($("#eduId").find('option:selected').text());
			}
			// 推荐机构
			var subUserId = $("#subUserId").val();
			if($.trim(subUserId) == "0"){
				//alert("推荐机构为必选项！");
				//$("#subUserId").focus();
				//$("#subUserId").addClass('errInpt');
				//return false;
				$("#subUsername").val("");
			}else{
				$("#subUserId").removeClass('errInpt');
				$("#subUsername").val($("#subUserId").find('option:selected').text());
			}
			// 推荐人
			var comId = $("#comId").val();
			if($.trim(comId) == "0"){
				//alert("推荐人为必选项！");
				//$("#comId").focus();
				//$("#comId").addClass('errInpt');
				//return false;
				$("#comName").val("");
			}else{
				$("#comId").removeClass('errInpt');
				$("#comName").val($("#comId").find('option:selected').text());
			}
			// 入学年份
			var inYear = $("#inYear").val();
			if($.trim(inYear) == ""){
				alert("入学年份为必填项！");
				$("#inYear").focus();
				$("#inYear").addClass('errInpt');
				return false;
			}else{
				$("#inYear").removeClass('errInpt');
			}
			// 老师姓名
			var teacher = $("#teacher").val();
			if($.trim(teacher) == ""){
				alert("老师姓名为必填项！");
				$("#teacher").focus();
				$("#teacher").addClass('errInpt');
				return false;
			}else{
				$("#teacher").removeClass('errInpt');
			}
			// 联系手机 or 联系电话
			var smobile = $("#smobile").val();
			var sphone = $("#sphone").val();
			if($.trim(smobile) == "" && $.trim(sphone) == "" ){
				alert("联系手机/联系电话为必填项！");
				$("#smobile").focus();
				$("#smobile").addClass('errInpt');
				$("#sphone").addClass('errInpt');
				return false;
			}else{
				$("#smobile").removeClass('errInpt');
				$("#sphone").removeClass('errInpt');
			}
			// 学校名称
			var schId = $("#schId").val();
			if($.trim(schId) == "0"){
				alert("学校名称为必选项！");
				$("#schId").focus();
				$("#schId").addClass('errInpt');
				return false;
			}else{
				$("#schId").removeClass('errInpt');
				$("#schName").val($("#schId").find('option:selected').text());
			}
			// 所学专业
			var specId = $("#specId").val();
			if($.trim(specId) == "0"){
				alert("所学专业为必选项！");
				$("#specId").focus();
				$("#specId").addClass('errInpt');
				return false;
			}else{
				$("#specId").removeClass('errInpt');
				$("#specName").val($("#specId").find('option:selected').text());
			}
			// 学位要求
			var isDegree = $("#isDegree").val();
			if($.trim(isDegree) == "0"){
				alert("学位要求为必选项！");
				$("#isDegree").focus();
				$("#isDegree").addClass('errInpt');
				return false;
			}else{
				$("#isDegree").removeClass('errInpt');
			}
			// 教育层次
			var arrange = $("#arrange").val();
			if($.trim(arrange) == "0"){
				alert("教育层次为必选项！");
				$("#arrange").focus();
				$("#arrange").addClass('errInpt');
				return false;
			}else{
				$("#arrange").removeClass('errInpt');
			}
			// 专本套
			var isZbtao = $("#isZbtao").val();
			if($.trim(isZbtao) == "0"){
				alert("专本套为必选项！");
				$("#isZbtao").focus();
				$("#isZbtao").addClass('errInpt');
				return false;
			}else{
				$("#isZbtao").removeClass('errInpt');
			}
			// 学习中心
			var centerId = $("#centerId").val();
			if($.trim(centerId) == "0"){
				alert("学习中心为必选项！");
				$("#centerId").focus();
				$("#centerId").addClass('errInpt');
				return false;
			}else{
				$("#centerId").removeClass('errInpt');
				$("#schCenter").val($("#centerId").find('option:selected').text());
			}
			
			// 返利时间
			var typeFee1Years = $("#typeFee1Years").val();
			if($.trim(typeFee1Years) != ""){
				$("#typeFee1Year").val(typeFee1Years);
			}
			var typeFee2Years = $("#typeFee2Years").val();
			if($.trim(typeFee2Years) != ""){
				$("#typeFee2Year").val(typeFee2Years);
			}
			var typeFee3Years = $("#typeFee3Years").val();
			if($.trim(typeFee3Years) != ""){
				$("#typeFee3Year").val(typeFee3Years);
			}
			var typeFee4Years = $("#typeFee4Years").val();
			if($.trim(typeFee4Years) != ""){
				$("#typeFee4Year").val(typeFee4Years);
			}
			
			// 收费日期
			var fee1Years = $("#fee1Years").val();
			if($.trim(fee1Years) != ""){
				$("#fee1Year").val(fee1Years);
			}
			var fee2Years = $("#fee2Years").val();
			if($.trim(fee2Years) != ""){
				$("#fee2Year").val(fee2Years);
			}
			var fee3Years = $("#fee3Years").val();
			if($.trim(fee3Years) != ""){
				$("#fee3Year").val(fee3Years);
			}
			var fee4Years = $("#fee4Years").val();
			if($.trim(fee4Years) != ""){
				$("#fee4Year").val(fee4Years);
			}
			var fee5Years = $("#fee5Years").val();
			if($.trim(fee5Years) != ""){
				$("#fee5Year").val(fee5Years);
			}
			var fee6Years = $("#fee6Years").val();
			if($.trim(fee6Years) != ""){
				$("#fee6Year").val(fee6Years);
			}
			var fee7Years = $("#fee7Years").val();
			if($.trim(fee7Years) != ""){
				$("#fee7Year").val(fee7Years);
			}
			var fee8Years = $("#fee8Years").val();
			if($.trim(fee8Years) != ""){
				$("#fee8Year").val(fee8Years);
			}
			
			// 退款日期
			var refundFee1Years = $("#refundFee1Years").val();
			if($.trim(refundFee1Years) != ""){
				$("#refundFee1Year").val(refundFee1Years);
			}
			var refundFee2Years = $("#refundFee2Years").val();
			if($.trim(refundFee2Years) != ""){
				$("#refundFee2Year").val(refundFee2Years);
			}
			
			// 备注
			var re = /\+/g;
			var smemo = $("#smemo").val();
			if($.trim(smemo) != ""){
				$("#smemo").val(smemo.replace(re,"\\u0028"))
			}
			
			document.addStudent.submit();
		}
	</script>

	<style type="text/css">
		.trgTbl input{
			width : 200px;
		}
		.trgTbl .tdMenu input{
			width : 564px;
		}
	</style>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
		session("typeName") = "新增学生信息"
		session("leftZero") = ""
		userId = session("user_id")
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<form  name="addStudent" method="post" action="addStudentAct.asp">
	<input type="hidden" name="username" id="username" value="<%=session("show_name")%>" />
	<input type="hidden" name="userId" id="userId" value="<%=session("user_id")%>" />
	<input type="hidden" name="watchStatus"  value="<%=userId%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="font-family:'幼圆', Helvetica, sans-serif; background:#f5f5f5;">
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>学生姓名：</th>
			<td width="" align="left"><input type="text" name="stuName" id="stuName" style="width:200px"></td>
			<th width="110" height="50" align="right">学生学号：</th>
			<td width="" align="left"><input type="text" name="stuNo" id="stuNo" style="width:200px"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">学生密码：</th>
			<td width="" align="left"><input type="text" name="stuPsw" id="stuPsw" style="width:200px"></td>
			<th width="110" height="50" align="right">入学时间：</th>
			<td width="" align="left">
				<input id="stuInYears" type="text" size="15" style="width:200px" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="stuInYear" id="stuInYear" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">学生说明：</th>
			<td width="" align="left" colspan="3">
				<textarea name="stuInfo" id="stuInfo" cols="78" rows="5"></textarea>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>教育方式：</th>
			<td width="" align="left">
				<input type="hidden" name="eduname" id="eduname" value="" />
				<select id="eduId" name="eduId" style="width:205px" onchange="changeRltnVal(this);">
					<option value="0">- 选择 -</option>
					<%
						exec1="select * from edu_type"
						set rs1=server.createobject("adodb.recordset")
						rs1.open exec1,conn,1,1
						for i= 1 to rs1.recordcount
						if rs1.eof then
						exit for
						end if
					%>
					<option value="<%=rs1("edu_id")%>"><%=rs1("edu_name")%></option>
					<% 
						rs1.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right">介绍人：</th>
			<td width="" align="left"><input type="text" name="ticheng" id="ticheng" style="width:200px"></td>
		</tr>
		<tr>
			<th width="110" height="50" align="right">推荐机构：</th>
			<td width="" align="left">
				<input type="hidden" name="subUsername" id="subUsername" value="" />
				<select id="subUserId" name="subUserId" style="width:205px" onchange="changeComName(this);">
					<option value="0">- 选择 -</option>
					<%
						exec0="select * from user_info where user_id <> 1"
						set rs0=server.createobject("adodb.recordset")
						rs0.open exec0,conn,1,1
						for i= 1 to rs0.recordcount
						if rs0.eof then
						exit for
						end if
					%>
					<option value="<%=rs0("user_id")%>"><%=rs0("show_name")%></option>
					<% 
						rs0.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right">推荐人：</th>
			<td width="" align="left">
				<input type="hidden" name="comName" id="comName">
				<select name="comId" id="comId" style="width:205px">
					<option value="0">- 选择 -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>入学年份：</th>
			<td width="" align="left"><input type="text" name="inYear" id="inYear" style="width:200px"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>老师姓名：</th>
			<td width="" align="left"><input type="text" name="teacher" id="teacher" style="width:200px"></td>
			
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>联系手机：</th>
			<td width="" align="left"><input type="text" name="smobile" id="smobile" style="width:200px"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>联系电话：</th>
			<td width="" align="left"><input type="text" name="sphone" id="sphone" style="width:200px"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>学校名称：</th>
			<td width="" align="left">
				<input type="hidden" name="schName" id="schName" value="" />
				<select id="schId" name="schId" style="width:205px">
					<option value="0">- 选择 -</option>
					
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>所学专业：</th>
			<td width="" align="left">
				<input type="hidden" name="specName" id="specName">
				<select name="specId" id="specId" style="width:205px">
					<option value="0">- 选择 -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>学位要求：</th>
			<td width="" align="left">
				<select name="isDegree" id="isDegree" style="width:205px">
					<option value="0">- 选择 -</option>
					<option value="1">要学位</option>
					<option value="2">不要学位</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>教育层次：</th>
			<td width="" align="left">
				<select name="arrange" id="arrange" style="width:205px">
					<option value="0">- 选择 -</option>
					<option value="1">高起专</option>
					<option value="2">高起本</option>
					<option value="3">专升本</option>
					<option value="4">无</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>专本套：</th>
			<td width="" align="left">
				<select name="isZbtao" id="isZbtao" style="width:205px">
					<option value="0">- 选择 -</option>
					<option value="1">是</option>
					<option value="2">否</option>
					<option value="3">无</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>学习中心：</th>
			<td width="" align="left">
				<input type="hidden" name="schCenter" id="schCenter">
				<select name="centerId" id="centerId" style="width:205px">
					<option value="0">- 选择 -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">返利总费用：</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalTypeFee" id="totalTypeFee" value="0"> 元
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利费用1：</th>
			<td width="" align="left">
				<input type="text" name="typeFee1" id="typeFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">返利日期1：</th>
			<td width="" align="left">
				<input id="typeFee1Years" type="text" size="15"  readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %>  />
				<input type="hidden" name="typeFee1Year" id="typeFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利备注1：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee1Memo" id="typeFee1Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利费用2：</th>
			<td width="" align="left">
				<input type="text" name="typeFee2" id="typeFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">返利日期2：</th>
			<td width="" align="left">
				<input id="typeFee2Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee2Year" id="typeFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利备注2：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee2Memo" id="typeFee2Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利费用3：</th>
			<td width="" align="left">
				<input type="text" name="typeFee3" id="typeFee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">返利日期3：</th>
			<td width="" align="left">
				<input id="typeFee3Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee3Year" id="typeFee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利备注3：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee3Memo" id="typeFee3Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利费用4：</th>
			<td width="" align="left">
				<input type="text" name="typeFee4" id="typeFee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">返利日期4：</th>
			<td width="" align="left">
				<input id="typeFee4Years" type="text" size="15" readonly <% if userId = 1 then %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee4Year" id="typeFee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">返利备注4：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee4Memo" id="typeFee4Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">应收总费用：</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalFee" id="totalFee"  value="0"> 元
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用1：</th>
			<td width="" align="left"><input type="text" name="fee1" id="fee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期1：</th>
			<td width="" align="left">
				<input id="fee1Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee1Year" id="fee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注1：</th>
			<td width="" align="left">
				<input type="text" name="fee1Memo" id="fee1Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据1：</th>
			<td width="" align="left">
				<input type="text" name="fee1Bill" id="fee1Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用2：</th>
			<td width="" align="left"><input type="text" name="fee2" id="fee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期2：</th>
			<td width="" align="left">
				<input id="fee2Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee2Year" id="fee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注2：</th>
			<td width="" align="left">
				<input type="text" name="fee2Memo" id="fee2Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据2：</th>
			<td width="" align="left">
				<input type="text" name="fee2Bill" id="fee2Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用3：</th>
			<td width="" align="left"><input type="text" name="fee3" id="fee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期3：</th>
			<td width="" align="left">
				<input id="fee3Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee3Year" id="fee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注3：</th>
			<td width="" align="left">
				<input type="text" name="fee3Memo" id="fee3Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据3：</th>
			<td width="" align="left">
				<input type="text" name="fee3Bill" id="fee3Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用4：</th>
			<td width="" align="left"><input type="text" name="fee4" id="fee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期4：</th>
			<td width="" align="left">
				<input id="fee4Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee4Year" id="fee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注4：</th>
			<td width="" align="left">
				<input type="text" name="fee4Memo" id="fee4Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据4：</th>
			<td width="" align="left">
				<input type="text" name="fee4Bill" id="fee4Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用5：</th>
			<td width="" align="left"><input type="text" name="fee5" id="fee5" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期5：</th>
			<td width="" align="left">
				<input id="fee5Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee5Year" id="fee5Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注5：</th>
			<td width="" align="left">
				<input type="text" name="fee5Memo" id="fee5Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据5：</th>
			<td width="" align="left">
				<input type="text" name="fee5Bill" id="fee5Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用6：</th>
			<td width="" align="left"><input type="text" name="fee6" id="fee6" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期6：</th>
			<td width="" align="left">
				<input id="fee6Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee6Year" id="fee6Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注6：</th>
			<td width="" align="left">
				<input type="text" name="fee6Memo" id="fee6Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据6：</th>
			<td width="" align="left">
				<input type="text" name="fee6Bill" id="fee6Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用7：</th>
			<td width="" align="left"><input type="text" name="fee7" id="fee7" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期7：</th>
			<td width="" align="left">
				<input id="fee7Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee7Year" id="fee7Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注7：</th>
			<td width="" align="left">
				<input type="text" name="fee7Memo" id="fee7Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据7：</th>
			<td width="" align="left">
				<input type="text" name="fee7Bill" id="fee7Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">已收费用8：</th>
			<td width="" align="left"><input type="text" name="fee8" id="fee8" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">收费日期8：</th>
			<td width="" align="left">
				<input id="fee8Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee8Year" id="fee8Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费备注8：</th>
			<td width="" align="left">
				<input type="text" name="fee8Memo" id="fee8Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">收费票据8：</th>
			<td width="" align="left">
				<input type="text" name="fee8Bill" id="fee8Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right">交学校费用：</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="factTotalFee" id="factTotalFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">应退总费用：</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalRefundFee" id="totalRefundFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">应退费用1：</th>
			<td width="" align="left">
				<input type="text" name="refundFee1" id="refundFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">退费日期1：</th>
			<td width="" align="left">
				<input id="refundFee1Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee1Year" id="refundFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">退费备注1：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="refundFee1Memo" id="refundFee1Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">应退费用2：</th>
			<td width="" align="left">
				<input type="text" name="refundFee2" id="refundFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> 元</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'幼圆', Helvetica, sans-serif;">退费日期2：</th>
			<td width="" align="left">
				<input id="refundFee2Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee2Year" id="refundFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'幼圆', Helvetica, sans-serif;">退费备注2：</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="refundFee2Memo" id="refundFee2Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">交费时间：</th>
			<td width="" align="left">
				<select name="stuFeeYear" id="stuFeeYear" style="width:85px">
					<option value="0">- 选择 -</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
				</select> 年-
				<select name="stuFeeMonth" id="stuFeeMonth" style="width:85px">
					<option value="0">- 选择 -</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> 月
			</td>
			<th width="110" height="50" align="right">学费金额：</th>
			<td width="" align="left"><input type="text" name="stuFee" id="stuFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">备注：</th>
			<td width="" align="left" colspan="3">
				<textarea name="smemo" id="smemo" cols="78" rows="6"></textarea>
			</td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">保 存</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">刷 新</a>
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