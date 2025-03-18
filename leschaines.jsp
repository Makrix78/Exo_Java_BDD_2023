<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Exercices sur les chaînes de caractères</title>
</head>
<body bgcolor=white>
<h1>Manipulation des chaînes de caractères</h1>
<form action="#" method="post">
    <label for="chaine">Saisir une chaîne (6 caractères minimum) :</label>
    <input type="text" id="chaine" name="chaine">
    <input type="submit" value="Analyser">
</form>

<%-- Récupération et traitement de la chaîne --%>
<% String chaine = request.getParameter("chaine"); %>
<% if (chaine != null && chaine.length() >= 6) { %>
    <h2>Résultats</h2>
    <p>Longueur de la chaîne : <%= chaine.length() %> caractères</p>
    <p>Troisième caractère : <%= chaine.charAt(2) %></p>
    <p>Sous-chaîne (3e au 6e caractère) : <%= chaine.substring(2, 6) %></p>
    <p>Première occurrence de 'e' : <%= chaine.indexOf('e') %></p>

    <h2>Exercice 1 : Nombre de 'e'</h2>
    <% int countE = 0;
       for (char c : chaine.toCharArray()) {
           if (c == 'e') countE++;
       } %>
    <p>Nombre de 'e' dans la chaîne : <%= countE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <% for (char c : chaine.toCharArray()) { %>
        <p><%= c %></p>
    <% } %>

    <h2>Exercice 3 : Retour à la ligne après espace</h2>
    <% String[] mots = chaine.split(" "); %>
    <% for (String mot : mots) { %>
        <p><%= mot %></p>
    <% } %>

    <h2>Exercice 4 : Une lettre sur deux</h2>
    <p>
    <% for (int i = 0; i < chaine.length(); i += 2) { %>
        <%= chaine.charAt(i) %>
    <% } %>
    </p>

    <h2>Exercice 5 : La phrase en verlant</h2>
    <p>
    <% for (int i = chaine.length() - 1; i >= 0; i--) { %>
        <%= chaine.charAt(i) %>
    <% } %>
    </p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <% int voyelles = 0, consonnes = 0;
       String voyelleSet = "aeiouyAEIOUY";
       for (char c : chaine.toCharArray()) {
           if (Character.isLetter(c)) {
               if (voyelleSet.indexOf(c) != -1) voyelles++;
               else consonnes++;
           }
       } %>
    <p>Voyelles : <%= voyelles %>, Consonnes : <%= consonnes %></p>

<% } else if (chaine != null) { %>
    <p style="color: red;">Veuillez entrer une chaîne d'au moins 6 caractères.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
