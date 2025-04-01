<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>

<h1>Mes Tâches</h1>

<%
    Object obj = session.getAttribute("taches");

    if (obj == null || !(obj instanceof List)) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    } else {
        List taches = (List) obj;

        for (int i = 0; i < taches.size(); i++) {
            Object element = taches.get(i);
            if (element instanceof Task) {
                Task t = (Task) element;
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
    }
%>

<br>
<a href="ajouter.jsp">➕ Ajouter une tâche</a>

</body>
</html>
