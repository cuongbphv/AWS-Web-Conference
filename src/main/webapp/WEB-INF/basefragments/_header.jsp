  <%@ page contentType="text/html; charset=UTF-8" %>
    <header class="header">
        <!-- Navigation -->
        <nav class="navbar sticky-nav main-menu" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><img src="img/logo.png" alt="No image"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden"><a href="#page-top"></a></li>
                        <li><a href="/default?id=1">Home</a></li>
                        <div class="dropdown">
                            <li><a class="dropbtn" href="/default?id=2">About</a></li>
                            <div class="dropdown-content">
                                <a href="/default?id=6">ICSSE</a>
                                <a href="/default?id=7">HCMUTE</a>
                            </div>
                        </div>
                        <li><a href="/default?id=3">Program</a></li>
                        <li><a href="/default?id=4">Venue & Hotel</a></li>
                        <li><a href="/default?id=5">Contact</a></li>
                        <li style="float:right; font-size:17px;"><a href="/admin"><u>${currentUser }</u></a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- .nav -->

    </header>
