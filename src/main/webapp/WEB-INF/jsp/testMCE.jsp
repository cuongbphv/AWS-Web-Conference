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
<script type="text/javascript">
tinymce.init({
	  selector: '#editor',
	  plugins: 'image code',
	  toolbar: 'undo redo | link image | code',
	  // enable title field in the Image dialog
	  image_title: true, 
	  // enable automatic uploads of images represented by blob or data URIs
	  automatic_uploads: true,
	  // URL of our upload handler (for more details check: https://www.tinymce.com/docs/configure/file-image-upload/#images_upload_url)
	  // images_upload_url: 'postAcceptor.php',
	  // here we add custom filepicker only to Image dialog
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
	    input.setAttribute('accept', 'image/*');
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
		        }
		    });
	    };
	    
	    input.click();
	  }
	});
  </script>
  


</head>
<body>
	
	<div id="myDiv" style="display:none">	
		${news.content }
	</div>

   	<form method="POST" action="save-news">
   	
		<input type="hidden" value="${news.id }" name="id"/>
		<label>Title</label>
		<input style="width:80%" type="text" value="${news.title }" name="title"/>
		<label>Content</label>
		<textarea id="editor" style="width:100%" name="content"></textarea>
		<input type="submit"/>
	</form>


<p><video controls="controls" width="300" height="150">
 <source src="//www.youtube.com/embed/ar8UIMp0hSQ" /></video></p>

<iframe width="100%" height="100%" src="https://www.youtube.com/embed?v=piy_TH6LjBE"></iframe>

<p><iframe src="//www.youtube.com/embed/piy_TH6LjBE" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>

<iframe width="100%" height="100%" src="https://drive.google.com/file/d/1AGIjONfaBzy5Qwc7DPEfz1Cy9kUzdgHG/preview"></iframe>

<video controls="controls">
            <source src="https://drive.google.com/uc?export=download&id=1Fg0yusvH_wvGcoJNgKfZHmA_dVd3ZcjH"/>
        </video>

</body>


</html>