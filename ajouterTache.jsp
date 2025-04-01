<%@ page import="java.util.*" %>
<%! 
    public class Task {
        private String title;
        private String description;
        private String dueDate;
        private boolean done;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.done = false;
        }

        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public String getDueDate() { return dueDate; }
        public boolean isDone() { return done; }
        public void setDone(boolean done) { this.done = done; }
    }
%>
<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    Task task = new Task(title, description, dueDate);

    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        session.setAttribute("taches", taches);
    }
    taches.add(task);

    response.sendRedirect("taches.jsp");
%>
