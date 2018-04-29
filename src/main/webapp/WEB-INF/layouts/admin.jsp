<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>${title }</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="img/favicon.png" rel=icon>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,500'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>

<link href="/css/style.css" rel="stylesheet">
<link href="/css/admin.css" rel="stylesheet">




</head>
<body id="page-top" data-spy="scroll" data-target=".navbar">
	<div id="main-wrapper">

		<tiles:insertAttribute name="adminheader" />

		<div class="admin-wrapper row">
			<div class="col-md-2 well">
				<tiles:insertAttribute name="adminslidebar" />
			</div>

			<tiles:insertAttribute name="body" />
		</div>

	</div>

<!-- jquery -->
<script src="js/jquery-2.1.4.min.js"></script>

<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="js/jquery.easing.min.js"></script>

<script src="js/admin.js"></script>

  <script>
    function show(param_div_id) {
        var elements = $(".slideItem");
        elements.each(function(){
        	$(this).css("display", "none");
        });
        
        $("#"+param_div_id).css("display", "block");
    }
</script>

</body>
</html>