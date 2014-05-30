<%@include file="header.jsp"%>
<%@ page import="org.isatools.stato.STATOQueries" %>


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
                            <li class="active"><a href="index.jsp">Home</a></li>
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
                            <li><a href="contact.jsp">Contact</a></li>
                            <li><a href="about.jsp">About</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>STATO Query Demo</h1>
        <p class="lead">The STATO Query Demo was developed to demonstrate how the <a href="http://isa-tools.github.io/stato">STATistics Ontology</a> can be used to answer queries about common knowledge on statistics.</p>
        <a class="btn btn-large btn-success" href="queryForm.jsp">Check the STATO queries demo</a>
    </div>


    <!-- #about-section -->
    <section id="about-section">
        <div class="container">
            <div class="row clearfix">
                <div class="col-lg-12">
                    <h1 class="section-title">This is Who <span>We Are</span></h1>
                    <h2 class="section-subtitle"><span style="font-family: 'Lobster', 'cursive'; color:#5f5f5f;">STATO</span> started out to provide semantic coverage for processes such as statistical tests, their conditions of applications, and information needed or resulting from statistical methods, such as probability distributions, variable, spread and variation metrics.</h2>
                </div>
            </div>
        </div>
        <div class="team-container">
            <div class="container">
                <div class="row clearfix">
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/orlaith.jpg" alt=""></div>
                        <h3 class="team-title">Orlaith Burke</h3>
                       <!-- <h3 class="team-subtitle">Co-Founder &amp; Lead Product Manager</h3>-->
                    </div>
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/alejandra.jpg" alt=""></div>
                        <h3 class="team-title">Alejandra Gonzalez-Beltran</h3>
                        <!--<h3 class="team-subtitle">Co-Founder &amp; Lead Operations Manager</h3>-->
                    </div>
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/philippe.jpg" alt=""></div>
                        <h3 class="team-title">Philippe Rocca-Serra</h3>
                        <!--<h3 class="team-subtitle">Co-Founder &amp; Lead Software Developer</h3>-->
                    </div>
                    <div class="team-user team-image-box col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="text-center square"><img class="image-circle" src="assets/img/susanna.jpg" alt=""></div>
                        <h3 class="team-title">Susanna-Assunta Sansone</h3>
                        <!--<h3 class="team-subtitle">Co-Founder &amp; Lead Software Developer</h3>-->
                    </div>
                </div>
            </div>
        </div>
        <!--
        <div class="about-us-info">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <h4><i class="fa fa-rocket"></i> Our Mission</h4>
                        <p>To create a new standard for mentor/mentee relationship networking by developing a space which eases the process of finding and maintaining meaningful and relevant mentorship connections.</p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                        <h4><i class="fa fa-thumbs-up"></i> Our Background</h4>
                        <p>We are three technical co-founders with backgrounds in Computer Science, Math, and Economics. We met in school where we spent countless hours working together on CS projects. <a target="_blank" href="https://medium.com/hackers-and-hacking/69d50a60ac78">Learn more!</a> </p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-6 col-lg-6">
                        <h4><i class="fa fa-chevron-circle-right"></i> Our Focus</h4>
                        <ul id="skills">
                            <li><span title="100"></span>
                                <p>Developing MentorCube! <strong>100%</strong></p>
                            </li>
                            <li><span title="100"></span>
                                <p>Keeping our users happy! <strong>100%</strong></p>
                            </li>
                            <li><span title="100"></span>
                                <p>Having Fun! <strong>100%</strong></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        -->
    </section>
    <!-- /#about-section -->



<%@include file="footer.jsp"%>