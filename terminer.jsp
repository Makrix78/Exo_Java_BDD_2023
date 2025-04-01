<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches != null && index >= 0 && index < taches.size()) {
        Task t = taches.get(index);
        t.setDone(true);
    }
    response.sendRedirect("taches.jsp");
%>
