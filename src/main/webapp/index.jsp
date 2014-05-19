<%@include file="header.jsp"%>

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
                                <li><a href="queryForm.jsp">Demo Queries</a></li>

                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    <!-- Jumbotron -->
    <div class="jumbotron">

        <p align="center"><a href="http://isa-tools.github.io/stato/"> <img src="https://raw.github.com/ISA-tools/stato/dev/images/stato-logo-1.png" alt="STATO Logo" height="200" width="400"/></a></p>
        <p class="lead" align="center"><strong>STATO</strong> is a <strong>general-purpose STATistics Ontology</strong> processes such as statistical tests, </p>
        <p class="lead" align="center">their conditions of applications, and information needed or resulting from statistical methods,</p>
        <p class="lead" align="center">such as probability distributions, variable, spread and variation metrics. </p>
        <p class="lead" align="center"><strong>STATO</strong> also covers aspects of experimental design and description of plots and graphical representations</p>
        <p class="lead" align="center">commonly used to provide visual cues of data distribution or layout and to assist review of the results.</p>
        <p align="center"><a class="btn btn-large btn-success" href="queryForm.jsp">Check the STATO queries demo</a></p>
    </div>

<%@include file="footer.jsp"%>

