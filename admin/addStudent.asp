<!--#include file="conn.asp" -->
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
		session("typeName") = "����ѧ����Ϣ"
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
	<form  name="addStudent" method="post" action="addStudentAct.asp">
	<input type="hidden" name="username" id="username" value="<%=session("show_name")%>" />
	<input type="hidden" name="userId" id="userId" value="<%=session("user_id")%>" />
	<input type="hidden" name="watchStatus"  value="<%=userId%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="font-family:'��Բ', Helvetica, sans-serif; background:#f5f5f5;">
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ѧ��������</th>
			<td width="" align="left"><input type="text" name="stuName" id="stuName" style="width:200px"></td>
			<th width="110" height="50" align="right">ѧ��ѧ�ţ�</th>
			<td width="" align="left"><input type="text" name="stuNo" id="stuNo" style="width:200px"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">ѧ�����룺</th>
			<td width="" align="left"><input type="text" name="stuPsw" id="stuPsw" style="width:200px"></td>
			<th width="110" height="50" align="right">��ѧʱ�䣺</th>
			<td width="" align="left">
				<input id="stuInYears" type="text" size="15" style="width:200px" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="stuInYear" id="stuInYear" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">ѧ��˵����</th>
			<td width="" align="left" colspan="3">
				<textarea name="stuInfo" id="stuInfo" cols="78" rows="5"></textarea>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>������ʽ��</th>
			<td width="" align="left">
				<input type="hidden" name="eduname" id="eduname" value="" />
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
					<option value="<%=rs1("edu_id")%>"><%=rs1("edu_name")%></option>
					<% 
						rs1.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right">�����ˣ�</th>
			<td width="" align="left"><input type="text" name="ticheng" id="ticheng" style="width:200px"></td>
		</tr>
		<tr>
			<th width="110" height="50" align="right">�Ƽ�������</th>
			<td width="" align="left">
				<input type="hidden" name="subUsername" id="subUsername" value="" />
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
					<option value="<%=rs0("user_id")%>"><%=rs0("show_name")%></option>
					<% 
						rs0.movenext
						next 
					%>
				</select>
			</td>
			<th width="110" height="50" align="right">�Ƽ��ˣ�</th>
			<td width="" align="left">
				<input type="hidden" name="comName" id="comName">
				<select name="comId" id="comId" style="width:205px">
					<option value="0">- ѡ�� -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>��ѧ��ݣ�</th>
			<td width="" align="left"><input type="text" name="inYear" id="inYear" style="width:200px"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ʦ������</th>
			<td width="" align="left"><input type="text" name="teacher" id="teacher" style="width:200px"></td>
			
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>��ϵ�ֻ���</th>
			<td width="" align="left"><input type="text" name="smobile" id="smobile" style="width:200px"></td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ϵ�绰��</th>
			<td width="" align="left"><input type="text" name="sphone" id="sphone" style="width:200px"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ѧУ���ƣ�</th>
			<td width="" align="left">
				<input type="hidden" name="schName" id="schName" value="" />
				<select id="schId" name="schId" style="width:205px">
					<option value="0">- ѡ�� -</option>
					
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>��ѧרҵ��</th>
			<td width="" align="left">
				<input type="hidden" name="specName" id="specName">
				<select name="specId" id="specId" style="width:205px">
					<option value="0">- ѡ�� -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ѧλҪ��</th>
			<td width="" align="left">
				<select name="isDegree" id="isDegree" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1">Ҫѧλ</option>
					<option value="2">��Ҫѧλ</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>������Σ�</th>
			<td width="" align="left">
				<select name="arrange" id="arrange" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1">����ר</option>
					<option value="2">����</option>
					<option value="3">ר����</option>
					<option value="4">��</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right"><span style="color:#FF0000">*</span>ר���ף�</th>
			<td width="" align="left">
				<select name="isZbtao" id="isZbtao" style="width:205px">
					<option value="0">- ѡ�� -</option>
					<option value="1">��</option>
					<option value="2">��</option>
					<option value="3">��</option>
				</select>
			</td>
			<th width="110" height="50" align="right"><span style="color:#FF0000">*</span>ѧϰ���ģ�</th>
			<td width="" align="left">
				<input type="hidden" name="schCenter" id="schCenter">
				<select name="centerId" id="centerId" style="width:205px">
					<option value="0">- ѡ�� -</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">�����ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalTypeFee" id="totalTypeFee" value="0"> Ԫ
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������1��</th>
			<td width="" align="left">
				<input type="text" name="typeFee1" id="typeFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������1��</th>
			<td width="" align="left">
				<input id="typeFee1Years" type="text" size="15"  readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %>  />
				<input type="hidden" name="typeFee1Year" id="typeFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע1��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee1Memo" id="typeFee1Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������2��</th>
			<td width="" align="left">
				<input type="text" name="typeFee2" id="typeFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������2��</th>
			<td width="" align="left">
				<input id="typeFee2Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee2Year" id="typeFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע2��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee2Memo" id="typeFee2Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������3��</th>
			<td width="" align="left">
				<input type="text" name="typeFee3" id="typeFee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������3��</th>
			<td width="" align="left">
				<input id="typeFee3Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee3Year" id="typeFee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע3��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee3Memo" id="typeFee3Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">��������4��</th>
			<td width="" align="left">
				<input type="text" name="typeFee4" id="typeFee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">��������4��</th>
			<td width="" align="left">
				<input id="typeFee4Years" type="text" size="15" readonly <% if userId = 1 then %> class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="typeFee4Year" id="typeFee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">������ע4��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="typeFee4Memo" id="typeFee4Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">Ӧ���ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalFee" id="totalFee"  value="0"> Ԫ
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���1��</th>
			<td width="" align="left"><input type="text" name="fee1" id="fee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����1��</th>
			<td width="" align="left">
				<input id="fee1Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee1Year" id="fee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע1��</th>
			<td width="" align="left">
				<input type="text" name="fee1Memo" id="fee1Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��1��</th>
			<td width="" align="left">
				<input type="text" name="fee1Bill" id="fee1Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���2��</th>
			<td width="" align="left"><input type="text" name="fee2" id="fee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����2��</th>
			<td width="" align="left">
				<input id="fee2Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee2Year" id="fee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע2��</th>
			<td width="" align="left">
				<input type="text" name="fee2Memo" id="fee2Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��2��</th>
			<td width="" align="left">
				<input type="text" name="fee2Bill" id="fee2Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���3��</th>
			<td width="" align="left"><input type="text" name="fee3" id="fee3" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����3��</th>
			<td width="" align="left">
				<input id="fee3Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee3Year" id="fee3Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע3��</th>
			<td width="" align="left">
				<input type="text" name="fee3Memo" id="fee3Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��3��</th>
			<td width="" align="left">
				<input type="text" name="fee3Bill" id="fee3Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���4��</th>
			<td width="" align="left"><input type="text" name="fee4" id="fee4" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����4��</th>
			<td width="" align="left">
				<input id="fee4Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee4Year" id="fee4Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע4��</th>
			<td width="" align="left">
				<input type="text" name="fee4Memo" id="fee4Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��4��</th>
			<td width="" align="left">
				<input type="text" name="fee4Bill" id="fee4Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���5��</th>
			<td width="" align="left"><input type="text" name="fee5" id="fee5" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����5��</th>
			<td width="" align="left">
				<input id="fee5Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee5Year" id="fee5Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע5��</th>
			<td width="" align="left">
				<input type="text" name="fee5Memo" id="fee5Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��5��</th>
			<td width="" align="left">
				<input type="text" name="fee5Bill" id="fee5Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���6��</th>
			<td width="" align="left"><input type="text" name="fee6" id="fee6" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����6��</th>
			<td width="" align="left">
				<input id="fee6Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee6Year" id="fee6Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע6��</th>
			<td width="" align="left">
				<input type="text" name="fee6Memo" id="fee6Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��6��</th>
			<td width="" align="left">
				<input type="text" name="fee6Bill" id="fee6Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���7��</th>
			<td width="" align="left"><input type="text" name="fee7" id="fee7" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����7��</th>
			<td width="" align="left">
				<input id="fee7Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee7Year" id="fee7Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע7��</th>
			<td width="" align="left">
				<input type="text" name="fee7Memo" id="fee7Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��7��</th>
			<td width="" align="left">
				<input type="text" name="fee7Bill" id="fee7Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">���շ���8��</th>
			<td width="" align="left"><input type="text" name="fee8" id="fee8" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�շ�����8��</th>
			<td width="" align="left">
				<input id="fee8Years" type="text" size="15" class="Wdate" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> onfocus="WdatePicker({isShowClear:false,readOnly:true})" />
				<input type="hidden" name="fee8Year" id="fee8Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շѱ�ע8��</th>
			<td width="" align="left">
				<input type="text" name="fee8Memo" id="fee8Memo"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�շ�Ʊ��8��</th>
			<td width="" align="left">
				<input type="text" name="fee8Bill" id="fee8Bill"<% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %>> </td>
		</tr>
		
		<tr>
			<th width="130" height="50" align="right">��ѧУ���ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="factTotalFee" id="factTotalFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">Ӧ���ܷ��ã�</th>
			<td width="" align="left" colspan="3">
				<input type="text" name="totalRefundFee" id="totalRefundFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">Ӧ�˷���1��</th>
			<td width="" align="left">
				<input type="text" name="refundFee1" id="refundFee1" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�˷�����1��</th>
			<td width="" align="left">
				<input id="refundFee1Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee1Year" id="refundFee1Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�˷ѱ�ע1��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="refundFee1Memo" id="refundFee1Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">Ӧ�˷���2��</th>
			<td width="" align="left">
				<input type="text" name="refundFee2" id="refundFee2" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"> Ԫ</td>
			<th width="110" height="50" align="right" style="font-weight:normal;  font-family:'��Բ', Helvetica, sans-serif;">�˷�����2��</th>
			<td width="" align="left">
				<input id="refundFee2Years" type="text" size="15" readonly <% if userId = 1 then %>  class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:true})" <% else %>style="background:#e0e0e0;" <% end if %> />
				<input type="hidden" name="refundFee2Year" id="refundFee2Year" value="1970-01-01" />
			</td>
		</tr>
		<tr>
			<th width="130" height="50" align="right" style="font-weight:normal; font-family:'��Բ', Helvetica, sans-serif;">�˷ѱ�ע2��</th>
			<td width="" align="left" class="tdMenu" colspan="3">
				<input type="text" name="refundFee2Memo" id="refundFee2Memo" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> > </td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">����ʱ�䣺</th>
			<td width="" align="left">
				<select name="stuFeeYear" id="stuFeeYear" style="width:85px">
					<option value="0">- ѡ�� -</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
				</select> ��-
				<select name="stuFeeMonth" id="stuFeeMonth" style="width:85px">
					<option value="0">- ѡ�� -</option>
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
				</select> ��
			</td>
			<th width="110" height="50" align="right">ѧ�ѽ�</th>
			<td width="" align="left"><input type="text" name="stuFee" id="stuFee" <% if userId <> 1 then %> readonly style="background:#e0e0e0;" <% end if %> value="0"></td>
		</tr>
		<tr>
			<th width="130" height="50" align="right">��ע��</th>
			<td width="" align="left" colspan="3">
				<textarea name="smemo" id="smemo" cols="78" rows="6"></textarea>
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