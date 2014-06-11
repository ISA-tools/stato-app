<%@include file="header.jsp" %>

<%@page info="stato-app"%>

<%@ page import="java.io.File"%>
<%@ page import="java.util.List" %>
<%@ page import="org.isatools.stato.STATOQueryDemo"%>
<%@ page import="org.isatools.stato.STATOResult"%>


<%
    String queryType = request.getParameter("queryType");

    int start =0 , end=0;


    if (queryType==null){
        queryType = QueryInfo.QUERY_TYPE_ALL;
    }

    int index = queryInfo.getIndexForQueryType(queryType);
    start = queryInfo.getStart(index);
    end = queryInfo.getEnd(index);


%>

<form method=post action="gridQueryForm.jsp?queryType=queryType%>" name=gridQueryForm>


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


    <div class="container marketing">

        <ul class="list">

<%

            for(int j = start; j <= end; j++){
                String queryString= queryInfo.getQueryString(j);
%>

        <div class="query-item" align="center">


            <div class="query-item-info">

                <span class="counter counter-orange"><%=j-start+1%></span>
                <div class="query-name">
                    <span style="font-size: 1.0em"><%=queryString%></span><br/>

                </div>

            </div>


            <div class="search-item-block" style="margin-top: 15px; margin-bottom: 10px">

                <div class="search-item-details" >

                    <button type="button" id="askButton_<%=j%>" class="btn btn-default has-spinner :hover" style="width:150px" data-toggle="modal" data-target="#myModal_<%=j%>">
                        Ask STATO
                        <span class="spinner"><i class="icon-spin icon-refresh"></i></span>
                    </button>



                    <div class="modal fade" id="myModal_<%=j%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" data-remote='results.jsp?j=<%=j%>'>
                        <div class="modal-dialog">
                            <div class="modal-content">
                            </div>
                        </div>
                    </div>

                </div>


            </div>

        </div>

            <%
                }
            %>


        </ul>


    </div> <!--container -->




</form>


<%@include file="footer.jsp" %>

