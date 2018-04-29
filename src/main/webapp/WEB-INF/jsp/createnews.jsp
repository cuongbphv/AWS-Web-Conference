<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create News</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<script src="https://driveuploader.com/upload/UBFoygIKIX/embed.js"></script>
<script type="text/javascript">
  tinymce.init({
    selector: '#myTextarea',
    theme: 'modern',
    width: 600,
    height: 300,
    schema: 'html5',
    media_live_embeds: true,
	  file_browser_types: 'image file media', 
	  // and here's our custom image picker
	  file_browser_callback: function(field_name, url, type, win) {
		
		var frmUpload = document.createElement('form');
		frmUpload.setAttribute('method','POST');
		frmUpload.setAttribute('action','upload-file');
		frmUpload.setAttribute('enctype','multipart/form-data');
		frmUpload.setAttribute('id','frmUpload');
		  
	    var input = document.createElement('input');
	    input.setAttribute('type', 'file');
	    input.setAttribute('name', 'file');
	    
	    var submit = document.createElement('input');
	    submit.setAttribute('type', 'submit');
	    
	    frmUpload.appendChild(input);
	    frmUpload.appendChild(submit);
	

	    input.onchange = function(event) {
	     
	    	var formData = new FormData(frmUpload);
			
	    	console.log(formData);
	    	
		    $.ajax({
		    	async: false,
		        url: "upload-file",
		        type: "POST",
		        dataType: 'text',
		        contentType: false,
		        processData: false,
		        cache: false,
		        data: formData,
		        success: function(response) {
		        	win.document.getElementById(field_name).value = response;
		        },
		        error: function(response){
		            console.log(response.responseText);
		         }
		    });
	    };
	    
	    input.click();
	  },
    file_picker_types: 'file image media',
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table contextmenu directionality emoticons template paste textcolor codesample'
    ],
    content_css: 'css/content.css',
    toolbar: 'codesample | insertfile undo redo | styleselect  | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage fontselect fontsizeselect sizeselect forecolor backcolor emoticons',
    font_formats: 'Andale Mono=andale mono,times;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Trebuchet MS=trebuchet ms,geneva;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats',
    fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt'
  });
  </script>

</head>
<body>

   	<form method="POST" action="save-news">
   	
		<input type="hidden" value="${news.id }" name="id"/>
		<label>Title</label>
		<input style="width:80%" type="text" value="${news.title }" name="title"/>
		<label>Content</label>
		<textarea id="myTextarea" style="width:100%" value="${news.content }" name="content"></textarea>
		<input type="submit"/>
	</form>

	<div class="driveuploader-replace"></div>
<script src="https://driveuploader.com/upload/{uploader key}/embed.js"></script>

</body>
</html>