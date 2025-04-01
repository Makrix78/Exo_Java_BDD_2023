<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h1>Ajouter une nouvelle tâche</h1>
    <form action="ajouterTache.jsp" method="post">
        <label for="title">Titre :</label>
        <input type="text" name="title" id="title" required><br><br>

        <label for="description">Description :</label><br>
        <textarea name="description" id="description" rows="4" cols="50" required></textarea><br><br>

        <label for="dueDate">Date d’échéance :</label>
        <input type="date" name="dueDate" id="dueDate" required><br><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <br>
    <a href="taches.jsp">📋 Voir les tâches</a>
</body>
</html>
