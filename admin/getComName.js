var xmlhttp4;
function createXMLHttpRequest4(){
	if(window.ActiveXObject){
		xmlhttp4=new ActiveXObject("Msxml2.XMLHTTP");
	}else if(window.XMLHttpRequest){
	}
}

// רҵ
function getComName(thisVal){
	createXMLHttpRequest4();
	xmlhttp4.onreadystatechange=createComName;
	var url="getComNameVal.asp?userId="+escape(thisVal);
	xmlhttp4.open("POST",url,true);
	xmlhttp4.setRequestHeader("Content-Type","application/x-www-form-encoded");
	xmlhttp4.send(null);
}

function createComName(){
	if(xmlhttp4.readyState==4){
		if(xmlhttp4.status==200){
			$("#comId").empty();
			var text=xmlhttp4.responseText;
			$("#comId").html(text);
		}
	}
}