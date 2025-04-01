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
    int index = Integer.parseInt(request.getParameter("index"));
    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches != null && index >= 0 && index < taches.size()) {
        Task t = taches.get(index);
        t.setDone(true);
    }
    response.sendRedirect("taches.jsp");
%>
