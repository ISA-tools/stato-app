<%@ page import="java.util.List" %>
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
                        <a class="navbar-brand" href="index.jsp">STATO-APP</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active" class="dropdown">
                                <a href="queries.jsp" class="dropdown-toggle" data-toggle="dropdown">Demo Queries <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="queries.jsp">Demo queries by type</a></li>
                                    <li class="divider"></li>
                                    <%
                                        List<String> queryTypeList = queryInfo.getQueryTypes();
                                        List<String> queryTypeStringList = queryInfo.getQueryStringTypes();

                                        for(int i=0; i < queryTypeList.size(); i++){
                                    %>
                                    <li><a href="queryForm.jsp?queryType=<%=queryTypeList.get(i)%>"><%=queryTypeStringList.get(i)%> demo queries</a></li>
                                    <%
                                        }
                                    %>
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


    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">

            <div class="col-lg-4">
                <span class="glyphicon icon-asterisk"></span>
                <h2>All demo queries</h2>
                <p>STATO helps answer queries about tests, plots, measures and designs.</p>
                <a class="btn btn-large btn-success" href="queryForm.jsp?queryType=all">Ask STATO</a>
            </div>
            <!-- /.col-lg-4 -->

            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <!--<img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">-->
                <span class="icon-large icon-pen"></span>
                <h2>Study Designs</h2>

                <p>STATO and study designs</p>
                <!--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p> -->
                <a class="btn btn-large btn-success" href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_DESIGNS%>">Ask STATO about designs</a>
            </div>
            <!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <span class="icon-large icon-ruller"></span>
                <h2>Statistical Measures</h2>
                <p>STATO and statistical measures</p>
                <a class="btn btn-large btn-success" href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_MEASURES%>">Ask STATO about measures</a>
            </div>

    </div>

        <div class="row">

            <div class="col-lg-4">

            </div>

            <div class="col-lg-4">
                <span class="icon-large icon-stats"></span>
                <h2>Statistical Tests</h2>
                <p>STATO maintains information about statistical tests and their conditions of application. We show some
                    query examples about statistical tests.</p>
                <a class="btn btn-large btn-success" href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_TESTS%>">Ask STATO about tests</a>
            </div>
            <!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <span class="glyphicon glyphicon-stats"></span>
                <h2>Statistical Plots</h2>
                <p>STATO defines a vocabulary of statistical plots and their relationships with tests and their
                    applications</p>
                <a class="btn btn-large btn-success" href="queryForm.jsp?queryType=<%=STATOQueries.QUERY_PLOTS%>">Ask STATO about plots</a>
            </div>

            </div>

        </div>
        <!-- /.row -->




<%@include file="footer.jsp" %>