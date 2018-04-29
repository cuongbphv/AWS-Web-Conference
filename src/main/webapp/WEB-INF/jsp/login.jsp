<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login</title>

    <!-- favicon -->
    <link href="img/favicon.png" rel=icon>

    <!-- web-fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,500' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar">
<div id="main-wrapper">
    <!-- Page Preloader -->
    <div id="preloader">
        <div id="status">
            <div class="status-mes"></div>
        </div>
    </div>

    <header class="header">
        <!-- Navigation -->
        <nav class="navbar main-menu" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/default?id=1"><img src="img/logo.png" alt=""></a>
                </div>
            </div>
        </nav>
    </header>

    <div class="jumbotron text-center">
        <div class="content">
            <div class="event-date">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Đăng nhập quản trị</h4>
                                </div>
                                <div class="panel-body">
                                    <form accept-charset="UTF-8" role="form" class="form-opacity ${error != null ? 'has-error' : ''}" name="f" action="${contextPath}/login" method="POST">
                                        <fieldset>
                                            <div class="form-group">
                                                <input class="form-control" placeholder="Username" name="username" type="text">
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" placeholder="Password" name="password" type="password">
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <!-- <div class="checkbox">
                                                <label>
                                                    <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                                                </label>
                                            </div> -->
                                            <input class="btn btn-lg btn-success btn-block" type="submit" value="Login"> 
                                            <div class="form-group" style="color:#2C2732; margin-top:10px; font-size:16px;">
                                                <span><strong>${error}</strong></span>
                                                <span><strong>${logout}</strong></span>
                                            </div>                                      
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- .Jumbotron-->

    <footer class="footer">
        <div class="copyright-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <form id="contactForm" class="subscribe-form form-inline" action="#" method="POST">
                            <h6>STAY INFORMED</h6>
                            <div class="form-group">
                                <label for="emailTwo" class="sr-only">Email</label>
                                <input type="email" class="form-control input-md" required="" id="emailTwo" name="email"
                                       placeholder="Enter your email address">
                            </div>
                            <button type="submit" class="btn btn-primary btn-md">SUBSCRIBE</button>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h6>CONTACT WITH ME</h6>
                        <ul class="social-link">
                            <li><a href="#"><img src="img/instagram.png" alt="no image"> Instagram</a></li>
                            <li><a href="#"><img src="img/facebook.png" alt="no image"> Facebook</a></li>
                            <li><a href="#"><img src="img/twitter.png" alt="no image"> Twitter</a></li>
                            <li><a href="#"><img src="img/youtube.png" alt="no image"> Youtube</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="copytext text-center">&copy; Conference. All rights reserved | Design By: <strong>Five Group</strong></div>
                    </div>
                </div>
            </div>
            <!-- .container -->
        </div>
        <!-- .copyright-section -->
    </footer>
    <!-- .footer -->

</div>
<!-- #main-wrapper -->


<!-- jquery -->
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/scripts.js"></script>
<!-- end jquery -->
</body>
</html>