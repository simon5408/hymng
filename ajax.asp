<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Response.Charset="gb2312"
response.cachecontrol="no-cache"
response.addHeader "pragma","no-cache"
response.expires=-1
response.expiresAbsolute=now-1

name1="dengmingyong" 
name2=unescape(request.Form ("name3")) 
if name1=name2 then 
response.Write "�û����Ա�ע��" 
else 
response.write "���û�������ע��" 
end if 
%>