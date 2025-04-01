<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches != null && index >= 0 && index < taches.size()) {
        taches.remove(index);
    }
    response.sendRedirect("taches.jsp");
%>
