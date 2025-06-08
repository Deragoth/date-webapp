<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Attuale</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Applicazione Data</h1>

        <%-- Utilizzo di Java direttamente nella JSP per mostrare la data di sistema sul server --%>
        <p>
            Data di caricamento della pagina - Versione 5:
            <%= LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>
        </p>

        <button id="getDateBtn">Ottieni Data Attuale</button>

        <div id="result"></div>

<%
    // Percorso del file nel container
    String filePath = "/usr/local/tomcat/text-data/data.txt";
    java.io.File file = new java.io.File(filePath);
    // Scrivi dati sul file
    try (java.io.FileWriter writer = new java.io.FileWriter(file, true)) {
        writer.write("Linea aggiunta il " + java.time.LocalDate.now() + "\n");
    }
    // Leggi il contenuto del file
    try (java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.FileReader(file))) {
        String line;
        while ((line = reader.readLine()) != null) {
            out.println("<p>" + line + "</p>");
        }
    }
%>
    </div>

    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
