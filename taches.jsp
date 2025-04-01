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
    // 🗑 Gestion de la suppression
    String deleteParam = request.getParameter("deleteIndex");
    if (deleteParam != null) {
        try {
            int index = Integer.parseInt(deleteParam);
            Object obj = session.getAttribute("taches");
            if (obj instanceof List) {
                List taches = (List) obj;
                if (index >= 0 && index < taches.size()) {
                    taches.remove(index);
                }
            }
        } catch (Exception e) {
            out.println("<p>Erreur de suppression : " + e.getMessage() + "</p>");
        }
    }

    // ✅ Gestion du marquage comme terminé
    String doneParam = request.getParameter("doneIndex");
    if (doneParam != null) {
        try {
            int index = Integer.parseInt(doneParam);
            Object obj = session.getAttribute("taches");
            if (obj instanceof List) {
                List taches = (List) obj;
                if (index >= 0 && index < taches.size()) {
                    Task t = (Task) taches.get(index);
                    t.setDone(true);
                }
            }
        } catch (Exception e) {
            out.println("<p>Erreur de validation : " + e.getMessage() + "</p>");
        }
    }

    // 📝 Affichage des tâches
    Object obj = session.getAttribute("taches");

    if (obj == null || !(obj instanceof List)) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    } else {
        List taches = (List) obj;
        out.println("<p>Nombre de tâches : " + taches.size() + "</p>");

        for (int i = 0; i < taches.size(); i++) {
            Task t = (Task) taches.get(i);
%>
    <div style="border:1px solid #ccc; margin:10px; padding:10px;">
        <strong>Titre :</strong> <%= t.getTitle() %><br>
        <strong>Description :</strong> <%= t.getDescription() %><br>
        <strong>Date d’échéance :</strong> <%= t.getDueDate() %><br>
        <strong>Statut :</strong> <%= t.isDone() ? "✔ Terminée" : "⏳ En cours" %><br>

        <!-- ✅ Formulaire pour marquer comme terminée -->
        <% if (!t.isDone()) { %>
        <form method="post" style="display:inline;">
            <input type="hidden" name="doneIndex" value="<%= i %>">
            <button type="submit">✅ Terminer</button>
        </form>
        <% } %>

        <!-- 🗑 Formulaire pour suppression -->
        <form method="post" style="display:inline;">
            <input type="hidden" name="deleteIndex" value="<%= i %>">
            <button type="submit">🗑 Supprimer</button>
        </form>
    </div>
<%
        }
    }
%>

<br>
<a href="ajouter.jsp">➕ Ajouter une tâche</a>

</body>
</html>
