var xmlhttp1;
function createXMLHttpRequest1(){
	if(window.ActiveXObject){
		xmlhttp1=new ActiveXObject("Msxml2.XMLHTTP");
	}else if(window.XMLHttpRequest){
	}
}

// ѧУ
function getSchName(thisVal){
	createXMLHttpRequest1();
	xmlhttp1.onreadystatechange=createSchName;
	var url="getSchNameVal.asp?eduId="+escape(thisVal);
	xmlhttp1.open("POST",url,true);
	xmlhttp1.setRequestHeader("Content-Type","application/x-www-form-encoded");
	xmlhttp1.send(null);
}

// ѧУ
function createSchName(){
	if(xmlhttp1.readyState==4){
		if(xmlhttp1.status==200){
			$("#schId").empty();
			var text=xmlhttp1.responseText;
			$("#schId").html(text);
		}
	}
}