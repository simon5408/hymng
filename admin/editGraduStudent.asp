<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("gduStuId")
	exec="select * from gradut_stu_info where (gdu_stu_id="&Idx&")"
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
	
	thisEduId = rs("edu_id")
	thisSubUserId = rs("sub_user_id")

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

	<script language="javascript" src="getShName.js"></script>
	<script language="javascript" src="getSpecName.js"></script>
	<script language="javascript" src="getCentName.js"></script>
	<script language="javascript" src="getComName.js"></script>
	
	<script language="javascript" type="text/javascript">
		function changeRltnVal(obj){
			var thisVal = $(obj).val();
			if($.trim(thisVal) != "0"){
				// ѧУ
				getSchName(thisVal);

				// רҵ
				getSpecName(thisVal);

				// ѧϰ����
				getCentName(thisVal);
			}
		}
		
		function changeComName(obj){
			var thisVal = $(obj).val();
			if($.trim(thisVal) != "0"){
				// �Ƽ���
				getComName(thisVal);
				
			}
		}
	
		function doSbmit(){
			// ѧ������
			var stuName = $("#stuName").val();
			if($.trim(stuName) == ""){
				alert("ѧ������Ϊ�����");
				$("#stuName").focus();
				$("#stuName").addClass('errInpt');
				return false;
			}else{
				$("#stuName").removeClass('errInpt');
			}
			
			// ��ѧʱ��
			var stuInYears = $("#stuInYears").val();
			if($.trim(stuInYears) != ""){
				$("#stuInYear").val(stuInYears);
			}
			// ��ȡ��ҵ֤ʱ��
			var gduDates = $("#gduDates").val();
			if($.trim(gduDates) != ""){
				$("#gduDate").val(gduDates);
			}
			
			// ������ʽ
			var eduId = $("#eduId").val();
			if($.trim(eduId) == "0"){
				alert("������ʽΪ��ѡ�");
				$("#eduId").focus();
				$("#eduId").addClass('errInpt');
				return false;
			}else{
				$("#eduId").removeClass('errInpt');
				$("#eduname").val($("#eduId").find('option:selected').text());
			}
			// �Ƽ�����
			var subUserId = $("#subUserId").val();
			if($.trim(subUserId) == "0"){
				//alert("�Ƽ�����Ϊ��ѡ�");
				//$("#subUserId").focus();
				//$("#subUserId").addClass('errInpt');
				//return false;
				$("#subUsername").val("");
			}else{
				$("#subUserId").removeClass('errInpt');
				$("#subUsername").val($("#subUserId").find('option:selected').text());
			}
			// �Ƽ���
			var comId = $("#comId").val();
			if($.trim(comId) == "0"){
				//alert("�Ƽ���Ϊ��ѡ�");
				//$("#comId").focus();
				//$("#comId").addClass('errInpt');
				//return false;
				$("#comName").val("");
			}else{
				$("#comId").removeClass('errInpt');
				$("#comName").val($("#comId").find('option:selected').text());
			}
			// ��ѧ���
			var inYear = $("#inYear").val();
			if($.trim(inYear) == ""){
				alert("��ѧ���Ϊ�����");
				$("#inYear").focus();
				$("#inYear").addClass('errInpt');
				return false;
			}else{
				$("#inYear").removeClass('errInpt');
			}
			// ��ʦ����
			var teacher = $("#teacher").val();
			if($.trim(teacher) == ""){
				alert("��ʦ����Ϊ�����");
				$("#teacher").focus();
				$("#teacher").addClass('errInpt');
				return false;
			}else{
				$("#teacher").removeClass('errInpt');
			}
			// ��ϵ�ֻ� or ��ϵ�绰
			var smobile = $("#smobile").val();
			var sphone = $("#sphone").val();
			if($.trim(smobile) == "" && $.trim(sphone) == "" ){
				alert("��ϵ�ֻ�/��ϵ�绰Ϊ�����");
				$("#smobile").focus();
				$("#smobile").addClass('errInpt');
				$("#sphone").addClass('errInpt');
				return false;
			}else{
				$("#smobile").removeClass('errInpt');
				$("#sphone").removeClass('errInpt');
			}
			// ѧУ����
			var schId = $("#schId").val();
			if($.trim(schId) == "0"){
				alert("ѧУ����Ϊ��ѡ�");
				$("#schId").focus();
				$("#schId").addClass('errInpt');
				return false;
			}else{
				$("#schId").removeClass('errInpt');
				$("#schName").val($("#schId").find('option:selected').text());
			}
			// ��ѧרҵ
			var specId = $("#specId").val();
			if($.trim(specId) == "0"){
				alert("��ѧרҵΪ��ѡ�");
				$("#specId").focus();
				$("#specId").addClass('errInpt');
				return false;
			}else{
				$("#specId").removeClass('errInpt');
				$("#specName").val($("#specId").find('option:selected').text());
			}
			// ѧλҪ��
			var isDegree = $("#isDegree").val();
			if($.trim(isDegree) == "0"){
				alert("ѧλҪ��Ϊ��ѡ�");
				$("#isDegree").focus();
				$("#isDegree").addClass('errInpt');
				return false;
			}else{
				$("#isDegree").removeClass('errInpt');
			}
			// �������
			var arrange = $("#arrange").val();
			if($.trim(arrange) == "0"){
				alert("�������Ϊ��ѡ�");
				$("#arrange").focus();
				$("#arrange").addClass('errInpt');
				return false;
			}else{
				$("#arrange").removeClass('errInpt');
			}
			// ר����
			var isZbtao = $("#isZbtao").val();
			if($.trim(isZbtao) == "0"){
				alert("ר����Ϊ��ѡ�");
				$("#isZbtao").focus();
				$("#isZbtao").addClass('errInpt');
				return false;
			}else{
				$("#isZbtao").removeClass('errInpt');
			}
			// ѧϰ����
			var centerId = $("#centerId").val();
			if($.trim(centerId) == "0"){
				alert("ѧϰ����Ϊ��ѡ�");
				$("#centerId").focus();
				$("#centerId").addClass('errInpt');
				return false;
			}else{
				$("#centerId").removeClass('errInpt');
				$("#schCenter").val($("#centerId").find('option:selected').text());
			}
			
			// ����ʱ��
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
			
			// �շ�����
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
			
			// �˿�����
			var refundFee1Years = $("#refundFee1Years").val();
			if($.trim(refundFee1Years) != ""){
				$("#refundFee1Year").val(refundFee1Years);
			}
			var refundFee2Years = $("#refundFee2Years").val();
			if($.trim(refundFee2Years) != ""){
				$("#refundFee2Year").val(refundFee2Years);
			}
			
			// ��ע
			var re = /\+/g;
			var smemo = $("#smemo").val();
			if($.trim(smemo) != ""){
				$("#smemo").val(smemo.replace(re,"\\u0028"))
			}
			
			document.editStudent.submit();
		}

	</script>

	<style type="text/css">
		.trgTbl input{
			width : 200px;
		}
	</style>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
		session("typeName") = "�༭��ҵѧ����Ϣ"
		session("leftZero") = ""
		userId = session("user_id")
%>
	<!-- ͷ�������˵��� -->
	<!--#include file="top.asp" -->

	<!-- ��߲����� -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- ���幦����(��ʼ) -->
	<form  name="editStudent" method="post" action="editGraduStudentAct.asp">
	<input type="hidden" name="gduStuId" value="<%=Idx%>" />
	<input type="hidden" name="username" id="username" value="<%=rs("username")%>" />
	<input type="hidden" name="userId" id="userId" value="<%=rs("user_id")%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="130" height="50" align="right" style="font-family:'��Բ', Helvetica, sans-serif;"><span style="color:#FF0000">*</span>ѧ��������</th>
			<td width="" align="left"><input type="text" name="stuName" id="stuName" value="<%=rs("stu_name")%>" style="width:200px"></td>
			<th width="110" height="50" align="right" style="font-family:'��Բ', Helvetica, sans-serif;">ѧ��ѧ�ţ�</th>
			<td width="" align="left"><input type="text" name="stuNo" id="stuNo" value="<%=rs("stu_no")%>" style="width:200px"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">ѧ�����룺</th>
			<td width="" align="left"><input type="text" name="stuPsw" id="stuPsw" value="<%=rs("stu_psw")%>" style="width:200px"></td>
			<th width="110" height="50" align="right">��ѧʱ�䣺</th>
			<td width="" align="left">
				<% 	
					stuInYears = ""
					if(rs("stu_in_year") <> "1970-01-01" and rs("stu_in_year") <> "1970-1-1") then 
						stuInYears = rs("stu_in_year")
					end if
				%>
				<input id="stuInYears" type="text" size="15" style="width:200px" class="Wdate" value="<%=stuInYears%>" onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="stuInYear" id="stuInYear" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">ѧ��˵����</th>
			<td width="" align="left" colspan="3">
				<textarea name="stuInfo" id="stuInfo" cols="78" rows="5"><%=rs("stu_info")%></textarea>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" style="background:#CCCCCC" align="right">ѧ��״̬��</th>
			<td style="background:#CCCCCC" colspan="3">
				<select name="stuStatus" id="stuStatus" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1">�ڶ�</option>
					<option value="2">��ѧ</option>
				</select>
			</td>
			
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>������ʽ��</th>
			<td width="" align="left">
				<input type="hidden" name="eduname" id="eduname" value="<%=rs("edu_name")%>" />
				<select id="eduId" name="eduId" style="width:205px" onchange="changeRltnVal(this);">
					<option value="0">- ѡ�� -</option>
					<%
						exec1="select * from edu_type"
						set rs1=server.createobject("adodb.recordset")
						rs1.open exec1,conn,1,1
						for i= 1 to rs1.recordcount
						if rs1.eof then
						exit for
						end if
					%>
					<option value="<%=rs1("edu_id")%>" <% if rs("edu_id") = rs1("edu_id") then%>selected<%end if%>><%=rs1("edu_name")%></option>
					<% 
						rs1.movenext
						next 
					%>
				</select>
			</td>
			<th width="130" height="50" align="right">�����ˣ�</th>
			<td><input type="text" name="ticheng" id="ticheng" style="width:200px" value="<%=rs("ticheng")%>"></td>
		</tr>
		<tr>
			<th width="110" height="50" align="right">�Ƽ�������</th>
			<td width="" align="left">
				<input type="hidden" name="subUsername" id="subUsername" value="<%=rs("sub_username")%>" />
				<select id="subUserId" name="subUserId" style="width:205px" onchange="changeComName(this);">
					<option value="0">- ѡ�� -</option>
					<%
						exec0="select * from user_info where user_id <> 1"
						set rs0=server.createobject("adodb.recordset")
						rs0.open exec0,conn,1,1
						for i= 1 to rs0.recordcount
						if rs0.eof then
						exit for
						end if
					%>
					<option value="<%=rs0("user_id")%>" <% if rs("sub_user_id") = rs0("user_id") then%>selected<%end if%>><%=rs0("show_name")%></option>
					<% 
						rs0.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right">�Ƽ��ˣ�</th>
			<td width="" align="left">
				<input type="hidden" name="comName" id="comName" value="<%=rs("com_name")%>">
				<select name="comId" id="comId" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<%
						exec2="select * from com_info where user_id="&thisSubUserId&""
						set rs2=server.createobject("adodb.recordset")
						rs2.open exec2,conn,1,1
						for i= 1 to rs2.recordcount
						if rs2.eof then
						exit for
						end if
					%>
					<option value="<%=rs2("com_id")%>" <% if rs("com_id") = rs2("com_id") then%>selected<%end if%>><%=rs2("com_name")%></option>
					<% 
						rs2.movenext
						next 
						%>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>��ѧ��ݣ�</th>
			<td width="" align="left"><input type="text" name="inYear" id="inYear" style="width:200px" value="<%=rs("in_year")%>"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ʦ������</th>
			<td width="" align="left"><input type="text" name="teacher" id="teacher" style="width:200px" value="<%=rs("teacher")%>"></td>
			
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>��ϵ�ֻ���</th>
			<td width="" align="left"><input type="text" name="smobile" id="smobile" style="width:200px" value="<%=rs("smobile")%>"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ϵ�绰��</th>
			<td width="" align="left"><input type="text" name="sphone" id="sphone" style="width:200px" value="<%=rs("sphone")%>"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ѧУ���ƣ�</th>
			<td width="" align="left">
				<input type="hidden" name="schName" id="schName" value="<%=rs("sch_name")%>" />
				<select id="schId" name="schId" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<%
						exec3="select * from school where edu_id ="&thisEduId&""
						set rs3=server.createobject("adodb.recordset")
						rs3.open exec3,conn,1,1
						for i= 1 to rs3.recordcount
						if rs3.eof then
						exit for
						end if
					%>
					<option value="<%=rs3("sch_id")%>" <% if rs("sch_id") = rs3("sch_id") then%>selected<%end if%>><%=rs3("sch_name")%></option>
					<% 
						rs3.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ѧרҵ��</th>
			<td width="" align="left">
				<input type="hidden" name="specName" id="specName" value="<%=rs("spec_name")%>">
				<select name="specId" id="specId" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<%
						exec4="select * from special where edu_id ="&thisEduId&""
						set rs4=server.createobject("adodb.recordset")
						rs4.open exec4,conn,1,1
						for i= 1 to rs4.recordcount
						if rs4.eof then
						exit for
						end if
					%>
					<option value="<%=rs4("spec_id")%>" <% if rs("spec_id") = rs4("spec_id") then%>selected<%end if%>><%=rs4("spec_name")%></option>
					<% 
						rs4.movenext
						next 
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ѧλҪ��</th>
			<td width="" align="left">
				<select name="isDegree" id="isDegree" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1" <% if rs("is_degree") = 1 then%>selected<%end if%>>Ҫѧλ</option>
					<option value="2" <% if rs("is_degree") = 2 then%>selected<%end if%>>��Ҫѧλ</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>������Σ�</th>
			<td width="" align="left">
				<select name="arrange" id="arrange" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1" <% if rs("arrange") = 1 then%>selected<%end if%>>����ר</option>
					<option value="2" <% if rs("arrange") = 2 then%>selected<%end if%>>����</option>
					<option value="3" <% if rs("arrange") = 3 then%>selected<%end if%>>ר����</option>
					<option value="4" <% if rs("arrange") = 4 then%>selected<%end if%>>��</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ר���ף�</th>
			<td width="" align="left">
				<select name="isZbtao" id="isZbtao" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1" <% if rs("is_zbtao") = 1 then%>selected<%end if%>>��</option>
					<option value="2" <% if rs("is_zbtao") = 2 then%>selected<%end if%>>��</option>
					<option value="3" <% if rs("is_zbtao") = 3 then%>selected<%end if%>>��</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>ѧϰ���ģ�</th>
			<td width="" align="left">
				<input type="hidden" name="schCenter" id="schCenter" value="<%=rs("sch_center")%>">
				<select name="centerId" id="centerId" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<%
						exec5="select * from center_info where edu_id ="&thisEduId&""
						set rs5=server.createobject("adodb.recordset")
						rs5.open exec5,conn,1,1
						for i= 1 to rs5.recordcount
						if rs5.eof then
						exit for
						end if
					%>
					<option value="<%=rs5("center_id")%>" <% if rs("center_id") = rs5("center_id") then%>selected<%end if%>><%=rs5("sch_center")%></option>
					<% 
						rs5.movenext
						next 
					%>
				</select>
			</td>
		</tr>
		<tr>
			<%
				gduMemo = ""
				if (IsNull(rs("gdu_memo"))) then
					gduMemo = rs("gdu_memo")
				end if
				
				gduDates = ""
				if(rs("gdu_date") <> "1970-01-01" and rs("gdu_date") <> "1970-1-1") then 
                      gduDates = rs("gdu_date")
                    end if
			%>
			<th width="130" height="50" align="right">��ȡ��ҵ֤��</th>
			<td width="" align="left">
				<input id="gduDates" type="text" size="15" style="width:200px" class="Wdate" value="<%=gduDates%>" onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="gduDate" id="gduDate" value="1970-01-01" />
			</td>
			<th width="130" height="50" align="right">��ȡ˵����</th>
			<td width="" align="left">
				<textarea name="gduMemo" id="gduMemo" cols="28" rows="3"><%=gduMemo%></textarea>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">�����ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalTypeFee" id="totalTypeFee" <% if userId <> 1 then %> readonly style="background-color:#e0e0e0;" <% end if %> value="<%=rs("total_type_fee")%>">Ԫ
			</td>
		</tr>
		<% 	typeFee1Years = ""
			if(rs("type_fee1_year") <> "1970-01-01" and rs("type_fee1_year") <> "1970-1-1") then 
				typeFee1Years = rs("type_fee1_year")
			end if
			typeFee2Years = ""
			if(rs("type_fee2_year") <> "1970-01-01" and rs("type_fee2_year") <> "1970-1-1") then 
				typeFee2Years = rs("type_fee2_year")
			end if
			typeFee3Years = ""
			if(rs("type_fee3_year") <> "1970-01-01" and rs("type_fee3_year") <> "1970-1-1") then 
				typeFee3Years = rs("type_fee3_year")
			end if
			typeFee4Years = ""
			if(rs("type_fee4_year") <> "1970-01-01" and rs("type_fee4_year") <> "1970-1-1") then 
				typeFee4Years = rs("type_fee4_year")
			end if
		%>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������1��</th>
			<td width="" align="left">
				<input type="text" name="typeFee1" id="typeFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value='<%=rs("type_fee1")%>'>Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������1��</th>
			<td width="" align="left">
				<input id="typeFee1Years" type="text" size="15" readonly value="<%=typeFee1Years%>" <% if userId = 1 then %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %> style="background:#e0e0e0;" <% end if %>  />
				<input type="hidden" name="typeFee1Year" id="typeFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע1��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					typeFee1Memo = ""
					if(IsNull(rs("type_fee1_memo"))) then 
						typeFee1Memo = ""
					else
						typeFee1Memo = rs("type_fee1_memo")
					end if
				%>
				<input type="text" name="typeFee1Memo" id="typeFee1Memo"  value="<%=typeFee1Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������2��</th>
			<td width="" align="left">
				<input type="text" name="typeFee2" id="typeFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("type_fee2")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������2��</th>
			<td width="" align="left">
				<input id="typeFee2Years" type="text" size="15" value="<%=typeFee2Years%>" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %> style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee2Year" id="typeFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע2��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					typeFee2Memo = ""
					if(IsNull(rs("type_fee2_memo"))) then 
						typeFee2Memo = ""
					else
						typeFee2Memo = rs("type_fee2_memo")
					end if
				%>
				<input type="text" name="typeFee2Memo" id="typeFee2Memo"  value="<%=typeFee2Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������3��</th>
			<td width="" align="left">
				<input type="text" name="typeFee3" id="typeFee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("type_fee3")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������3��</th>
			<td width="" align="left">
				<input id="typeFee3Years" type="text" size="15" value="<%=typeFee3Years%>" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %> style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee3Year" id="typeFee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע3��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					typeFee3Memo = ""
					if(IsNull(rs("type_fee3_memo"))) then 
						typeFee3Memo = ""
					else
						typeFee3Memo = rs("type_fee3_memo")
					end if
				%>
				<input type="text" name="typeFee3Memo" id="typeFee3Memo"  value="<%=typeFee3Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������4��</th>
			<td width="" align="left">
				<input type="text" name="typeFee4" id="typeFee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("type_fee4")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������4��</th>
			<td width="" align="left">
				<input id="typeFee4Years" type="text" size="15" value="<%=typeFee4Years%>" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %> style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee4Year" id="typeFee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע4��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					typeFee4Memo = ""
					if(IsNull(rs("type_fee4_memo"))) then 
						typeFee4Memo = ""
					else
						typeFee4Memo = rs("type_fee4_memo")
					end if
				%>
				<input type="text" name="typeFee4Memo" id="typeFee4Memo"  value="<%=typeFee4Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">Ӧ���ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalFee" id="totalFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("total_fee")%>">Ԫ
			</td>
		</tr>
		<% 	fee1Years = ""
			if(rs("fee1_year") <> "1970-01-01" and rs("fee1_year") <> "1970-1-1") then 
				fee1Years = rs("fee1_year")
			end if
			fee2Years = ""
			if(rs("fee2_year") <> "1970-01-01" and rs("fee2_year") <> "1970-1-1") then 
				fee2Years = rs("fee2_year")
			end if
			fee3Years = ""
			if(rs("fee3_year") <> "1970-01-01" and rs("fee3_year") <> "1970-1-1") then 
				fee3Years = rs("fee3_year")
			end if
			fee4Years = ""
			if(rs("fee4_year") <> "1970-01-01" and rs("fee4_year") <> "1970-1-1") then 
				fee4Years = rs("fee4_year")
			end if
			fee5Years = ""
			if(rs("fee5_year") <> "1970-01-01" and rs("fee5_year") <> "1970-1-1") then 
				fee5Years = rs("fee5_year")
			end if
			fee6Years = ""
			if(rs("fee6_year") <> "1970-01-01" and rs("fee6_year") <> "1970-1-1") then 
				fee6Years = rs("fee6_year")
			end if
			fee7Years = ""
			if(rs("fee7_year") <> "1970-01-01" and rs("fee7_year") <> "1970-1-1") then 
				fee7Years = rs("fee7_year")
			end if
			fee8Years = ""
			if(rs("fee8_year") <> "1970-01-01" and rs("fee8_year") <> "1970-1-1") then 
				fee8Years = rs("fee8_year")
			end if
		%>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���1��</th>
			<td width="" align="left"><input type="text" name="fee1" id="fee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee1")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����1��</th>
			<td width="" align="left">
				<input id="fee1Years" type="text" size="15" value="<%=fee1Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %> />
				<input type="hidden" name="fee1Year" id="fee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע1��</th>
			<td width="" align="left">
				<%
					fee1Memo = ""
					if(IsNull(rs("fee1_memo"))) then 
						fee1Memo = ""
					else
						fee1Memo = rs("fee1_memo")
					end if
				%>
				<input type="text" name="fee1Memo" id="fee1Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee1Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��1��</th>
			<td width="" align="left">
				<%
					fee1Bill = ""
					if(IsNull(rs("fee1_bill"))) then 
						fee1Bill = ""
					else
						fee1Bill = rs("fee1_bill")
					end if
				%>
				<input type="text" name="fee1Bill" id="fee1Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee1Bill%>"> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���2��</th>
			<td width="" align="left"><input type="text" name="fee2" id="fee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee2")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����2��</th>
			<td width="" align="left">
				<input id="fee2Years" type="text" size="15" value="<%=fee2Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee2Year" id="fee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע2��</th>
			<td width="" align="left">
				<%
					fee2Memo = ""
					if(IsNull(rs("fee2_memo"))) then 
						fee2Memo = ""
					else
						fee2Memo = rs("fee2_memo")
					end if
				%>
				<input type="text" name="fee2Memo" id="fee2Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee2Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��2��</th>
			<td width="" align="left">
				<%
					fee2Bill = ""
					if(IsNull(rs("fee2_bill"))) then 
						fee2Bill = ""
					else
						fee2Bill = rs("fee2_bill")
					end if
				%>
				<input type="text" name="fee2Bill" id="fee2Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee2Bill%>"> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���3��</th>
			<td width="" align="left"><input type="text" name="fee3" id="fee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee3")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����3��</th>
			<td width="" align="left">
				<input id="fee3Years" type="text" size="15" value="<%=fee3Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee3Year" id="fee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע3��</th>
			<td width="" align="left">
				<%
					fee3Memo = ""
					if(IsNull(rs("fee3_memo"))) then 
						fee3Memo = ""
					else
						fee3Memo = rs("fee3_memo")
					end if
				%>
				<input type="text" name="fee3Memo" id="fee3Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee3Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��3��</th>
			<td width="" align="left">
				<%
					fee3Bill = ""
					if(IsNull(rs("fee3_bill"))) then 
						fee3Bill = ""
					else
						fee3Bill = rs("fee3_bill")
					end if
				%>
				<input type="text" name="fee3Bill" id="fee3Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee3Bill%>"> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���4��</th>
			<td width="" align="left"><input type="text" name="fee4" id="fee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee4")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����4��</th>
			<td width="" align="left">
				<input id="fee4Years" type="text" size="15" value="<%=fee4Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee4Year" id="fee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע4��</th>
			<td width="" align="left">
				<%
					fee4Memo = ""
					if(IsNull(rs("fee4_memo"))) then 
						fee4Memo = ""
					else
						fee4Memo = rs("fee4_memo")
					end if
				%>
				<input type="text" name="fee4Memo" id="fee4Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee4Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��4��</th>
			<td width="" align="left">
				<%
					fee4Bill = ""
					if(IsNull(rs("fee4_bill"))) then 
						fee4Bill = ""
					else
						fee4Bill = rs("fee4_bill")
					end if
				%>
				<input type="text" name="fee4Bill" id="fee4Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee4Bill%>"> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���5��</th>
			<td width="" align="left"><input type="text" name="fee5" id="fee5" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee5")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����5��</th>
			<td width="" align="left">
				<input id="fee5Years" type="text" size="15" value="<%=fee5Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee5Year" id="fee5Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע5��</th>
			<td width="" align="left">
				<%
					fee5Memo = ""
					if(IsNull(rs("fee5_memo"))) then 
						fee5Memo = ""
					else
						fee5Memo = rs("fee5_memo")
					end if
				%>
				<input type="text" name="fee5Memo" id="fee5Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee5Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��5��</th>
			<td width="" align="left">
				<%
					fee5Bill = ""
					if(IsNull(rs("fee5_bill"))) then 
						fee5Bill = ""
					else
						fee5Bill = rs("fee5_bill")
					end if
				%>
				<input type="text" name="fee5Bill" id="fee5Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee5Bill%>"> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���6��</th>
			<td width="" align="left"><input type="text" name="fee6" id="fee6" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee6")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����6��</th>
			<td width="" align="left">
				<input id="fee6Years" type="text" size="15" value="<%=fee6Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee6Year" id="fee6Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע6��</th>
			<td width="" align="left">
				<%
					fee6Memo = ""
					if(IsNull(rs("fee6_memo"))) then 
						fee6Memo = ""
					else
						fee6Memo = rs("fee6_memo")
					end if
				%>
				<input type="text" name="fee6Memo" id="fee6Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee6Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��6��</th>
			<td width="" align="left">
				<%
					fee6Bill = ""
					if(IsNull(rs("fee6_bill"))) then 
						fee6Bill = ""
					else
						fee6Bill = rs("fee6_bill")
					end if
				%>
				<input type="text" name="fee6Bill" id="fee6Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee6Bill%>"> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���7��</th>
			<td width="" align="left"><input type="text" name="fee7" id="fee7" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee7")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����7��</th>
			<td width="" align="left">
				<input id="fee7Years" type="text" size="15" value="<%=fee7Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee7Year" id="fee7Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע7��</th>
			<td width="" align="left">
				<%
					fee7Memo = ""
					if(IsNull(rs("fee7_memo"))) then 
						fee7Memo = ""
					else
						fee7Memo = rs("fee7_memo")
					end if
				%>
				<input type="text" name="fee7Memo" id="fee7Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee7Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��7��</th>
			<td width="" align="left">
				<%
					fee7Bill = ""
					if(IsNull(rs("fee7_bill"))) then 
						fee7Bill = ""
					else
						fee7Bill = rs("fee7_bill")
					end if
				%>
				<input type="text" name="fee7Bill" id="fee7Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee7Bill%>"> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���8��</th>
			<td width="" align="left"><input type="text" name="fee8" id="fee8" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fee8")%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����8��</th>
			<td width="" align="left">
				<input id="fee8Years" type="text" size="15" value="<%=fee8Years%>" readonly <% if  userId <> 1 then %> style="background:#e0e0e0;"  <% else %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% end if %>/>
				<input type="hidden" name="fee8Year" id="fee8Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע8��</th>
			<td width="" align="left">
				<%
					fee8Memo = ""
					if(IsNull(rs("fee8_memo"))) then 
						fee8Memo = ""
					else
						fee8Memo = rs("fee8_memo")
					end if
				%>
				<input type="text" name="fee8Memo" id="fee8Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee8Memo%>"> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��8��</th>
			<td width="" align="left">
				<%
					fee8Bill = ""
					if(IsNull(rs("fee8_bill"))) then 
						fee8Bill = ""
					else
						fee8Bill = rs("fee8_bill")
					end if
				%>
				<input type="text" name="fee8Bill" id="fee8Bill" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=fee8Bill%>"> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right">��ѧУ���ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="factTotalFee" id="factTotalFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("fact_total_fee")%>">Ԫ
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">Ӧ���ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<%
					totalRefundFee = 0
					if(IsNull(rs("total_refund_fee"))) then 
						totalRefundFee = 0
					else
						totalRefundFee = rs("total_refund_fee")
					end if
				%>
				<input type="text" name="totalRefundFee" id="totalRefundFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=totalRefundFee%>">Ԫ
			</td>
		</tr>
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
			
			refundFee1Years = ""
			if(rs("refund_fee1_year") <> "1970-01-01" and rs("refund_fee1_year") <> "1970-1-1") then 
				refundFee1Years = rs("refund_fee1_year")
			end if
			refundFee2Years = ""
			if(rs("refund_fee2_year") <> "1970-01-01" and rs("refund_fee2_year") <> "1970-1-1") then 
				refundFee2Years = rs("refund_fee2_year")
			end if
		%>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">Ӧ�˷���1��</th>
			<td width="" align="left">
				<input type="text" name="refundFee1" id="refundFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=refundFee1%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�˷�����1��</th>
			<td width="" align="left">
				<input id="refundFee1Years" type="text" size="15" value="<%=refundFee1Years%>" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee1Year" id="refundFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�˷ѱ�ע1��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					refundFee1Memo = ""
					if(IsNull(rs("refund_fee1_memo"))) then 
						refundFee1Memo = ""
					else
						refundFee1Memo = rs("refund_fee1_memo")
					end if
				%>
				<input type="text" name="refundFee1Memo" id="refundFee1Memo"  value="<%=refundFee1Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">Ӧ�˷���2��</th>
			<td width="" align="left">
				<input type="text" name="refundFee2" id="refundFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=refundFee2%>">Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�˷�����2��</th>
			<td width="" align="left">
				<input id="refundFee2Years" type="text" size="15" value="<%=refundFee2Years%>" readonly <% if userId = 1 then %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee2Year" id="refundFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�˷ѱ�ע2��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<%
					refundFee2Memo = ""
					if(IsNull(rs("refund_fee2_memo"))) then 
						refundFee2Memo = ""
					else
						refundFee2Memo = rs("refund_fee2_memo")
					end if
				%>
				<input type="text" name="refundFee2Memo" id="refundFee2Memo"  value="<%=refundFee2Memo%>" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">����ʱ�䣺</th>
			<td width="" align="left">
				<select name="stuFeeYear" id="stuFeeYear" style="width:85px">
					<option value="0">- ѡ�� -</option>
					<option value="2011" <% if rs("stu_fee_year") =2011 then%>selected<%end if%>>2011</option>
					<option value="2012" <% if rs("stu_fee_year") =2012 then%>selected<%end if%>>2012</option>
					<option value="2013" <% if rs("stu_fee_year") =2013 then%>selected<%end if%>>2013</option>
					<option value="2014" <% if rs("stu_fee_year") =2014 then%>selected<%end if%>>2014</option>
					<option value="2015" <% if rs("stu_fee_year") =2015 then%>selected<%end if%>>2015</option>
					<option value="2016" <% if rs("stu_fee_year") =2016 then%>selected<%end if%>>2016</option>
				</select> ��-
				<select name="stuFeeMonth" id="stuFeeMonth" style="width:85px">
					<option value="0">- ѡ�� -</option>
					<option value="1" <% if rs("stu_fee_month") =1 then%>selected<%end if%>>1</option>
					<option value="2" <% if rs("stu_fee_month") =2 then%>selected<%end if%>>2</option>
					<option value="3" <% if rs("stu_fee_month") =3 then%>selected<%end if%>>3</option>
					<option value="4" <% if rs("stu_fee_month") =4 then%>selected<%end if%>>4</option>
					<option value="5" <% if rs("stu_fee_month") =5 then%>selected<%end if%>>5</option>
					<option value="6" <% if rs("stu_fee_month") =6 then%>selected<%end if%>>6</option>
					<option value="7" <% if rs("stu_fee_month") =7 then%>selected<%end if%>>7</option>
					<option value="8" <% if rs("stu_fee_month") =8 then%>selected<%end if%>>8</option>
					<option value="9" <% if rs("stu_fee_month") =9 then%>selected<%end if%>>9</option>
					<option value="10" <% if rs("stu_fee_month") =10 then%>selected<%end if%>>10</option>
					<option value="11" <% if rs("stu_fee_month") =11 then%>selected<%end if%>>11</option>
					<option value="12" <% if rs("stu_fee_month") =12 then%>selected<%end if%>>12</option>
				</select>��
			</td>
			<th width="110" height="50" align="right">ѧ�ѽ�</th>
			<td width="" align="left"><input type="text" name="stuFee" id="stuFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="<%=rs("stu_fee")%>"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">��ע��</th>
			<td width="" align="left" colspan="3">
				<textarea name="smemo" id="smemo" cols="78" rows="6"><%=replace(rs("smemo"),"\u0028","+")%></textarea>
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