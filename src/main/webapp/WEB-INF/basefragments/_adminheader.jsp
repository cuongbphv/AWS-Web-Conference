
<%@ page contentType="text/html; charset=UTF-8"%>

<header class="header">
	<!-- Navigation -->
	<nav class="navbar sticky-nav main-menu" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="/"><img
					src="/img/logo.png" alt=""></a>
			</div>

			<div
				class="collapse navbar-collapse navbar-right navbar-main-collapse">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="/admin">${username}</a></li>
					<li><a class="page-scroll" href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
		<!-- /.container -->
	</nav>
	<!-- .nav -->
</header>