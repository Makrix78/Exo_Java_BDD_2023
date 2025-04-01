<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h2>Ajouter une tâche</h2>
    <form action="ajouterTache.jsp" method="post">
        Titre : <input type="text" name="title" required><br>
        Description : <textarea name="description" required></textarea><br>
        <input type="submit" value="Ajouter">
    </form>
    <br>
    <a href="taches.jsp">Voir mes tâches</a>
</body>
</html>
