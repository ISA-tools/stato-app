<%@include file="header.jsp" %>

<%@ page import="java.util.*" %>
<%@ page import="org.isatools.stato.STATOQueries" %>
<%@ page import="org.isatools.stato.STATOQueryDemo" %>
<%@ page import="java.io.File" %>
<%@ page import="org.semanticweb.owlapi.model.IRI" %>
<%@ page import="com.sun.tools.javac.util.Pair" %>
<%@ page import="org.isatools.stato.STATOResult" %>

<form method=post action="queryForm.jsp" name=queryForm>

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
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active" class="dropdown">
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


<%
String queryType = request.getParameter("queryType");

int start =0 , end=0;
STATOQueryDemo statoQueryDemo = (STATOQueryDemo) session.getAttribute("statoQueryDemo");

if (statoQueryDemo==null){
    String jspPath = session.getServletContext().getRealPath("/");
    String statoFilePath = jspPath+ "stato.owl";
    File statoFile = new File(statoFilePath);
    statoQueryDemo = new STATOQueryDemo(statoFile);
    session.setAttribute("statoQueryDemo", statoQueryDemo);
    }

if (queryType==null){
    queryType = STATOQueries.QUERY_ALL;
}

if (queryType.equals(STATOQueries.QUERY_ALL)){
    start = STATOQueries.QUERY_ALL_START;
    end = STATOQueries.QUERY_ALL_END;
}else if (queryType.equals(STATOQueries.QUERY_TESTS)){
    start = STATOQueries.QUERY_TESTS_START;
    end = STATOQueries.QUERY_TESTS_END;
}else if (queryType.equals(STATOQueries.QUERY_PLOTS)){
    start = STATOQueries.QUERY_PLOTS_START;
    end = STATOQueries.QUERY_PLOTS_END;
}else if (queryType.equals(STATOQueries.QUERY_DESIGN)){
    start = STATOQueries.QUERY_DESIGN_START;
    end = STATOQueries.QUERY_DESIGN_END;
} else if (queryType.equals(STATOQueries.QUERY_MEASURES)){
    start = STATOQueries.QUERY_MEASURES_START;
    end = STATOQueries.QUERY_MEASURES_END;
}

String queryNumberString = request.getParameter("hiddenButton");

int queryNumber = start;

if (queryNumberString!=null && !queryNumberString.equals("")){
    queryNumber = (new Integer(queryNumberString)).intValue();
}

%>

<div class="carousel slide carousel-fade" data-ride="carousel" id="myCarousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <%
            for(int j = start; j <= end; j++){
                String queryString= STATOQueries.QUERY_STRING[j];
        %>
        <li data-target="#myCarousel" data-slide-to="<%=j%>" <%= (j==queryNumber)? "class=\"active\"": "" %> ></li>
        <%
            }//for
        %>
    </ol>


    <!-- Wrapper for slides -->
    <div class="carousel-inner">

        <%

            for(int j = start; j <= end; j++){
                String queryString= STATOQueries.QUERY_STRING[j];
        %>
              <div class="item <%= (j==queryNumber)? "active": "" %> ">
                  <div class="carousel-caption">
                      <h2><%= queryString %></h2>

        <%

           //queryNumberString is null, means that the 'Ask STATO' button was never pressed
            if (queryNumberString==null || queryNumber!=j){
             %>
                      <p>
                          <input type="hidden" id="hiddenButton" name="hiddenButton">
                          <%--<a id="ask" class="btn btn-lg btn-success has-spinner" href="queryForm.jsp?queryType=<%=queryType%>&queryNumber=<%=j%>">--%>

                          <!--<input type="button" name="ask" class="btn btn-success has-spinner" value="Ask STATO" style="width:150px" onclick="askSTATO()"/>-->
                          <button id="askButton_<%=j%>" class="btn btn-success has-spinner" style="width:150px" onclick="askSTATO('<%=j%>')">
                              Ask STATO
                              <span class="spinner"><i class="icon-spin icon-refresh"></i></span>
                          </button>

                      </p>
            <%

            //get the results
            }else{

                List<STATOResult> resultList = statoQueryDemo.getPrecomputedResults(STATOQueries.QUERY_DL[queryNumber]);
                if (queryNumber == j || resultList != null) {
                   if (resultList ==null)
                       resultList = statoQueryDemo.runDLQuery(STATOQueries.QUERY_DL[queryNumber]);

                    for(STATOResult statoResult: resultList){
                %>
                          <p>
                            <span title="<%=statoResult.getDefinition()%>">
                                <a class="result" href="http://bioportal.bioontology.org/ontologies/STATO/?p=classes&conceptid=<%=statoResult.getIRI()%>" target="_blank">
                                    <%=statoResult.getLabel()%>
                                </a>
                            </span>
                          </p>


                <%

                    } //for

                    %>
                      <br>
                      <h5 align="center">How STATO query answering works?</h5>
                      <h6 align="center">The results above are obtained by posing this expression to the <a href="bioportal.bioontology.org/ontologies/STATO">STATistics Ontology (STATO)</a>:</h6>
                      <h5 align="center"><strong><%=STATOQueries.QUERY_DL[queryNumber]%></strong></h5>

                      <%


                        }else { //if queryNumber != j

                            %>

                      <p>
                          <input type="hidden" id="hiddenButton" name="hiddenButton">
                          <%--<a id="ask" class="btn btn-lg btn-success has-spinner" href="queryForm.jsp?queryType=<%=queryType%>&queryNumber=<%=j%>">--%>

                          <!--<input type="button" name="ask" class="btn btn-success has-spinner" value="Ask STATO" style="width:150px" onclick="askSTATO()"/>-->
                          <button id="askButton" class="btn btn-success has-spinner" style="width:150px" onclick="askSTATO()">
                              Ask STATO
                              <span class="spinner"><i class="icon-spin icon-refresh"></i></span>
                          </button>

                      </p>

                            <%

                        }

                    } //else queryNumberString!=null

             %>
                </div>
            </div>

        <%
            } //for each of the slides
        %>

    </div>

    <!-- Controls -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>

    <div id="carouselButtons">
        <button id="playButton" type="button" class="btn btn-default btn-xs">
            <span class="glyphicon glyphicon-play"></span>
        </button>
        <button id="pauseButton" type="button" class="btn btn-default btn-xs">
            <span class="glyphicon glyphicon-pause"></span>
        </button>
    </div>

</div>

</form>
<!-- /.carousel -->

<%@include file="footer.jsp" %>
