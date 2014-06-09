<%@include file="header.jsp"%>
<%@ page import="java.util.List" %>

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


    <!-- Jumbotron -->
    <div class="jumbotron">

        <p align="center"><a href="http://isa-tools.github.io/stato/"> <img src="https://raw.github.com/ISA-tools/stato/dev/images/stato-logo-1.png" alt="STATO Logo" height="200" width="400"/></a></p>
        <p class="lead" align="center"><strong>STATO</strong> is a <strong>general-purpose STATistics Ontology</strong> that aims to provide coverage for processes such as statistical tests, </p>
        <p class="lead" align="center">their conditions of applications, and information needed or resulting from statistical methods,</p>
        <p class="lead" align="center">such as probability distributions, variable, spread and variation metrics. </p>
        <p class="lead" align="center"><strong>STATO</strong> also covers aspects of experimental design and description of plots and graphical representations</p>
        <p class="lead" align="center">commonly used to provide visual cues of data distribution or layout and to assist review of the results.</p>

        <p class="lead" align="center">
        For more information about STATO, please visit the <a href="http://isa-tools.github.io/stato/">STATO website</a>.
        </p>

        <p class="lead" align="center">
        This web application is a demonstration on some of the STATO elements, shown by running queries over the ontology. We show natural language queries and their counterparts written in description logics, relying on Manchester OWL syntax.
        </p>


        <p align="center"><a class="btn btn-large btn-success" href="queryForm.jsp">Check the STATO queries demo</a></p>
    </div>

<%@include file="footer.jsp"%>

