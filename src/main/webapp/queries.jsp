<%@include file="header.jsp"%>


<div class="container">

    <div class="navbar-wrapper">
        <div class="container">

            <div class="navbar navbar-inverse navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">STATO-APP</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#">Home</a></li>
                            <li class="active"><a href="queries.jsp">Contact</a></li>
                            <!--
                            <li class="dropdown">
                               <a href="queryForm.jsp" class="dropdown-toggle" data-toggle="dropdown">Demo Queries <b class="caret"></b></a>
                               <ul class="dropdown-menu">
                                   <li><a href="#">All demo queries</a></li>
                                   <li><a href="#">Statistical tests demo queries</a></li>
                                   <li><a href="#">Statistical plots demo queries</a></li>
                                   <li><a href="#">Statistical measures demo queries</a></li>
                                   <li><a href="#">Study designs demo queries</a></li>
                               </ul>
                           </li>
                           -->
                            <li><a href="contact.jsp">Contact</a></li>
                            <li><a href="about.jsp">About</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">

            <div class="col-lg-4">
                <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

                <h2>All demo queries</h2>

                <p>STATO helps answer queries about tests, plots, measures and designs.</p>
                <!--<p><a class="btn btn-default" href="#" role="button">ASK STATO &raquo;</a></p>-->
                <a class="btn btn-large btn-success" href="queryForm.jsp">ASK STATO</a>
            </div>
            <!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

                <h2>Statistical Tests</h2>

                <p>STATO maintains information about statistical tests and their conditions of application. We show some
                    query examples about statistical tests.</p>
                <!--<p><a class="btn btn-default" href="#" role="button">ASK STATO &raquo;</a></p>-->
                <a class="btn btn-large btn-success" href="queryForm.jsp">ASK STATO</a>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

                <h2>Statistical Plots</h2>

                <p>STATO defines a vocabulary of statistical plots and their relationships with tests and their
                    applications</p>
                <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
                <a class="btn btn-large btn-success" href="queryForm.jsp">ASK STATO</a>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

                <h2>Statistical Measures</h2>

                <p>STATO and statistical measures</p>
                <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
                <a class="btn btn-large btn-success" href="queryForm.jsp">ASK STATO</a>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">

                <h2>Study Designs</h2>

                <p>STATO and study designs</p>
                <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
                <a class="btn btn-large btn-success" href="queryForm.jsp">ASK STATO</a>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>



<%@include file="footer.jsp" %>