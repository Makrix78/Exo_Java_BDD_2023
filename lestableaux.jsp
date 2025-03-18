<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
    <p><input type="submit" value="Afficher"></p>
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null && !chaine.trim().isEmpty()) { %>

    <%-- Division de la chaîne en tableau de nombres --%>
    <% String[] tableauDeChiffres = chaine.trim().split("\\s+"); %>
    <p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</p>
    
    <%-- Conversion des valeurs en entiers --%>
    <% int[] valeurs = new int[tableauDeChiffres.length];
       for (int i = 0; i < tableauDeChiffres.length; i++) {
           valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
       }
    %>
    
    <%-- Affichage des valeurs --%>
    <p>Valeurs saisies :</p>
    <ul>
        <% for (int i = 0; i < valeurs.length; i++) { %>
            <li>Chiffre <%= i + 1 %> : <%= valeurs[i] %></li>
        <% } %>
    </ul>
    
<h2>Exercice 1 : Le carré de la première valeur</h2>
<p>Résultat : <%= valeurs[0] * valeurs[0] %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<p>Résultat : <%= valeurs[0] + valeurs[1] %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<%
    int somme = 0;
    for (int valeur : valeurs) {
        somme += valeur;
    }
%>
<p>Résultat : <%= somme %></p>

<h2>Exercice 4 : La valeur maximale</h2>
<%
    int max = valeurs[0];
    for (int valeur : valeurs) {
        if (valeur > max) {
            max = valeur;
        }
    }
%>
<p>Résultat : <%= max %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<%
    int min = valeurs[0];
    for (int valeur : valeurs) {
        if (valeur < min) {
            min = valeur;
        }
    }
%>
<p>Résultat : <%= min %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<%
    int plusProcheDeZero = valeurs[0];
    for (int valeur : valeurs) {
        if (Math.abs(valeur) < Math.abs(plusProcheDeZero)) {
            plusProcheDeZero = valeur;
        }
    }
%>
<p>Résultat : <%= plusProcheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (version avec priorité au positif)</h2>
<%
    int plusProcheDeZeroV2 = valeurs[0];
    for (int valeur : valeurs) {
        if (Math.abs(valeur) < Math.abs(plusProcheDeZeroV2) || (Math.abs(valeur) == Math.abs(plusProcheDeZeroV2) && valeur > 0)) {
            plusProcheDeZeroV2 = valeur;
        }
    }
%>
<p>Résultat : <%= plusProcheDeZeroV2 %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
