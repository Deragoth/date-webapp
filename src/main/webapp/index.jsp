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

        <p>
            Data di caricamento della pagina - Versione 5:
            <%= LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>
        </p>

        <button id="getDateBtn">Ottieni Data Attuale</button>

        <div id="result"></div>


        <%-- Mostra il contenuto del file --%>
        <h2>Contenuto del file:</h2>
        <div id="fileContent">
            <%
                // Percorso del file nel container
                String filePath = "/usr/local/tomcat/text-data/data.txt";
                java.io.File file = new java.io.File(filePath);

                if (file.exists()) {
                    try (java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.FileReader(file))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            out.println("<p>" + line + "</p>");
                        }
                    } catch (java.io.IOException e) {
                        out.println("<p>Errore durante la lettura del file: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p>Il file non esiste ancora. Inserisci del testo per crearlo.</p>");
                }
            %>
        </div>

    </div>

    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
