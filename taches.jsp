<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, mypackage.Task" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>

<h1>Mes Tâches</h1>

<%
    List<Task> taches = (List<Task>) session.getAttribute("taches");

    if (taches == null || taches.isEmpty()) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    } else {
        for (int i = 0; i < taches.size(); i++) {
            Task t = taches.get(i);
%>
    <div style="border:1px solid #ccc; margin:10px; padding:10px;">
        <strong>Titre :</strong> <%= t.getTitle() %><br>
        <strong>Description :</strong> <%= t.getDescription() %><br>
        <strong>Date d’échéance :</strong> <%= t.getDueDate() %><br>
        <strong>Statut :</strong> <%= t.isDone() ? "✔ Terminée" : "⏳ En cours" %><br>

        <a href="terminer.jsp?index=<%= i %>">✅ Marquer comme terminée</a> |
        <a href="supprimer.jsp?index=<%= i %>">🗑 Supprimer</a>
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
