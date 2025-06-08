<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Attuale con Ambiente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Applicazione Data - Ambiente: nullo</h1>
        <p>Data di caricamento della pagina - Versione 5:</p>
        <p>
            Data di caricamento della pagina - Versione 5:
            <%= LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>
        </p>

        <button id="getDateBtn">Ottieni Data Attuale</button>

        <div id="result"></div>
    </div>

    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>