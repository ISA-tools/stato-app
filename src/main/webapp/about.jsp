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
                            <li><a href="queries.jsp">Contact</a></li>
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
                            <li class="active"><a href="about.jsp">About</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>STATO Query Demo</h1>
        <p class="lead">The STATO Query Demo was developed to demonstrate how the STATistics Ontology can be used to answer queries about common knowledge on statistics.</p>
        <a class="btn btn-large btn-success" href="queryForm.jsp">Check the STATO queries demo</a>
    </div>

<%@include file="footer.jsp"%>