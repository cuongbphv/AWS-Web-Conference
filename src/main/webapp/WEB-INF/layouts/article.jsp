<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  
  	<title>${title }</title>

    <!-- favicon -->
    <link href="img/favicon.png" rel=icon>

    <!-- web-fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,500' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!-- Style CSS -->
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/lastestnews.css" rel="stylesheet">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar">

	<div id="main-wrapper">
		<!-- Page Preloader -->
		<div id="preloader">
			<div id="status">
				<div class="status-mes"></div>
			</div>
		</div>

		<tiles:insertAttribute name="header" />

		<section id="section-intro" class="section-wrapper about-event">
			<div class="container">
				<div class="row">
				
				<tiles:insertAttribute name="body" />
				<tiles:insertAttribute name="slidebar" />
				
				</div>
			</div>
		</section>
		
		<tiles:insertAttribute name="footer" />


	</div>


	<!-- jquery -->
	<script src="js/jquery-2.1.4.min.js"></script>

	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="js/jquery.easing.min.js"></script>

	<!--<script src="js/one-page-nav.js"></script>-->
	<script src="js/scripts.js"></script>

</body>
</html>