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
                                       <li class="dropdown-header">Grid View</li>
                                       <%
                                           List<String> queryTypeList = queryInfo.getQueryTypes();
                                           List<String> queryTypeStringList = queryInfo.getQueryStringTypes();

                                           for(int i=0; i < queryTypeList.size(); i++){
                                       %>
                                       <li><a href="gridQueryForm.jsp?queryType=<%=queryTypeList.get(i)%>"><%=queryTypeStringList.get(i)%> demo queries</a></li>
                                       <%
                                           }
                                       %>
                                       <li class="divider"></li>
                                       <li class="dropdown-header">Carousel View</li>
                                       <%

                                           for(int i=0; i < queryTypeList.size(); i++){
                                       %>
                                       <li><a href="carouselQueryForm.jsp?queryType=<%=queryTypeList.get(i)%>"><%=queryTypeStringList.get(i)%> demo queries</a></li>
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


        <p class="lead" align="center">STATO is a <strong>general-purpose STATistics Ontology</strong>. </p>
        <p class="lead" align="center">Its aim is to provide coverage for processes such as <strong>statistical tests</strong>, their <strong>conditions of application</strong>, </p>
        <p class="lead" align="center">and information needed or resulting from statistical methods, such as <strong>probability distributions</strong>, <strong>variables</strong>, <strong>spread and variation metrics</strong>.</p>
        <p class="lead" align="center">STATO also covers aspects of <strong>experimental design</strong> and description of <strong>plots and graphical representations</strong></p>
        <p class="lead" align="center">commonly used to provide visual cues of data distribution or layout and to assist review of the results.</p>

<!--
        <p class="lead" align="center"><strong>STATO</strong> is a <strong>general-purpose STATistics Ontology</strong> that aims to provide coverage for processes such as statistical tests, </p>
        <p class="lead" align="center">their conditions of applications, and information needed or resulting from statistical methods,</p>
        <p class="lead" align="center">such as probability distributions, variable, spread and variation metrics. </p>
        <p class="lead" align="center"><strong>STATO</strong> also covers aspects of experimental design and description of plots and graphical representations</p>
        <p class="lead" align="center">commonly used to provide visual cues of data distribution or layout and to assist review of the results.</p>

        <p class="lead" align="center">For more information about STATO, please visit the <a href="http://isa-tools.github.io/stato/">STATO website</a>.</p>

        <p class="lead" align="center">This web application is a <strong>demonstration on some of the STATO elements</strong>, shown by running queries over the ontology. </p>
        <p class="lead" align="center">We show natural language queries and their counterparts written in description logics, relying on <a href="http://www.w3.org/TR/owl2-manchester-syntax/">Manchester OWL syntax</a>.</p>

        <p align="center"><a class="btn btn-large btn-success" href="carouselQueryForm.jsp">Check the STATO queries demo</a></p>

        -->
    </div>


<div class="bs-docs-featurette">
    <div class="container">
        <h2 class="bs-docs-featurette-title" algin="center">Background: rationale and community</h2>

        <p class="lead">The STATO project tarted in early 2012, as part of the requirement of the <strong>community-driven <a href="http://isacommons.org">ISA Commons</a></strong> to represent data matrices and their statistical values, </p>
        <p class="lead">STATO is a standalone projects since Nov 2012. STATO is driven and funded by several ISA-based projects and their user community, but also by collaborations with <strong>data publication platforms</strong>.</p>
        <p class="lead">STATO is applicable to, but not limited, the broad life, natural and biomedical science domain with <strong>documented applications</strong> for factorial design, association studies, </p>
        <p class="lead">differential expression, hit selection and meta-analysis.</p>

        <p class="lead" align="center">STATO also benefits from: <p>

        <ol>
        <li class="lead"><strong>extensive documentation</strong> with the provision of textual and formal definitions; </li>
        <li class="lead">an <strong>associated R code snippets</strong> using the dedicated R-command metadata tag, aiming at facilitating teaching and learning while relying of the popular R language;</li>
        <li class="lead"><strong>query examples</strong> documentation, highlighting how the ontology can be harnessed for reviewers/tutors/student alike.</li>
        </ol>

    </div>
</div>

<%@include file="footer.jsp"%>

