<%@include file="header.jsp" %>

<%@page info="stato-app"%>

<%@ page import="java.io.File"%>
<%@ page import="java.util.List" %>
<%@ page import="org.isatools.stato.STATOQueryDemo"%>
<%@ page import="org.isatools.stato.STATOResult"%>


<%
    String queryType = request.getParameter("queryType");

    int start =0 , end=0;

    STATOQueryDemo statoQueryDemo = (STATOQueryDemo) context.getAttribute("statoQueryDemo");

    if (statoQueryDemo==null){
        String jspPath = session.getServletContext().getRealPath("/");
        String statoFilePath = jspPath+ "stato.owl";
        File statoFile = new File(statoFilePath);
        statoQueryDemo = new STATOQueryDemo(statoFile);
        context.setAttribute("statoQueryDemo", statoQueryDemo);
    }

    if (queryType==null){
        queryType = QueryInfo.QUERY_TYPE_ALL;
    }

    int index = queryInfo.getIndexForQueryType(queryType);
    start = queryInfo.getStart(index);
    end = queryInfo.getEnd(index);

    String queryNumberString = request.getParameter("hiddenButton");

    int queryNumber = start;

    if (queryNumberString!=null && !queryNumberString.equals("")){
        queryNumber = (new Integer(queryNumberString)).intValue();
    }

%>

<form method=post action="gridQueryForm.jsp?queryType=<%=queryType%>" name=gridQueryForm>


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

        <ul class="list">

<%

            for(int j = start; j <= end; j++){
                String queryString= queryInfo.getQueryString(j);
%>
        <!--<div class="clearfix"></div>-->
        <div class="query-item" align="center">


            <div class="query-item-info">

                <span class="counter counter-orange"><%=j+1%></span>
                <div class="query-name">
                    <span style="font-size: 1.0em"><%=queryString%></span><br/>

                </div>

            </div>


            <div class="search-item-block" style="margin-top: 15px; margin-bottom: 10px">


                <div class="search-item-details" >

                    <input type="hidden" id="hiddenButton" name="hiddenButton">

                    <button id="askButton_<%=j%>" class="btn btn-success has-spinner" style="width:150px" onclick="askSTATOgrid('<%=j%>')">
                        Ask STATO
                        <span class="spinner"><i class="icon-spin icon-refresh"></i></span>
                    </button>

                </div>


            </div>

        </div>

            <%
                }

            %>


        </ul>


        <!--
                <div class="clearfix"></div>

            <ul class="list">
                <div class="query-item" align="center">


                <div class="query-item-info">
                    <a class="query-name" href="/biodbcore-000144">

                        <img src="" width="30px"/><br/><br/>

                        <span style="font-weight: bolder; font-size: 1.3em">Stem Cell Discovery Engine</span><br/>

                    </a>
                </div>

                <div class="search-item-block" style="margin-top: 15px; margin-bottom: 10px">

                    <div class="search-item-details" >

                        Standards
                                 <span class="counter counter-blue">                                        14</span>
                    </div>


                    <div class="clearfix"></div>
                    <div class="search-item-details">
                        <div class="bio-icon-publication pull-left" style="font-size: 1.9em"></div>
                        <div class="pull-left" style="margin-top: 4px">Publications</div>

                        <span class="counter  counter-green">1</span>
                    </div>


                </div>
                </div>


                <div class="clearfix"></div>

                <div class="query-item" align="center">


                    <div class="query-item-info">
                        <a class="query-name" href="/biodbcore-000144">

                            <img src="" width="30px"/><br/><br/>

                            <span style="font-weight: bolder; font-size: 1.3em">Stem Cell Discovery Engine</span><br/>

                        </a>
                    </div>

                    <div class="search-item-block" style="margin-top: 15px; margin-bottom: 10px">

                        <div class="search-item-details" >

                            Standards
                            <span class="counter counter-blue">                                        14</span>
                        </div>


                        <div class="clearfix"></div>
                        <div class="search-item-details">
                            <div class="bio-icon-publication pull-left" style="font-size: 1.9em"></div>
                            <div class="pull-left" style="margin-top: 4px">Publications</div>

                            <span class="counter  counter-green">1</span>
                        </div>


                    </div>
                </div>


            </ul>

            -->

        <!--

        <div class="list-group">
            <a href="#" class="list-group-item active">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">...</p>
            </a>
        </div>

        <div class="list-group">
            <a href="#" class="list-group-item ">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">...</p>
            </a>
        </div>
   -->
    </div>
</form>


<%@include file="footer.jsp" %>


