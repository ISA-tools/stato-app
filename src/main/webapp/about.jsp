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
                <a class="navbar-brand" href="index.jsp">STATO</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="queries.jsp" class="dropdown-toggle" data-toggle="dropdown">Queries cases<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="queries.jsp">Query cases by type</a></li>
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
                    <li><a href="contact.jsp">Contact and Support</a></li>
                    <li class="active"><a href="about.jsp">About</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
</div>


    <div class="container marketing">
        <h3>About STATO</h3>
        <p class="lead">STATO started out to provide semantic coverage for processes such as statistical tests, their conditions of applications, and information needed or resulting from statistical methods, such as probability distributions, variable, spread and variation metrics.</p>
        <p class="lead">This website provides inforamation about STATO and demonstrates a set of query cases relying on STATO to answer queries about common knowledge on statistics.</p>

    </div>

   <hr>

    <div class="container marketing">
    <h3>Acknowledgements</h3>
        <p class="lead">STATO has been funded by grants to Dr Susanna-Assunta Sansone</p>

        <p class="lead">The STATO logos were designed by <a href="http://www.antarctic-design.co.uk/">Antarctic Design</a>.</p>

    </div>


<%@include file="footer.jsp"%>