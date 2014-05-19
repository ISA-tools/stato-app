<%@include file="header.jsp"%>


<div class="container">

    <div class="masthead">
        <h3 class="muted">STATO Demo Application</h3>
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="queryForm.jsp">STATO Queries</a></li>
                        <li><a href="downloads.jsp">Downloads</a></li>
                        <li class="active"><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div> <!-- /.navbar -->
    </div>


    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>STATO Query Demo</h1>
        <p class="lead">The STATO Query Demo was developed to demonstrate how the STATistics Ontology can be used to answer queries about common knowledge on statistics.</p>
        <a class="btn btn-large btn-success" href="queryForm.jsp">Check the STATO queries demo</a>
    </div>

<%@include file="footer.jsp"%>