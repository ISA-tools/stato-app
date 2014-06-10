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

        <div class="btn-group-wrap">
            <div class="btn-group" data-toggle="buttons" data-toggle-default-class="btn-default">
                <label class="btn btn-xs btn-default" data-toggle-class="btn-primary">
                    <input type="radio" name="status" value="1" id="status-published" />
                    Carousel View
                </label>
                <label class="btn btn-xs btn-primary active" data-toggle-class="btn-primary">
                    <input type="radio" name="status" value="0" id="status-draft" checked />
                    Grid View
                </label>
            </div>
        </div>


        <!-- Three columns of text below the carousel -->
        <div class="row">

            <div class="col-lg-4">
                <span class="glyphicon icon-asterisk"></span>
                <h2 class="highlight">All demo queries</h2>
                <p>STATO helps answer queries about tests, plots, measures and designs.</p>
                <a class="btn btn-large btn-warning" href="queryForm.jsp?queryType=all">Ask STATO</a>
            </div>
            <!-- /.col-lg-4 -->

            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <!--<img class="img-circle" data-src="holder.js/140x140" alt="Generic placeholder image">-->
                <span class="icon-large icon-pen"></span>
                <h2 class="highlight"><%=queryInfo.getQueryTypeString(0)%></h2>
                <p><%=queryInfo.getQueryTypeDescription(0)%></p>
                <a class="btn btn-large btn-warning" href="queryForm.jsp?queryType=<%=queryInfo.getQueryType(0)%>">Ask STATO about <%=queryInfo.getQueryType(0)%></a>
            </div>
            <!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <span class="icon-large icon-ruller"></span>
                <h2 class="highlight"><%=queryInfo.getQueryTypeString(1)%></h2>
                <p><%=queryInfo.getQueryTypeDescription(1)%></p>
                <a class="btn btn-large btn-warning" href="queryForm.jsp?queryType=<%=queryInfo.getQueryType(1)%>">Ask STATO about <%=queryInfo.getQueryType(1)%></a>
            </div>

    </div>

        <div class="row">

            <div class="col-lg-4">

            </div>

            <div class="col-lg-4">
                <span class="icon-large icon-stats"></span>
                <h2 class="highlight"><%=queryInfo.getQueryTypeString(2)%></h2>
                <p><%=queryInfo.getQueryTypeDescription(2)%></p>
                <a class="btn btn-large btn-warning" href="queryForm.jsp?queryType=<%=queryInfo.getQueryType(2)%>">Ask STATO about <%=queryInfo.getQueryType(2)%></a>
            </div>
            <!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <span class="glyphicon glyphicon-stats"></span>
                <h2 class="highlight"><%=queryInfo.getQueryTypeString(3)%></h2>
                <p><%=queryInfo.getQueryTypeDescription(3)%></p>
                <a class="btn btn-large btn-warning" href="queryForm.jsp?queryType=<%=queryInfo.getQueryType(3)%>">Ask STATO about <%=queryInfo.getQueryType(3)%></a>
            </div>

            </div>

        </div>
        <!-- /.row -->




<%@include file="footer.jsp" %>