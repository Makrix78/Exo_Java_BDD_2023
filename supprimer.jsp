<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    Object obj = session.getAttribute("taches");

    if (obj instanceof List) {
        List taches = (List) obj;

        if (index >= 0 && index < taches.size()) {
            taches.remove(index);
        }
    }

    response.sendRedirect("taches.jsp");
%>
