<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAjax</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
	.uploadResult{
	width: 100%;
	background-color: gray;
	}
	.uploadResult ul{
	diplay:flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
	}
	.uploadResult ul li{
	list-style: none;
	padding: 10px;
	}
</style>
</head>
<body>
	<h3>Upload With Ajax</h3>
	<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
 	</div>
 	<div class="uploadResult">
 		<ul>
 		</ul>
 	</div>
 	<button id="uploadBtn">Upload</button>
	
	<script>
	 $(document).ready(function() {
		 
		 var regex = new RegExp("\.(exe|sh|zip|alz)$");
		 var maxSize = 5*1024*1024;
		 
		 function checkExtension(fileName,fileSize){
			 if (fileSize > maxSize){
				 alert("용량이 너무 큽니다");
				 return false;
			 }
			 if(regex.test(fileName)){
				 alert("파일확장자 확인이 ");
				 return false;
			 }
			 return true;
		 }
		 
		 
		 var cloneObj = $('.uploadDiv').clone();
		 
		 $('#uploadBtn').on('click', function(e){
			 var formData = new FormData(); //form.enctype='multipart/form-data'
		 	var inputFile = $('input[name="uploadFile"]');
			 var files = inputFile[0].files;
			 console.log(files);
			 //add file data to formdata
			 for( var i =0; i<files.length; i++){
				 if(!checkExtension(formData.append("uploadFile", files[i]))){
					 return false;
				 }
				 formData.append("uploadFile", files[i]);
			 }
			 for (let data of formData.entries())
			 console.log(data[0],data[1]);
			 //ajax call.
			 $.ajax({
			 	url: 'uploadAjaxAction',
			 	processData: false,
			 	contentType: false,
			 	type:'post',
			 	data: formData, 
			 	success: function (result){
			 		alert('Success')
			 		console.log(result);
			 		$('.uploadDiv').html(cloneObj.html());// 선택파일 초기화.
			 		showUploadedFile(uploadResult);
			 	},
			 	error:function(reject){
			 		alert('Error');
			 		console.log(reject);
			 	}
			 })
		 }) // end of $('#uploadBtn'.on('click',function()......))
		 var uploadResult = $('.uploadResult ul');
		 function showUploadedFile(uploadResultArr){
			 var str = '' ;
			 $(uploadResultArr).each(function (i,obj){
				 if(!obj.image){//이미지 파일아닌... 일반파일
					str += "<li><img width ='10px' src='/resources/img/attach.png'>" +obj.fileName + "</li>"; 
					 
				 }else{
					 var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid + "_"+obj.fileName);
				 str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
				 }
				 });
			 uploadResult.append(str);
		 }
	 });
	</script>
</body>
</html>