var xmlhttp3;
function createXMLHttpRequest3(){
	if(window.ActiveXObject){
		xmlhttp3=new ActiveXObject("Msxml2.XMLHTTP");
	}else if(window.XMLHttpRequest){
	}
}

// רҵ
function getCentName(thisVal){
	createXMLHttpRequest3();
	xmlhttp3.onreadystatechange=createCentName;
	var url="getCentNameVal.asp?eduId="+escape(thisVal);
	xmlhttp3.open("POST",url,true);
	xmlhttp3.setRequestHeader("Content-Type","application/x-www-form-encoded");
	xmlhttp3.send(null);
}

function createCentName(){
	if(xmlhttp3.readyState==4){
		if(xmlhttp3.status==200){
			$("#centerId").empty();
			var text=xmlhttp3.responseText;
			$("#centerId").html(text);
		}
	}
}