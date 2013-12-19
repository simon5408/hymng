<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>��Դ����-��̨����ƽ̨</title>
	
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
		
		$(document).ready(function() {
		  	//��괥���¼�	
			$(".showCur").hover(
				//��꾭��ʱ
				function(){
			  		//��õ�ǰ�����ı�����
			  		var feeTb = $(this);

			  		//��ǰ�����IDֵ
			  		var feeTbId = feeTb.attr("id");
			  		//��ǰ�����Div����
			  		var feeDiv = $("#feeCot"+feeTbId);

			  		//��õ�ǰ�����ı���������ƫ��
			  		var feeTbOffset = feeTb.offset();
			  
			  		//Div������붥���߶�
			  		var feeDivTop = feeTbOffset.top;
			  
			  		//�Զ���ȫ��ʼӦ����������
			  		feeDiv.hide().css("top", feeDivTop - 40 + "px")
						.css("left", feeTbOffset.left + 20 + "px");
					
					feeDiv.show();
				},
				//����Ƴ�ʱ��ͼƬ���ڶ��󱳾��任
				function(){
			  		var feeTb = $(this);
					feeTb.removeClass('overCss');
			  		//��ǰ�����IDֵ
			  		var feeTbId = feeTb.attr("id");
			  		//��ǰ�����Div����
			  		var feeDiv = $("#feeCot"+feeTbId);
			  
					feeDiv.hide();
				}
			)
		});
		
		// ɾ��ѧ����Ϣ
		function doDel(id){
			var addr = window.location.href;
			if(confirm("ȷ��Ҫɾ����ѧ����Ϣ��")){
				window.location.href="delStudent.asp?delType=2&studentId="+id+"&addr="+addr;
			}
		}
		
		// ������ѯ
		function doSearch(){
			var stuName = document.getElementById("stuName").value;
			var smobile = document.getElementById("smobile").value;
			var usersId = document.getElementById("usersId").value;
			var subUserId = document.getElementById("subUserId").value;
			var comId = document.getElementById("comId").value;
			var teacher = document.getElementById("teacher").value;
			var inYear = document.getElementById("inYear").value;
			var schId = document.getElementById("schId").value;
			var eduId = document.getElementById("eduId").value;
			var isDegree = $("#isDegree").val();
			var isZbtao = $("#isZbtao").val();
			var arrange = document.getElementById("arrange").value;
			var specId = document.getElementById("specId").value;
			var centerId = document.getElementById("centerId").value;
			var stuFeeYear = document.getElementById("stuFeeYear").value;
			var stuFeeMonth = document.getElementById("stuFeeMonth").value;
			//��ѧʱ�䷶Χ
			var fromYear = document.getElementById("fromYear").value;
			var toYear = document.getElementById("toYear").value;
			
			//����ʱ�䷶Χ
			var fromTypeFeeYear = document.getElementById("fromTypeFeeYear").value;
			var toTypeFeeYear = document.getElementById("toTypeFeeYear").value;
			
			//���շ���ʱ�䷶Χ
			var fromFeeYear = document.getElementById("fromFeeYear").value;
			var toFeeYear = document.getElementById("toFeeYear").value;
			
			document.location.href="listLeaveStudent.asp?stuName="+stuName+"&smobile="+smobile+"&usersId="+usersId+"&subUserId="+subUserId+"&comId="+comId+"&teacher="+teacher+"&inYear="+inYear+"&schId="+schId+"&eduId="+eduId+"&isDegree="+isDegree+"&isZbtao="+isZbtao+"&arrange="+arrange+"&specId="+specId+"&centerId="+centerId+"&stuFeeYear="+stuFeeYear+"&stuFeeMonth="+stuFeeMonth+"&fromYear="+fromYear+"&toYear="+toYear+"&fromFeeYear="+fromFeeYear+"&toFeeYear="+toFeeYear+"&fromTypeFeeYear="+fromTypeFeeYear+"&toTypeFeeYear="+toTypeFeeYear;
		}
		
		// ����ɾ��ѧ����Ϣ
		function doBatchDel() {
			var delIds = $("#delIds").val();
			var addr = window.location.href;
			if (delIds != "") {
				if(confirm("ȷ��Ҫɾ����Щѧ����Ϣ��")){
					window.location.href="delStudent.asp?delType=2&studentId="+delIds+"&addr="+addr;
				}
			}else{
				alert("��ѡ��ѧ����Ϣ��");
				return false;
			}
		}
		
		function doCheckChk() {
			var ids = [];
			$(":checkbox").each(function (i){
				if($(this).is(":checked")) {
					ids.push($(this).val());
				}
			});
			
			$("#delIds").val(ids.join(","));
		}
		
		function doCheckAllChk(obj){
			if($(obj).is(":checked")){
				var ids = [];
				$(":checkbox").each(function (i){
					if(i != 0){
						$(this).attr("checked","true"); 
						ids.push($(this).val());
					}
				});
				$("#delIds").val(ids.join(","));
			} else {
				$(":checkbox").removeAttr("checked"); 
				$("#delIds").val("");
			}
		}
	</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "��ѧѧ����Ϣ����"
	session("leftZero") = "1"
	
%>
<!--#include file="listLeaveStudentAct.asp" -->
	<!-- ͷ�������˵��� -->
	

	<!-- ���幦����(��ʼ) -->
	<div id="searDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ѧ��������</td>
			<td><input type="text" name="stuName" id="stuName" value="<%=session("stuName")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">�ֻ����룺</td>
			<td><input type="text" name="smobile" id="smobile" value="<%=session("smobile")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��ѧ��ݣ�</td>
			<td><input type="text" name="inYear" id="inYear" value="<%=session("inYear")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��ʦ������</td>
			<td><input type="text" name="teacher" id="teacher" value="<%=session("teacher")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">������Σ�</td>
			<td>
				<select name="arrange" id="arrange">
					<option value="0">- ���� -</option>
					<option value="1">����ר</option>
					<option value="2">����</option>
					<option value="3">ר����</option>
					<option value="4">��</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ע�������</td>
			<td>
				<select name="usersId" id="usersId">
					<option value="0">- ���� -</option>
					<%
						exec2="select * from user_info where user_id <> 1"
						set rs2=server.createobject("adodb.recordset")
						rs2.open exec2,conn,1,1
						for i= 1 to rs2.recordcount
						if rs2.eof then
						exit for
						end if
					%>
					<option value="<%=rs2("user_id")%>"><%=rs2("show_name")%></option>
					<% 
						rs2.movenext
						next 
						%>
				</select>
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">������ʽ��</td>
			<td>
				<select id="eduId" name="eduId" onchange="changeRltnVal(this)">
					<option value="0">- ���� -</option>
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
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ѧУ���ƣ�</td>
			<td>
				<select id="schId" name="schId">
					<option value="0">- ���� -</option>
				</select>
			</td>
			
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��ѧרҵ��</td>
			<td>
				<select name="specId" id="specId">
					<option value="0">- ���� -</option>
				</select>
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ѧϰ���ģ�</td>
			<td>
				<select name="centerId" id="centerId">
					<option value="0">- ���� -</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">�Ƽ�������</td>
			<td>
				<select name="subUserId" id="subUserId" onchange="changeComName(this)">
					<option value="0">- ���� -</option>
					<%
						exec6="select * from user_info where user_id <> 1"
						set rs6=server.createobject("adodb.recordset")
						rs6.open exec6,conn,1,1
						for i= 1 to rs6.recordcount
						if rs6.eof then
						exit for
						end if
					%>
					<option value="<%=rs6("user_id")%>"><%=rs6("show_name")%></option>
					<% 
						rs6.movenext
						next 
						%>
				</select>
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">�Ƽ��ˣ�</td>
			<td>
				<select name="comId" id="comId" >
					<option value="0">- ���� -</option>
				</select>
			</td>
			
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��ѧ���ڣ�</td>
			<td colspan="2">
				<input name="fromYear" id="fromYear" type="text" style="width:100px;" size="12" value="<%=session("fromYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toYear" id="toYear" type="text" style="width:100px;" size="12" value="<%=session("toYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif; text-align:right;">�������ڣ�</td>
			<td colspan="2">
				<input name="fromTypeFeeYear" id="fromTypeFeeYear" type="text" style="width:100px;" size="12" value="<%=session("fromTypeFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toTypeFeeYear" id="toTypeFeeYear" type="text" style="width:100px;" size="12" value="<%=session("toTypeFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
		</tr>
		<tr>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ѧλҪ��</td>
			<td>
				<select name="isDegree" id="isDegree">
					<option value="0">- ���� -</option>
					<option value="1">Ҫѧλ</option>
					<option value="2">��Ҫѧλ</option>
				</select>
			</td>
			
			<td style="font-family:'��Բ', Helvetica, sans-serif;">�շ����ڣ�</td>
			<td colspan="3">
				<input name="fromFeeYear" id="fromFeeYear" type="text" size="12" value="<%=session("fromFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toFeeYear" id="toFeeYear" type="text" size="12" value="<%=session("toFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">����ʱ�䣺</td>
			<td colspan="2">
				<select name="stuFeeYear" id="stuFeeYear" style="width:85px">
					<option value="0">- ���� -</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
				</select> ��-
				<select name="stuFeeMonth" id="stuFeeMonth" style="width:85px">
					<option value="0">- ���� -</option>
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
			<td style="font-family:'��Բ', Helvetica, sans-serif;">ר���ף�
				<select name="isZbtao" id="isZbtao" style="width:85px">
					<option value="0">- ���� -</option>
					<option value="1">��</option>
					<option value="2">��</option>
					<option value="3">��</option>
				</select></td>
		</tr>
	</table>
	</div>
	
	<div class="searchBtnDiv">
<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/user.gif" border="0"> <% =session("show_name") %>
			<span class="timeFont">[��¼ʱ�䣺<% =session("loginTime") %>]</span>
	</div>
	<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/jobtype.gif" border="0"> ��������
			<span class="timeFont" id="jobTypeName">[<%=session("typeName")%>]</span>
	</div>
		<a href="adminConsole.asp" class="easyui-linkbutton" icon="icon-back">�� ��</a>
		<a href="addStudent.asp" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-add">�� ��</a>
		<a href="javascript:void(0);" onclick="doSearch()" class="easyui-linkbutton" icon="icon-search">�� ѯ</a>
		<% if userId = 1 then %><a href="javascript:void(0);" onclick="doBatchDel()" class="easyui-linkbutton" icon="icon-search">����ɾ��</a><% end if %>
		<input type="hidden" id="delIds" />
	</div>
	
	<div id="listDiv">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#a0a0a0; font-family:'΢���ź�', Helvetica, sans-serif;">
		<tr style="">
			<th>���</th>
			<th><input type="checkbox" onclick="doCheckAllChk(this)" <% if userId <> 1 then %>disabled<% end if %> /></th>
			<th>ѧԱ</th>
			<th width="50px;">�ֻ�</th>
			<th>ע�����</th>
			
			<th>�Ƽ���</th>
			<th>���</th>
			<th>��ʦ</th>
			<th>���</th>
			<th>������ʽ</th>
			<th>ѧУ</th>
			<th>���</th>
			<th>רҵ</th>
			<th>ר����</th>
			<th>��ѧʱ��</th>
			<th>����ʱ��</th>
			<th>���ѽ��</th>
			<th>ѧϰ����</th>
			<th>������ϸ</th>
			<th style="width:80px;">����</th>
		</tr>
		<%
			for i= 1 to rs.pagesize
			if rs.eof or rs.bof then
			exit for
			end if
			
			'��ѧʱ��
			inYearStr = "-"
			if(rs("stu_in_year") <> "" and rs("stu_in_year") <> "1970-01-01" and rs("stu_in_year") <> "1970-1-1") then
				inYearStr = rs("stu_in_year")
			end if
			
			'���
			arrange = rs("arrange")
			select case arrange
				case 1
				arrangeStr="����ר"
				case 2
				arrangeStr="����"
				case 3
				arrangeStr="ר����"
				case 4
				arrangeStr="��"
			end select
			
			'�ѷ�������
			totalTypeFee = rs("total_type_fee")
			typeFee = rs("type_fee1")+rs("type_fee2")+rs("type_fee3")+rs("type_fee4")
			wholeTypeFee = wholeTypeFee + totalTypeFee
			allTypeFee = allTypeFee + typeFee
		
			'1 Ӧ���ܷ���
			totalFee = rs("total_fee")
			atotalFee = atotalFee + totalFee
			
			'2 �����ܷ���
			allFee = rs("fee1")+rs("fee2")+rs("fee3")+rs("fee4")+rs("fee5")+rs("fee6")+rs("fee7")+rs("fee8")-rs("total_refund_fee")
			aallFee=aallFee + allFee
			
			'3 ����ѧУ����
			ftotalFee = rs("fact_total_fee")
			aftotalFee = aftotalFee + ftotalFee
			
			'4 ������
			gain = allFee - ftotalFee - typeFee
			allGain = allGain + gain
			
		%>
		<tr>
			<td><%=i%></td>
			<td><input type="checkbox" value="<%=rs("lev_stu_id")%>" onclick="doCheckChk()" <% if userId <> 1 then %>disabled<% end if %> /></td>
			<td><a href='editLeaveStudent.asp?levStuId=<%=rs("lev_stu_id")%>' target='_blank' title="��ע��&#13;&#10;<%=replace(rs("smemo"),"\u0028","+")%>&#13;&#10;---------&#13;&#10;ѧ��˵����&#13;&#10;<%=rs("stu_info")%>" style="color:#000000;"><%=rs("stu_name")%></a></td>
			<td><%=rs("smobile")%>&nbsp;</td>
			<td><%=rs("username")%></td>
			<%
				subUsername = 0
				if(IsNull(rs("sub_username"))) then 
					subUsername= "-"
				else
					subUsername= rs("sub_username")
				end if
			%>
			
			<td><%=rs("com_name")%></td>
			<td><%=rs("ticheng")%></td>
			<td title="�ܷ������<%=totalTypeFee%>;&#13;&#10;�ѷ������<%=typeFee%>;">
				<% if rs("teacher")<>"" then  %>
					<%=rs("teacher")%>
				<% else %>

					-
				<% end if %>
			</td>
			<td><%=rs("in_year")%></td>
			<td><%=rs("edu_name")%></td>
			<td><%=rs("sch_name")%></td>
			<td><%=arrangeStr%></td>
			<td><%=rs("spec_name")%></td>
			<%
				iszbt = rs("is_zbtao")
				select case iszbt
					case 1
					zbtStr="��"
					case 2
					zbtStr="��"
					case 3
					zbtStr="��"
				end select
			%>
			<td><%=zbtStr%></td>
			<td><%=inYearStr%></td>
			<%
				feeYear = rs("stu_fee_year")
				feeYearStr = ""
				if feeYear <> 0 then
					feeYearStr = feeYear
				end if
				feeMonth = rs("stu_fee_month")
				feeMonthStr = ""
				if feeYear <> 0 then
					feeMonthStr = feeMonth
				end if
			%>
			<td><%=feeYearStr%>-<%=feeMonthStr%></td>
			<td><%=rs("stu_fee")%>Ԫ</td>
			<td><%=rs("sch_center")%></td>
			<!--  title="[Ӧ���ܷ���]/[�����ܷ���]&#13;&#10;[����ѧУ����]/[����]" -->
			<td id="<%=rs("lev_stu_id")%>" class="showCur">
				��<%=totalFee%>/��<%=allFee%><br />
				��<%=ftotalFee%>/��<%=gain%>
				
				<div class="subDiv" id="feeCot<%=rs("lev_stu_id")%>" style=" font-family:'��Բ', Helvetica, sans-serif;">
				<div style="height:20px; background:#e0e0e0">
					<b>�ܷ��ã�</b> <%=rs("total_fee")%>Ԫ
				</div>
				
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
					fee6Years = "-"
                    if(rs("fee6_year") <> "1970-01-01" and rs("fee6_year") <> "1970-1-1") then 
                      fee6Years = rs("fee6_year")
                    end if
					fee7Years = "-"
                    if(rs("fee7_year") <> "1970-01-01" and rs("fee7_year") <> "1970-1-1") then 
                      fee7Years = rs("fee7_year")
                    end if
					fee8Years = "-"
                    if(rs("fee8_year") <> "1970-01-01" and rs("fee8_year") <> "1970-1-1") then 
                      fee8Years = rs("fee8_year")
                    end if
				%>
                <div>
					<b>������ã�</b><br />
					1,<%=rs("fee1")%>Ԫ(���ڣ�<%=fee1Years%>)<br />
				  	2,<%=rs("fee2")%>Ԫ(���ڣ�<%=fee2Years%>)<br />
				  	3,<%=rs("fee3")%>Ԫ(���ڣ�<%=fee3Years%>)<br />
				  	4,<%=rs("fee4")%>Ԫ(���ڣ�<%=fee4Years%>)<br />
				  	5,<%=rs("fee5")%>Ԫ(���ڣ�<%=fee5Years%>)<br />
				  	6,<%=rs("fee6")%>Ԫ(���ڣ�<%=fee6Years%>)<br />
				  	7,<%=rs("fee7")%>Ԫ(���ڣ�<%=fee7Years%>)<br />
				  	8,<%=rs("fee8")%>Ԫ(���ڣ�<%=fee8Years%>)
				</div>
                <div style="height:20px; background:#e0e0e0">
					<b>��ѧУ���ã�</b> <%=rs("fact_total_fee")%>Ԫ
				</div>
				<div style="height:20px; background:#e0e0e0">
					<b>�ܷ�����</b> <%=rs("total_type_fee")%>Ԫ
				</div>
               	<% 	
				  	typeFee1Years = "-"
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
				%>
                <div>
                    <b>ʵ�ʷ�����</b><br />
				  	1,<%=rs("type_fee1")%>Ԫ(���ڣ�<%=typeFee1Years%>)<br />
				  	2,<%=rs("type_fee2")%>Ԫ(���ڣ�<%=typeFee2Years%>)<br />
				  	3,<%=rs("type_fee3")%>Ԫ(���ڣ�<%=typeFee3Years%>)<br />
				  	4,<%=rs("type_fee4")%>Ԫ(���ڣ�<%=typeFee4Years%>)
                 </div>
                 <% 	
				  	refundFee1Years = "-"
                    if(rs("refund_fee1_year") <> "1970-01-01" and rs("refund_fee1_year") <> "1970-1-1") then 
                      refundFee1Years = rs("refund_fee1_year")
                    end if
                    refundFee2Years = "-"
                    if(rs("refund_fee2_year") <> "1970-01-01" and rs("refund_fee2_year") <> "1970-1-1") then 
                      refundFee2Years = rs("refund_fee2_year")
                    end if
					
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
                 %>
				 <div>
				 	<b>�˻����ã�</b><br />
					1,<%=refundFee1%>Ԫ(���ڣ�<%=refundFee1Years%>)<br />
                 	2,<%=refundFee2%>Ԫ(���ڣ�<%=refundFee2Years%>)
				 </div> 
			</div>
			</td>
			<td style="width:80px;">
				<a href='editLeaveStudent.asp?levStuId=<%=rs("lev_stu_id")%>' target='_blank' class="easyui-linkbutton" plain="true">�༭</a> 
				<a <% if username="admin" then %>href='javascript:doDel(<%=rs("lev_stu_id")%>)'<% end if%> class="easyui-linkbutton" plain="true">ɾ��</a>
			</td>
		</tr>
		<% 
			rs.movenext
			next 
		%>
		<tr>
			<td colspan="7" style="background:#dfdfdf"></td>
			<td style="background:#dfdfdf; font-weight:bold;" title="[�ܷ���]/[�ѷ���]">��<%=wholeTypeFee%>/��<%=allTypeFee%></td>
			<td  colspan="10" style="background:#dfdfdf"></td>
			<td style="background:#dfdfdf; font-weight:bold;" title="[Ӧ���ܷ���]/[�����ܷ���]&#13;&#10;[����ѧУ����]/[������]">
				��<%=atotalFee%>/��<%=aallFee%><br />
				��<%=aftotalFee%>/��<%=allGain%></td>
			<td style="width:80px;background:#dfdfdf"></td>
		</tr>
	</table>
	<script language="javascript" type="text/javascript">
		function dopage(i){
			var url = "listLeaveStudent.asp?stuName=<%=session("stuName")%>&smobile=<%=session("smobile")%>&usersId=<%=session("usersId")%>&subUserId=<%=session("subUserId")%>&comId=<%=session("comId")%>&teacher=<%=session("teacher")%>&inYear=<%=session("inYear")%>&schId=<%=session("schId")%>&eduId=<%=session("eduId")%>&isDegree=<%=session("isDegree")%>&isZbtao=<%=session("isZbtao")%>&arrange=<%=session("arrange")%>&specId=<%=session("specId")%>&centerId=<%=session("centerId")%>&stuFeeYear=<%=session("stuFeeYear")%>&stuFeeMonth=<%=session("stuFeeMonth")%>&fromYear=<%=session("fromYear")%>&toYear=<%=session("toYear")%>&fromFeeYear=<%=session("fromFeeYear")%>&toFeeYear=<%=session("toFeeYear")%>&fromTypeFeeYear=<%=session("fromTypeFeeYear")%>&toTypeFeeYear=<%=session("toTypeFeeYear")%>";

			if(i != -99){
				url = url+"&page="+i;
            }
			
			document.location.href = url;
		}
	</script>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="40" style="text-align:right;">
				<a href="javascript:dopage(-99)"><b>��ҳ</b></a>&nbsp;
				<% if rs.pagecount=1 then %>
					&lt;<b>ǰһҳ</b>&nbsp;
					<b>��һҳ</b>&gt;&nbsp;
					<b>ĩҳ</b>&nbsp;
				<% else %>
					<% if epage=1 then %>
						&lt;<b>ǰһҳ</b>&nbsp;
					<% else %>
						<a href="javascript:dopage(<%=epage-1%>)">&lt;<b>ǰһҳ</b></a>&nbsp;
					<% end if %>
					<% if epage=rs.pagecount then %>
						<b>��һҳ</b>&gt;&nbsp;
						<b>ĩҳ</b>&nbsp;
					<% else %>
						<a href="javascript:dopage(<%=epage+1%>)"><b>��һҳ</b>&gt;</a>&nbsp;
						<a href="javascript:dopage(<%=rs.pagecount%>)"><b>ĩҳ</b></a>&nbsp;
					<% end if %>
				<% end if %>
				�����ǵ�<b><%=epage%></b>ҳ ����<b><%=rs.pagecount%></b>ҳ ����<b><%=rs.recordcount%></b>������
			</td>
		</tr>
	</table>
	</div>
	<!-- ���幦����(����) -->
	
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

