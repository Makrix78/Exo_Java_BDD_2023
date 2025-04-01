<%@ page import="java.util.*, modele.Task" %>
<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate"); // 👈 récupère la date

    Task task = new Task(title, description, dueDate); // 👈 ajoute la date ici

    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        session.setAttribute("taches", taches);
    }
    taches.add(task);

    response.sendRedirect("taches.jsp");
%>
