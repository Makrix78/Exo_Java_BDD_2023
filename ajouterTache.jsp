<%@ page import="java.util.*, modele.Task" %>
<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    Task task = new Task(title, description);

    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        session.setAttribute("taches", taches);
    }
    taches.add(task);

    response.sendRedirect("taches.jsp");
%>
