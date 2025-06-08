<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <h1>Applicazione Data - Ambiente: ${System.getenv("ENVIRONMENT")}</h1>
        <p>Data di caricamento della pagina - Versione 5:</p>
        <p>
            <%= LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>
        </p>

        <!-- Tabella delle variabili d'ambiente -->
        <h2>Variabili d'Ambiente</h2>
        <table>
            <thead>
                <tr>
                    <th>Chiave</th>
                    <th>Valore</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Map<String, String> env = System.getenv();
                    for (Map.Entry<String, String> entry : env.entrySet()) {
                %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Bottone e sezione per fare fetch della data tramite JavaScript -->
        <button id="getDateBtn">Ottieni Data e Ora</button>
        <div id="result"></div>
    </div>

    <script>
        document.getElementById("getDateBtn").addEventListener("click", function() {
            const now = new Date();
            const formattedDate = now.toLocaleDateString("it-IT", {
                weekday: "long",
                year: "numeric",
                month: "long",
                day: "numeric",
            });
            const time = now.toLocaleTimeString("it-IT");
            document.getElementById("result").innerHTML = `<p>Data: ${formattedDate}</p><p>Ora: ${time}</p>`;
        });
    </script>
</body>

</html>
