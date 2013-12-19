<!--#include file="conn.asp" -->
<%
	dim stuMonth,feeType,stuFee
	Idx = Request.QueryString("sfeeId")
	stuId= Request.QueryString("stuId")
	stuName= Request.QueryString("stuName")
	stuMobile= Request.QueryString("stuMobile")
	if Idx <> "" then 
	exec="select * from stu_fee where (sfee_id="&Idx&")"
	else if stuId <> "" then
	exec="select * from stu_fee where (stu_id="&stuId&")"
	end if
	end if
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
	if not rs.eof then
		Idx = rs("sfee_id")
		stuId = rs("stu_id")
		stuName = rs("stu_name")
		stuYear = rs("stu_year")
		stuMonth = rs("stu_month")
		feeType = rs("fee_type")
		stuFee = rs("stu_fee")
		stuMobile = rs("stu_mobile")
		rs.close
		
	else
		stuYear = 2009
		stuMonth = 1
		feeType = 1
		stuFee = 0
		exec1="insert into stu_fee(stu_id,stu_name,stu_fee,stu_year,stu_month,fee_type,stu_mobile) values("&stuId&",'"&stuName&"',"&stuFee&","&stuYear&","&stuMonth&","&feeType&",'"&stuMobile&"')"
		conn.execute exec1
		exec2="select * from stu_fee where (stu_id="&stuId&")"
		set rs2=server.createobject("adodb.recordset")
		rs2.open exec2,conn,1,1 
		Idx = rs2("sfee_id")
		stuId = rs2("stu_id")
		stuName = rs2("stu_name")
		stuMobile = rs2("stu_mobile")
		rs2.close
		
	end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网络教育平台-添加费用信息</title>
<link href="../css/wy.css" rel="stylesheet" type="text/css" />
<script src="../js/tiny_mce/tiny_mce.js"  type=text/javascript></script>
<script src="../js/TinyMceTools.js"    type=text/javascript></script>
<script language="javascript" type="text/javascript">
		tinyMCE.init({
			mode : "textareas",
			theme: "advanced"
		});
	</script>
<script language="javascript" type="text/javascript">
function doLogIn(){
	var stuId = document.getElementById("stuId").value;
	if(Trim(stuId) == "0"){
		alert("请选择学生名称");
		document.getElementById("stuId").focus();
		return false;
	}else{
		document.getElementById("stuName").value = document.getElementById('stuId').options[document.getElementById('stuId').selectedIndex].title;
	}
	var stuFee = document.getElementById("stuFee").value;
	if(Trim(stuFee) == ""){
		alert("请输入费用");
		document.getElementById("stuFee").focus();
		return false;
	}
	var stuYear = document.getElementById("stuYear").value;
	if(Trim(stuYear) == "0"){
		alert("请选择年份");
		document.getElementById("stuYear").focus();
		return false;
	}
	var stuMonth = document.getElementById("stuMonth").value;
	if(Trim(stuMonth) == "0"){
		alert("请选择月份");
		document.getElementById("stuMonth").focus();
		return false;
	}
	document.addStuFee.submit();
	
}
function Trim(str)
{
  return  str.replace(/^\s*(.*?)[\s\n]*$/g,  '$1');
}
</script>
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
<!--#include file="conn.asp" -->
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:5px">
<tr>
	<td align="center">
		<form  name="addStuFee" method="post" action="editStuFeeAct.asp">
		<input type="hidden" name="sfeeId" value="<%=Idx%>" />
		<table width="600" border="1" cellpadding="0" cellspacing="0" bordercolor="B5CEE5">
		   <tr>
		   		<td>
					<table width="99%" border="0" cellspacing="0" cellpadding="0" >
					  <tr>
						<td width="100" height="50" align="right" class="logTitle" style="border-bottom:solid 1px #CCCCCC">交费方式：</td>
						<td width="" align="left" style="border-bottom:solid 1px #CCCCCC">
							<input type="radio" name="feeType" id="feeType1" value="1" <% if feeType =1 then%>checked<%end if%> /> 按学期交费
							<input type="radio" name="feeType" id="feeType2" value="2" <% if feeType =2 then%>checked<%end if%>/> 按学年交费
						</td>
					  </tr>
					  <tr>
						<td width="100" height="50" align="right" class="logTitle" style="border-bottom:solid 1px #CCCCCC">学生名称：</td>
						<td width="" align="left" style="border-bottom:solid 1px #CCCCCC">
							<input type="hidden" name="stuName" id="stuName" value="<%=stuName%>" />
							<select name="stuId" id="stuId">
								<option value="0">--选择推荐人--</option>
								<%
									exec3="select * from student_info"
									set rs3=server.createobject("adodb.recordset")
									rs3.open exec3,conn,1,1
									for i= 1 to rs3.recordcount
									if rs3.eof then
									exit for
									end if
								%>
								<option title="<%=rs3("stu_name")%>"<% if stuId = rs3("student_id") then%>selected<%end if%> value="<%=rs3("student_id")%>"><%=rs3("stu_name")%></option>
								<% 
									rs3.movenext
									next 
								%>
								</select>
						</td>
					  </tr>
					  <tr>
						<td width="100" height="50" align="right" class="logTitle" style="border-bottom:solid 1px #CCCCCC">联系电话：</td>
						<td width="" align="left" style="border-bottom:solid 1px #CCCCCC"><input type="text" name="stuMobile" id="stuMobile" style="width:155px" value="<%=stuMobile%>"></td>
					  </tr>
					  <tr>
						<td width="100" height="50" align="right" class="logTitle" style="border-bottom:solid 1px #CCCCCC">所交学费：</td>
						<td width="" align="left" style="border-bottom:solid 1px #CCCCCC"><input type="text" name="stuFee" id="stuFee" style="width:155px" value="<%=stuFee%>"></td>
					  </tr>
					  <tr>
						<td width="100" height="50" align="right" class="logTitle" style="border-bottom:solid 1px #CCCCCC">交费时间：</td>
						<td width="" align="left" style="border-bottom:solid 1px #CCCCCC">
							<select name="stuYear" id="stuYear">
								<option value="0">-请选择-</option>
								<option value="2009"<% if stuYear =2009 then%>selected<%end if%>>2009</option>
								<option value="2010"<% if stuYear =2010 then%>selected<%end if%>>2010</option>
								<option value="2011"<% if stuYear =2011 then%>selected<%end if%>>2011</option>
								<option value="2012"<% if stuYear =2012 then%>selected<%end if%>>2012</option>
							</select> 年-
							<select name="stuMonth" id="stuMonth">
								<option value="0">-请选择-</option>
								<option value="1"<% if stuMonth =1 then%>selected<%end if%>>1</option>
								<option value="2"<% if stuMonth =2 then%>selected<%end if%>>2</option>
								<option value="3"<% if stuMonth =3 then%>selected<%end if%>>3</option>
								<option value="4"<% if stuMonth =4 then%>selected<%end if%>>4</option>
								<option value="5"<% if stuMonth =5 then%>selected<%end if%>>5</option>
								<option value="6"<% if stuMonth =6 then%>selected<%end if%>>6</option>
								<option value="7"<% if stuMonth =7 then%>selected<%end if%>>7</option>
								<option value="8"<% if stuMonth =8 then%>selected<%end if%>>8</option>
								<option value="9"<% if stuMonth =9 then%>selected<%end if%>>9</option>
								<option value="10"<% if stuMonth =10 then%>selected<%end if%>>10</option>
								<option value="11"<% if stuMonth =11 then%>selected<%end if%>>11</option>
								<option value="12"<% if stuMonth =12 then%>selected<%end if%>>12</option>
							</select>月
						</td>
					  </tr>
					  <tr>
						<td height="60" colspan="2" align="center"><img src="../images/login.jpg" style="cursor:pointer" width="49" height="19" name="Submit2" value="确 定" onclick="doLogIn()">
					  </tr>
					</table>
				</td>
		   </tr>
		</table>
		</form>
	</td>
</tr>
</table>
<%
    else
%>
<table width="900" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:5px">
	<tr>
		<td height="40px" width="450" align="right" valign="middle">
			<img src="../images/tieshi.png" border="0" />&nbsp; 
		</td>
		<td  width="450" valign="middle">
			<a href="../login.asp" class="headTitle">请登陆</a>
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
