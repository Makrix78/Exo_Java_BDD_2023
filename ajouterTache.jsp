<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    Task task = new Task(title, description, dueDate);

    Object obj = session.getAttribute("taches");
    List taches;

    if (obj == null || !(obj instanceof List)) {
        taches = new ArrayList();
        session.setAttribute("taches", taches);
    } else {
        taches = (List) obj;
    }

    taches.add(task);

    out.println("<p>Tâche ajoutée : " + task.getTitle() + "</p>");
    response.sendRedirect("taches.jsp");
%>
