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
                        <a class="navbar-brand" href="index.jsp">STATO</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active" class="dropdown">
                                <a href="queryCases.jsp" class="dropdown-toggle" data-toggle="dropdown">Query cases <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="queryCases.jsp">Query cases by type</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Grid View</li>
                                    <%
                                        List<String> queryTypeList = queryInfo.getQueryTypes();
                                        List<String> queryTypeStringList = queryInfo.getQueryStringTypes();

                                        for(int i=0; i < queryTypeList.size(); i++){
                                    %>
                                    <li><a href="gridQueryForm.jsp?queryType=<%=queryTypeList.get(i)%>"><%=queryTypeStringList.get(i)%> query cases</a></li>
                                    <%
                                        }
                                    %>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Carousel View</li>
                                    <%

                                        for(int i=0; i < queryTypeList.size(); i++){
                                    %>
                                    <li><a href="carouselQueryForm.jsp?queryType=<%=queryTypeList.get(i)%>"><%=queryTypeStringList.get(i)%> query cases</a></li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </li>
                            <li><a href="useCases.jsp">Use Cases</a></li>
                            <li><a href="contact.jsp">Contact and Support</a></li>
                            <li><a href="about.jsp">Acknowledgements</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="jumbotron">
        <h2 align="center">Use Cases</h2>

        <p class="lead">STATO is being used in a variety of projects.</p>

        <p class="lead">We list below some of the STATO use cases we are aware of. If you are using STATO, please <a href="contact.jsp">let us know</a>.</p>
    </div>

    <hr>


    <div class="container marketing">
    <h2>Term Enrichment Protocol</h2>

    <p class="lead">The Term Enrichment Protocol project has been proposed by the Gene Ontology Consortium for gene set / term enrichment tools. It involves the definition of a REST API and JSON payload for term enrichment services. The project's documentation is maintained in a GitHub repository. The services rely on STATO for the statistical annotations.</p>

        <div class="row">
            <div class="inner">

                <div class="col-md-8" >
                    <a id="banner" href="https://github.com/cmungall/term-enrichment-protocol">View the Term Enrichment Protocol on GitHub</a>
                </div>

            </div>

        </div>


    </div>

    <hr>

    <div class="container marketing">
        <h2>NeuroImaging Data Sharing Data Model (NI-DM)</h2>

        <p class="lead">The NeuroImaging Data Model is being developed by the ICNF Neuroimaging Data Sharing (NIDASH) Task Force to describe neuroimaging data and provenance.</p>

        <p class="lead">NIDASH is using STATO for statistical terms.</p>

        <div class="row">
            <div class="inner">

                <div class="col-md-8" >
                    <a id="banner" href="http://nidm.nidash.org">View the NIDASH Data Model website</a>
                </div>

            </div>

        </div>


    </div>

    <hr>

    <div class="container marketing">
        <h2>GigaScience reproducibility study</h2>

        <p class="lead">In collaboration with the GigaScience journal, the SOAPdenovo2 de novo genome assembler was used in a reproducibility study aimed at exploring how existing data models (ISA, research objects and nanopublications) together with workflow enactment engines can help assess, record and preserve scientific workflows and associated findings.</p>

        <p class="lead">STATO was used in this case study to annotate nanopublications with terms such as 'fold change', indicating also its numerator and denominator.</p>

        <div class="row">
            <div class="inner">

                <div class="col-md-8" >
                    <a id="banner" href="http://isa-tools.github.io/soapdenovo2/">View the SOAPdenovo2 case study on GitHub</a>
                </div>

            </div>

        </div>


    </div>



<%@include file="footer.jsp" %>