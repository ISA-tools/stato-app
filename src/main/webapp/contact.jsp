<%@include file="header.jsp"%>
<%@ page import="org.isatools.stato.STATOQueries" %>


<div class="container">

    <div class="navbar-wrapper">
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
                                <a class="navbar-brand" href="index.jsp">STATO-APP</a>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown">
                                        <a href="queries.jsp" class="dropdown-toggle" data-toggle="dropdown">Demo Queries <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="queries.jsp">Demo queries by type</a></li>
                                            <li class="divider"></li>
                                            <li><a href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_ALL%>">All demo queries</a></li>
                                            <li><a href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_TESTS%>">Statistical tests demo queries</a></li>
                                            <li><a href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_PLOTS%>">Statistical plots demo queries</a></li>
                                            <li><a href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_MEASURES%>">Statistical measures demo queries</a></li>
                                            <li><a href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_DESIGN%>">Study designs demo queries</a></li>
                                        </ul>
                                    </li>
                                    <li class="active"><a href="contact.jsp">Contact</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- #about-section -->
    <div class="jumbotron">

    <h3>Contact the STATO team</h3>

        <div class="team-container" align="center">
            <div class="container">
                <div class="row clearfix">

                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/alejandra.jpg" alt="Alejandra Gonzalez-Beltran"></div>
                        <h5 class="team-title">Alejandra Gonzalez-Beltran</h5>
                        <h5 class="team-subtitle">Senior Software Engineer, Oxford e-Research Centre, University of Oxford</h5>
                    </div>


                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/philippe.jpg" alt="Philippe Rocca-Serra"></div>
                        <h5 class="team-title">Philippe Rocca-Serra</h5>
                        <h5 class="team-subtitle">Technical Project Leader, Oxford e-Research Centre, University of Oxford</h5>
                    </div>

                </div>

                <div class="row clearfix">
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/orlaith.jpg" alt="Orlaith Burke"></div>
                        <h5 class="team-title">Orlaith Burke</h5>
                        <h5 class="team-subtitle">Senior Statistician, Nuffield Department of Population Health, University of Oxford</h5>
                    </div>
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/susanna.jpg" alt="Susanna-Assunta Sansone"></div>
                        <h5 class="team-title">Susanna-Assunta Sansone</h5>
                        <h5 class="team-subtitle">Associate Director, Oxford e-Research Centre, University of Oxford</h5>
                    </div>
                </div>
            </div>
        </div>
        </div>

    </section>
    <!-- /#about-section -->



<%@include file="footer.jsp"%>