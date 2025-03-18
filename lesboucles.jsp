<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <% int cpt = Integer.parseInt(valeur); %>

    <p>
    <%-- Boucle for pour afficher une ligne d'étoiles --%>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>

    <h2>Exercice 1 : Le carré d'étoiles</h2>
    <p>Affichage d'un carré d'étoiles de taille <%= cpt %> :</p>
    <% for (int i = 0; i < cpt; i++) { %>
        <p>
        <% for (int j = 0; j < cpt; j++) { %>
            <%= "*" %>
        <% } %>
        </p>
    <% } %>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <p>Affichage d'un triangle rectangle aligné sur la gauche :</p>
    <% for (int i = 1; i <= cpt; i++) { %>
        <p>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        </p>
    <% } %>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <p>Affichage d'un triangle rectangle inversé aligné sur la gauche :</p>
    <% for (int i = cpt; i >= 1; i--) { %>
        <p>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        </p>
    <% } %>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
