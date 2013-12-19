var xmlhttp2;
function createXMLHttpRequest2(){
	if(window.ActiveXObject){
		xmlhttp2=new ActiveXObject("Msxml2.XMLHTTP");
	}else if(window.XMLHttpRequest){
	}
}

// רҵ
function getSpecName(thisVal){
	createXMLHttpRequest2();
	xmlhttp2.onreadystatechange=createSpecName;
	var url="getSpecNameVal.asp?eduId="+escape(thisVal);
	xmlhttp2.open("POST",url,true);
	xmlhttp2.setRequestHeader("Content-Type","application/x-www-form-encoded");
	xmlhttp2.send(null);
}

function createSpecName(){
	if(xmlhttp2.readyState==4){
		if(xmlhttp2.status==200){
			$("#specId").empty();
			var text=xmlhttp2.responseText;
			$("#specId").html(text);
		}
	}
}