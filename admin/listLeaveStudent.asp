<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>慧源教育-后台管理平台</title>
	
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
		
		$(document).ready(function() {
		  	//鼠标触发事件	
			$(".showCur").hover(
				//鼠标经过时
				function(){
			  		//获得当前焦点文本对象
			  		var feeTb = $(this);

			  		//当前焦点的ID值
			  		var feeTbId = feeTb.attr("id");
			  		//当前焦点的Div对象
			  		var feeDiv = $("#feeCot"+feeTbId);

			  		//获得当前焦点文本对象的相对偏移
			  		var feeTbOffset = feeTb.offset();
			  
			  		//Div对象距离顶部高度
			  		var feeDivTop = feeTbOffset.top;
			  
			  		//自动补全框开始应该隐藏起来
			  		feeDiv.hide().css("top", feeDivTop - 40 + "px")
						.css("left", feeTbOffset.left + 20 + "px");
					
					feeDiv.show();
				},
				//鼠标移出时，图片所在对象背景变换
				function(){
			  		var feeTb = $(this);
					feeTb.removeClass('overCss');
			  		//当前焦点的ID值
			  		var feeTbId = feeTb.attr("id");
			  		//当前焦点的Div对象
			  		var feeDiv = $("#feeCot"+feeTbId);
			  
					feeDiv.hide();
				}
			)
		});
		
		// 删除学生信息
		function doDel(id){
			var addr = window.location.href;
			if(confirm("确定要删除该学生信息？")){
				window.location.href="delStudent.asp?delType=2&studentId="+id+"&addr="+addr;
			}
		}
		
		// 条件查询
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
			//入学时间范围
			var fromYear = document.getElementById("fromYear").value;
			var toYear = document.getElementById("toYear").value;
			
			//返利时间范围
			var fromTypeFeeYear = document.getElementById("fromTypeFeeYear").value;
			var toTypeFeeYear = document.getElementById("toTypeFeeYear").value;
			
			//已收费用时间范围
			var fromFeeYear = document.getElementById("fromFeeYear").value;
			var toFeeYear = document.getElementById("toFeeYear").value;
			
			document.location.href="listLeaveStudent.asp?stuName="+stuName+"&smobile="+smobile+"&usersId="+usersId+"&subUserId="+subUserId+"&comId="+comId+"&teacher="+teacher+"&inYear="+inYear+"&schId="+schId+"&eduId="+eduId+"&isDegree="+isDegree+"&isZbtao="+isZbtao+"&arrange="+arrange+"&specId="+specId+"&centerId="+centerId+"&stuFeeYear="+stuFeeYear+"&stuFeeMonth="+stuFeeMonth+"&fromYear="+fromYear+"&toYear="+toYear+"&fromFeeYear="+fromFeeYear+"&toFeeYear="+toFeeYear+"&fromTypeFeeYear="+fromTypeFeeYear+"&toTypeFeeYear="+toTypeFeeYear;
		}
		
		// 批量删除学生信息
		function doBatchDel() {
			var delIds = $("#delIds").val();
			var addr = window.location.href;
			if (delIds != "") {
				if(confirm("确定要删除这些学生信息？")){
					window.location.href="delStudent.asp?delType=2&studentId="+delIds+"&addr="+addr;
				}
			}else{
				alert("请选择学生信息！");
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
	session("typeName") = "退学学生信息管理"
	session("leftZero") = "1"
	
%>
<!--#include file="listLeaveStudentAct.asp" -->
	<!-- 头部操作菜单栏 -->
	

	<!-- 主体功能区(开始) -->
	<div id="searDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">学生姓名：</td>
			<td><input type="text" name="stuName" id="stuName" value="<%=session("stuName")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">手机号码：</td>
			<td><input type="text" name="smobile" id="smobile" value="<%=session("smobile")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">入学年份：</td>
			<td><input type="text" name="inYear" id="inYear" value="<%=session("inYear")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">老师姓名：</td>
			<td><input type="text" name="teacher" id="teacher" value="<%=session("teacher")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">教育层次：</td>
			<td>
				<select name="arrange" id="arrange">
					<option value="0">- 不限 -</option>
					<option value="1">高起专</option>
					<option value="2">高起本</option>
					<option value="3">专升本</option>
					<option value="4">无</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">注册机构：</td>
			<td>
				<select name="usersId" id="usersId">
					<option value="0">- 不限 -</option>
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
			<td style="font-family:'幼圆', Helvetica, sans-serif;">教育方式：</td>
			<td>
				<select id="eduId" name="eduId" onchange="changeRltnVal(this)">
					<option value="0">- 不限 -</option>
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
			<td style="font-family:'幼圆', Helvetica, sans-serif;">学校名称：</td>
			<td>
				<select id="schId" name="schId">
					<option value="0">- 不限 -</option>
				</select>
			</td>
			
			<td style="font-family:'幼圆', Helvetica, sans-serif;">所学专业：</td>
			<td>
				<select name="specId" id="specId">
					<option value="0">- 不限 -</option>
				</select>
			</td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">学习中心：</td>
			<td>
				<select name="centerId" id="centerId">
					<option value="0">- 不限 -</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">推荐机构：</td>
			<td>
				<select name="subUserId" id="subUserId" onchange="changeComName(this)">
					<option value="0">- 不限 -</option>
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
			<td style="font-family:'幼圆', Helvetica, sans-serif;">推荐人：</td>
			<td>
				<select name="comId" id="comId" >
					<option value="0">- 不限 -</option>
				</select>
			</td>
			
			<td style="font-family:'幼圆', Helvetica, sans-serif;">入学日期：</td>
			<td colspan="2">
				<input name="fromYear" id="fromYear" type="text" style="width:100px;" size="12" value="<%=session("fromYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toYear" id="toYear" type="text" style="width:100px;" size="12" value="<%=session("toYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
			<td style="font-family:'幼圆', Helvetica, sans-serif; text-align:right;">返利日期：</td>
			<td colspan="2">
				<input name="fromTypeFeeYear" id="fromTypeFeeYear" type="text" style="width:100px;" size="12" value="<%=session("fromTypeFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toTypeFeeYear" id="toTypeFeeYear" type="text" style="width:100px;" size="12" value="<%=session("toTypeFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
		</tr>
		<tr>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">学位要求：</td>
			<td>
				<select name="isDegree" id="isDegree">
					<option value="0">- 不限 -</option>
					<option value="1">要学位</option>
					<option value="2">不要学位</option>
				</select>
			</td>
			
			<td style="font-family:'幼圆', Helvetica, sans-serif;">收费日期：</td>
			<td colspan="3">
				<input name="fromFeeYear" id="fromFeeYear" type="text" size="12" value="<%=session("fromFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" /> - 
				<input name="toFeeYear" id="toFeeYear" type="text" size="12" value="<%=session("toFeeYear")%>" class="Wdate" onfocus="WdatePicker({isShowClear:false,readOnly:false})" />
			</td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">交费时间：</td>
			<td colspan="2">
				<select name="stuFeeYear" id="stuFeeYear" style="width:85px">
					<option value="0">- 不限 -</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
				</select> 年-
				<select name="stuFeeMonth" id="stuFeeMonth" style="width:85px">
					<option value="0">- 不限 -</option>
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
			<td style="font-family:'幼圆', Helvetica, sans-serif;">专本套：
				<select name="isZbtao" id="isZbtao" style="width:85px">
					<option value="0">- 不限 -</option>
					<option value="1">是</option>
					<option value="2">否</option>
					<option value="3">无</option>
				</select></td>
		</tr>
	</table>
	</div>
	
	<div class="searchBtnDiv">
<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/user.gif" border="0"> <% =session("show_name") %>
			<span class="timeFont">[登录时间：<% =session("loginTime") %>]</span>
	</div>
	<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/jobtype.gif" border="0"> 功能类型
			<span class="timeFont" id="jobTypeName">[<%=session("typeName")%>]</span>
	</div>
		<a href="adminConsole.asp" class="easyui-linkbutton" icon="icon-back">返 回</a>
		<a href="addStudent.asp" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-add">新 增</a>
		<a href="javascript:void(0);" onclick="doSearch()" class="easyui-linkbutton" icon="icon-search">查 询</a>
		<% if userId = 1 then %><a href="javascript:void(0);" onclick="doBatchDel()" class="easyui-linkbutton" icon="icon-search">批量删除</a><% end if %>
		<input type="hidden" id="delIds" />
	</div>
	
	<div id="listDiv">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#a0a0a0; font-family:'微软雅黑', Helvetica, sans-serif;">
		<tr style="">
			<th>序号</th>
			<th><input type="checkbox" onclick="doCheckAllChk(this)" <% if userId <> 1 then %>disabled<% end if %> /></th>
			<th>学员</th>
			<th width="50px;">手机</th>
			<th>注册机构</th>
			
			<th>推荐人</th>
			<th>提成</th>
			<th>老师</th>
			<th>年份</th>
			<th>教育方式</th>
			<th>学校</th>
			<th>层次</th>
			<th>专业</th>
			<th>专本套</th>
			<th>入学时间</th>
			<th>交费时间</th>
			<th>交费金额</th>
			<th>学习中心</th>
			<th>费用明细</th>
			<th style="width:80px;">操作</th>
		</tr>
		<%
			for i= 1 to rs.pagesize
			if rs.eof or rs.bof then
			exit for
			end if
			
			'入学时间
			inYearStr = "-"
			if(rs("stu_in_year") <> "" and rs("stu_in_year") <> "1970-01-01" and rs("stu_in_year") <> "1970-1-1") then
				inYearStr = rs("stu_in_year")
			end if
			
			'层次
			arrange = rs("arrange")
			select case arrange
				case 1
				arrangeStr="高起专"
				case 2
				arrangeStr="高起本"
				case 3
				arrangeStr="专升本"
				case 4
				arrangeStr="无"
			end select
			
			'已返利费用
			totalTypeFee = rs("total_type_fee")
			typeFee = rs("type_fee1")+rs("type_fee2")+rs("type_fee3")+rs("type_fee4")
			wholeTypeFee = wholeTypeFee + totalTypeFee
			allTypeFee = allTypeFee + typeFee
		
			'1 应收总费用
			totalFee = rs("total_fee")
			atotalFee = atotalFee + totalFee
			
			'2 已收总费用
			allFee = rs("fee1")+rs("fee2")+rs("fee3")+rs("fee4")+rs("fee5")+rs("fee6")+rs("fee7")+rs("fee8")-rs("total_refund_fee")
			aallFee=aallFee + allFee
			
			'3 交予学校费用
			ftotalFee = rs("fact_total_fee")
			aftotalFee = aftotalFee + ftotalFee
			
			'4 总利润
			gain = allFee - ftotalFee - typeFee
			allGain = allGain + gain
			
		%>
		<tr>
			<td><%=i%></td>
			<td><input type="checkbox" value="<%=rs("lev_stu_id")%>" onclick="doCheckChk()" <% if userId <> 1 then %>disabled<% end if %> /></td>
			<td><a href='editLeaveStudent.asp?levStuId=<%=rs("lev_stu_id")%>' target='_blank' title="备注：&#13;&#10;<%=replace(rs("smemo"),"\u0028","+")%>&#13;&#10;---------&#13;&#10;学生说明：&#13;&#10;<%=rs("stu_info")%>" style="color:#000000;"><%=rs("stu_name")%></a></td>
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
			<td title="总返利额：￥<%=totalTypeFee%>;&#13;&#10;已返利额：￥<%=typeFee%>;">
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
					zbtStr="是"
					case 2
					zbtStr="否"
					case 3
					zbtStr="无"
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
			<td><%=rs("stu_fee")%>元</td>
			<td><%=rs("sch_center")%></td>
			<!--  title="[应收总费用]/[已收总费用]&#13;&#10;[交予学校费用]/[利润]" -->
			<td id="<%=rs("lev_stu_id")%>" class="showCur">
				￥<%=totalFee%>/￥<%=allFee%><br />
				￥<%=ftotalFee%>/￥<%=gain%>
				
				<div class="subDiv" id="feeCot<%=rs("lev_stu_id")%>" style=" font-family:'幼圆', Helvetica, sans-serif;">
				<div style="height:20px; background:#e0e0e0">
					<b>总费用：</b> <%=rs("total_fee")%>元
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
					<b>具体费用：</b><br />
					1,<%=rs("fee1")%>元(日期：<%=fee1Years%>)<br />
				  	2,<%=rs("fee2")%>元(日期：<%=fee2Years%>)<br />
				  	3,<%=rs("fee3")%>元(日期：<%=fee3Years%>)<br />
				  	4,<%=rs("fee4")%>元(日期：<%=fee4Years%>)<br />
				  	5,<%=rs("fee5")%>元(日期：<%=fee5Years%>)<br />
				  	6,<%=rs("fee6")%>元(日期：<%=fee6Years%>)<br />
				  	7,<%=rs("fee7")%>元(日期：<%=fee7Years%>)<br />
				  	8,<%=rs("fee8")%>元(日期：<%=fee8Years%>)
				</div>
                <div style="height:20px; background:#e0e0e0">
					<b>交学校费用：</b> <%=rs("fact_total_fee")%>元
				</div>
				<div style="height:20px; background:#e0e0e0">
					<b>总返利：</b> <%=rs("total_type_fee")%>元
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
                    <b>实际返利：</b><br />
				  	1,<%=rs("type_fee1")%>元(日期：<%=typeFee1Years%>)<br />
				  	2,<%=rs("type_fee2")%>元(日期：<%=typeFee2Years%>)<br />
				  	3,<%=rs("type_fee3")%>元(日期：<%=typeFee3Years%>)<br />
				  	4,<%=rs("type_fee4")%>元(日期：<%=typeFee4Years%>)
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
				 	<b>退还费用：</b><br />
					1,<%=refundFee1%>元(日期：<%=refundFee1Years%>)<br />
                 	2,<%=refundFee2%>元(日期：<%=refundFee2Years%>)
				 </div> 
			</div>
			</td>
			<td style="width:80px;">
				<a href='editLeaveStudent.asp?levStuId=<%=rs("lev_stu_id")%>' target='_blank' class="easyui-linkbutton" plain="true">编辑</a> 
				<a <% if username="admin" then %>href='javascript:doDel(<%=rs("lev_stu_id")%>)'<% end if%> class="easyui-linkbutton" plain="true">删除</a>
			</td>
		</tr>
		<% 
			rs.movenext
			next 
		%>
		<tr>
			<td colspan="7" style="background:#dfdfdf"></td>
			<td style="background:#dfdfdf; font-weight:bold;" title="[总返利]/[已返利]">￥<%=wholeTypeFee%>/￥<%=allTypeFee%></td>
			<td  colspan="10" style="background:#dfdfdf"></td>
			<td style="background:#dfdfdf; font-weight:bold;" title="[应收总费用]/[已收总费用]&#13;&#10;[交予学校费用]/[总利润]">
				￥<%=atotalFee%>/￥<%=aallFee%><br />
				￥<%=aftotalFee%>/￥<%=allGain%></td>
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
				<a href="javascript:dopage(-99)"><b>首页</b></a>&nbsp;
				<% if rs.pagecount=1 then %>
					&lt;<b>前一页</b>&nbsp;
					<b>后一页</b>&gt;&nbsp;
					<b>末页</b>&nbsp;
				<% else %>
					<% if epage=1 then %>
						&lt;<b>前一页</b>&nbsp;
					<% else %>
						<a href="javascript:dopage(<%=epage-1%>)">&lt;<b>前一页</b></a>&nbsp;
					<% end if %>
					<% if epage=rs.pagecount then %>
						<b>后一页</b>&gt;&nbsp;
						<b>末页</b>&nbsp;
					<% else %>
						<a href="javascript:dopage(<%=epage+1%>)"><b>后一页</b>&gt;</a>&nbsp;
						<a href="javascript:dopage(<%=rs.pagecount%>)"><b>末页</b></a>&nbsp;
					<% end if %>
				<% end if %>
				现在是第<b><%=epage%></b>页 共有<b><%=rs.pagecount%></b>页 共有<b><%=rs.recordcount%></b>条数据
			</td>
		</tr>
	</table>
	</div>
	<!-- 主体功能区(结束) -->
	
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

