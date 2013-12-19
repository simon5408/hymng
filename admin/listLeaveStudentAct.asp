<!--#include file="conn.asp" -->
<%
stuName = request.querystring("stuName")
session("stuName") = stuName
smobile = request.querystring("smobile")
session("smobile") = smobile
usersId = request.querystring("usersId")
if usersId = "" then
	usersId = 0
end if
session("usersId") = usersId
subUserId = request.querystring("subUserId")
if subUserId = "" then
	subUserId = 0
end if
session("subUserId") = subUserId
comId = request.querystring("comId")
if comId = "" then
	comId = 0
end if
session("comId") = comId
inYear = request.querystring("inYear")
session("inYear") = inYear
teacher = request.querystring("teacher")
session("teacher") = teacher
schId = request.querystring("schId")
if schId = "" then
	schId = 0
end if
session("schId") = schId
eduId = request.querystring("eduId")
if eduId = "" then
	eduId = 0
end if
session("eduId") = eduId
isDegree = request.querystring("isDegree")
if isDegree = "" then
	isDegree = 0
end if
session("isDegree") = isDegree
isZbtao = request.querystring("isZbtao")
if isZbtao = "" then
	isZbtao = 0
end if
session("isZbtao") = isZbtao
arrange = request.querystring("arrange")
if arrange = "" then
	arrange = 0
end if
session("arrange") = arrange
specId = request.querystring("specId")
if specId = "" then
	specId = 0
end if
session("specId") = specId
centerId = request.querystring("centerId")
if centerId = "" then
	centerId = 0
end if
session("centerId") = centerId
stuFeeYear = request.querystring("stuFeeYear")
if stuFeeYear = "" then
	stuFeeYear = 0
end if
session("stuFeeYear") = stuFeeYear
stuFeeMonth = request.querystring("stuFeeMonth")
if stuFeeMonth = "" then
	stuFeeMonth = 0
end if
session("stuFeeMonth") = stuFeeMonth
'入学时间范围
fromYear = request.querystring("fromYear")
session("fromYear") = fromYear
toYear = request.querystring("toYear")
session("toYear") = toYear
'返利时间范围
fromTypeFeeYear = request.querystring("fromTypeFeeYear")
session("fromTypeFeeYear") = fromTypeFeeYear
toTypeFeeYear = request.querystring("toTypeFeeYear")
session("toTypeFeeYear") = toTypeFeeYear
'已收费用时间范围
fromFeeYear = request.querystring("fromFeeYear")
session("fromFeeYear") = fromFeeYear
toFeeYear = request.querystring("toFeeYear")
session("toFeeYear") = toFeeYear

sql="select * from leaved_stu_info where 1=1 "

userId = session("user_id")
' 所属用户
if  userId <> 1 then
	sql = sql + " and (user_id="&userId&" or sub_user_id="&userId&") "
end if

'学生姓名
if stuName <> "" then
	sql =sql + " and stu_name like '%"&stuName&"%' "
end if
'手机
if smobile <> "" then
	sql =sql + " and smobile like '%"&smobile&"%' "
end if
'入学时间范围
if fromYear <> "" and toYear <> "" then
	sql =sql + " and (stu_in_year between #"&fromYear&"# and #"&toYear&"#) "
end if
'返利时间范围
if fromTypeFeeYear <> "" and toTypeFeeYear <> "" then
	sql =sql + " and ((type_fee1_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee2_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee3_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)or(type_fee4_year between #"&fromTypeFeeYear&"# and #"&toTypeFeeYear&"#)) "
end if
'已收费用时间范围
if fromFeeYear <> "" and toFeeYear <> "" then
	sql =sql + " and (fee1_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee2_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee3_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee4_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee5_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee6_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee7_year between #"&fromFeeYear&"# and #"&toFeeYear&"#)or(fee8_year between #"&fromFeeYear&"# and #"&toFeeYear&"#) "
end if
'注册机构
if usersId <> 0 then
	sql =sql + " and user_id ="&usersId&" "
end if
'推荐机构
if subUserId <> 0  then
	sql =sql + " and sub_user_id ="&subUserId&" "
end if
'推荐人
if comId <> 0 then
	sql =sql + " and com_id ="&comId&" "
end if
'教师
if teacher <> "" then
	sql =sql + " and teacher like '%"&teacher&"%' "
end if
'入学年份
if inYear <> "" then
	sql =sql + " and in_year like '%"&inYear&"%' "
end if
'学校名称
if schId <> 0 then
	sql =sql + " and sch_id ="&schId&" "
end if
'教育方式
if eduId <> 0 then
	sql =sql + " and edu_id="&eduId&" "
end if
'学位要求
if isDegree <>0 then
	sql =sql + " and is_degree="&isDegree&" "
end if
'专本套
if isZbtao <> 0 then
	sql =sql + " and is_zbtao="&isZbtao&" "
end if
'层次
if arrange <> 0 then
	sql =sql + " and arrange="&arrange&" "
end if
'所学专业
if specId <> 0 then
	sql =sql + " and spec_id="&specId&" "
end if
'学习中心
if centerId <> 0 then
	sql =sql + " and center_id="&centerId&" "
end if
'交费年
if stuFeeYear <> 0 then
	sql =sql + " and stu_fee_year="&stuFeeYear&" "
end if
'交费月
if stuFeeMonth <> 0 then
	sql =sql + " and stu_fee_month="&stuFeeMonth&" "
end if

sql =sql + " order by lev_stu_id desc "

exec=sql
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 

'===========分页========
'每页的记录条数
rs.pagesize=100

if request("page")<>"" then
	epage=cint(request("page"))
	if epage<1 then 
		epage=1
	end if 
	if epage>rs.pagecount then
		epage=rs.pagecount
	end if
else
	epage=1
end if

if rs.recordcount>0 then
	rs.absolutepage=epage
end if
%>