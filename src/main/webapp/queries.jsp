<%@include file="header.jsp" %>


<div class="container">
    <div class="navbar-wrapper">
        <div class="container">

            <div class="navbar navbar-inverse navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">STATO-APP</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                            <!--<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li> -->
                            <li><a href="queries.jsp">Demo Queries</a></li>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="carousel slide" data-ride="carousel" id="carousel-example-generic">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="img1.jpg" class="img-responsive" />
        </div>
        <div class="item">
            <img src="img2.jpg" class="img-responsive" />
        </div>
    </div>

    <!-- Controls -->
    <a class="carousel-control left" href="#carousel-example-generic" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="carousel-control right" href="#carousel-example-generic" data-slide="next">
        <span class="icon-next"></span>
    </a>

</div>

<!-- /.carousel -->


<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

            <h2>Statistical Tests</h2>

            <p>STATO maintains information about statistical tests and their conditions of application. We show some
                query examples about statistical tests.</p>
            <!--<p><a class="btn btn-default" href="#" role="button">ASK STATO &raquo;</a></p>-->
            <a class="btn btn-large btn-success" href="queries.jsp">ASK STATO</a>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

            <h2>Statistical Plots</h2>

            <p>STATO defines a vocabulary of statistical plots and their relationships with tests and their
                applications</p>
            <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
            <a class="btn btn-large btn-success" href="queries.jsp">ASK STATO</a>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

            <h2>Statistical Measures</h2>

            <p>STATO and statistical measures</p>
            <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
            <a class="btn btn-large btn-success" href="queries.jsp">ASK STATO</a>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

            <h2>Study Designs</h2>

            <p>STATO and study designs</p>
            <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
            <a class="btn btn-large btn-success" href="queries.jsp">ASK STATO</a>
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
</div>


<%@include file="footer.jsp" %>