<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="TaskDefinition.jspf" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>

<h1>Mes Tâches</h1>

<%
    // 🗑 Supprimer une tâche si ?supprimer=0
    String supprimerParam = request.getParameter("supprimer");
    if (supprimerParam != null) {
        try {
            int index = Integer.parseInt(supprimerParam);
            List taches = (List) session.getAttribute("taches");
            if (taches != null && index >= 0 && index < taches.size()) {
                taches.remove(index);
            }
        } catch (Exception e) {
            out.println("<p>Erreur de suppression : " + e.getMessage() + "</p>");
        }
    }

    // ✅ Marquer une tâche comme terminée si ?terminer=1
    String terminerParam = request.getParameter("terminer");
    if (terminerParam != null) {
        try {
            int index = Integer.parseInt(terminerParam);
            List taches = (List) session.getAttribute("taches");
            if (taches != null && index >= 0 && index < taches.size()) {
                Object element = taches.get(index);
                if (element instanceof Task) {
                    Task t = (Task) element;
                    t.setDone(true);
                }
            }
        } catch (Exception e) {
            out.println("<p>Erreur de validation : " + e.getMessage() + "</p>");
        }
    }

    // 📝 Affichage
    Object obj = session.getAttribute("taches");

    if (obj == null || !(obj instanceof List)) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    } else {
        List taches = (List) obj;

        out.println("<p>Nombre de tâches : " + taches.size() + "</p>");

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

        <% if (!t.isDone()) { %>
            <a href="taches.jsp?terminer=<%= i %>">✅ Marquer comme terminée</a> |
        <% } %>
        <a href="taches.jsp?supprimer=<%= i %>">🗑 Supprimer</a>
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
