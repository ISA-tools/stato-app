<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
Enumeration<String> parameterNames = request.getParameterNames();

while(parameterNames.hasMoreElements()){
    String next = parameterNames.nextElement();

}

String view = request.getParameter("view");
String queryType = request.getParameter("queryType");

String redirectURL = null;

if (view.equals("grid-view")) {
    redirectURL="gridQueryForm.jsp";
} else if (view.equals("carousel-view")){
    redirectURL="queryForm.jsp";
}

redirectURL = redirectURL+"?queryType="+queryType;
response.sendRedirect(redirectURL);

%>