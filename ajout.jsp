<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modele.Task" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mes Tâches</title>
</head>
<body>
    <h1>Liste des Tâches</h1>

    <%
        List<Task> taches = (List<Task>) session.getAttribute("taches");
        if (taches == null || taches.isEmpty()) {
    %>
        <p>Aucune tâche pour le moment.</p>
    <%
        } else {
            for (int i = 0; i < taches.size(); i++) {
                Task t = taches.get(i);
    %>
        <div style="border:1px solid #ccc; padding:10px; margin:10px;">
            <strong>Titre :</strong> <%= t.getTitle() %><br>
            <strong>Description :</strong> <%= t.getDescription() %><br>
            <strong>Date d’échéance :</strong> <%= t.getDueDate() %><br>
            <strong>Statut :</strong> <%= t.isDone() ? "✔ Terminée" : "⏳ En cours" %><br>

            <!-- Liens pour actions -->
            <a href="supprimer.jsp?index=<%= i %>">❌ Supprimer</a> |
            <% if (!t.isDone()) { %>
                <a href="terminer.jsp?index=<%= i %>">✅ Marquer comme terminée</a>
            <% } %>
        </div>
    <%
            }
        }
    %>

    <br>
    <a href="ajouter.jsp">➕ Ajouter une nouvelle tâche</a> |
    <a href="index.jsp">🏠 Accueil</a>
</body>
</html>
