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
    selector: 'textarea',
    mode : "exact",
    theme: 'modern',
    width: 600,
    height: 300,
    schema: 'html5',
    file_browser_callback: function(field_name, url, type, win) {
    win.document.getElementById(field_name).value = 'eyes.jpg';
    },
    file_picker_callback: function(callback, value, meta) {
        // Provide file and text for the link dialog
        console.log(value);
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
    fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
    images_upload_handler: function (blobInfo, success, failure) {
        var xhr, formData;

        xhr = new XMLHttpRequest();
        xhr.withCredentials = false;
        xhr.open('POST', 'postAcceptor.php');

        xhr.onload = function() {
          var json;

          if (xhr.status != 200) {
            failure('HTTP Error: ' + xhr.status);
            return;
          }

          json = JSON.parse(xhr.responseText);

          if (!json || typeof json.location != 'string') {
            failure('Invalid JSON: ' + xhr.responseText);
            return;
          }

          success(json.location);
        };

        formData = new FormData();
        formData.append('file', blobInfo.blob(), blobInfo.filename());

        xhr.send(formData);
      }
  });
  
  $(document).ready(function() {
	  var table = $("#myDiv").html();
	  console.log(table);
	  setTimeout(function(){
		  tinyMCE.activeEditor.setContent(table);
			tinyMCE.activeEditor.focus();
			
		},100)
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
		<textarea id="myTextarea" style="width:100%" name="content"></textarea>
		<input type="submit"/>
	</form>


</body>


</html>