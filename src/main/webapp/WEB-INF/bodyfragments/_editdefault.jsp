<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">

  $(document).ready(function() {
	  var table = $("#myDiv").html();
	  console.log(table);
	  setTimeout(function(){
		  tinyMCE.activeEditor.setContent(table);
			tinyMCE.activeEditor.focus();
			
		},100)
  });
  </script>

<div id="post-news" class="col-md-10 well slideItem">

	<div id="myDiv" style="display:none">	
		${defaultpage.content }
	</div>

	<form method="POST" action="save-default-page">

		<div class="col-md-9 col-md-offset-1">

			<input type="hidden" value="${defaultpage.id }" name="id" />
			<input type="hidden" value="${defaultpage.name }" name="name" />
			<div class="form-group">
				<label for="title">Header:</label> <input class="form-control"
					type="text" value="${defaultpage.header }" name="header"
					placeholder="Nhập tiêu đề..." />
			</div>

			<div class="form-group">
				<label for="content">Nội dung trang:</label>
				<textarea id="myTextarea" width="100%"
					name="content"></textarea>
			</div>

			<div class="form-group">
				<label for="lastAuthor">Chỉnh sửa bởi:</label> <input class="form-control"
					type="text" name="lastAuthor" disabled />
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

			<input type="submit" />
		</div>
	</form>

</div>

<script type="text/javascript">
  tinymce.init({
    selector: '#myTextarea',
    theme: 'modern',
    schema: 'html5',
    height: 500,
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
    content_style: ".tinymce-content p { padding: 0; margin: 1px 0; }",
    toolbar: 'insertfile undo redo | bold italic underline | strikethrough subscript superscript | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table hr | link codesample image media | print preview  | fontselect fontsizeselect sizeselect styleselect | fullpage  forecolor backcolor emoticons',
    font_formats: 'Andale Mono=andale mono,times;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Trebuchet MS=trebuchet ms,geneva;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats',
    fontsize_formats: '8pt 9pt 10pt 11pt 12pt 13pt 14pt 16pt 18pt 20pt 24pt 30pt 36pt 40pt 46pt 50pt'
  });
  </script>


