<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ page import="com.example.config.AppConfig" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <!-- Form per scrivere testo nel file -->
        <form method="post" action="home">
            <label for="inputText">Inserisci del testo:</label><br>
            <input type="text" id="inputText" name="textInput" required placeholder="Scrivi qualcosa..."><br><br>
            <button type="submit">Scrivi nel file</button>
        </form>

        <!-- Mostra il contenuto del file -->
        <%
            Object debugFileContent = request.getAttribute("fileContent");
            Object apiBaseUrl = request.getAttribute("API_BASE_URL");
            Object appEnvironment = request.getAttribute("APP_ENVIRONMENT");
            System.out.println("Controllo JSP: fileContent    = " + debugFileContent);
            System.out.println("               apiBaseurl     = " + apiBaseUrl);
            System.out.println("               appEnvironment = " + appEnvironment);
        %>
        <p><b>Debug contenuto apiBaseUrl:</b> <%=apiBaseUrl%></p>
        <p><b>Debug contenuto appEnvironment:</b> <%=appEnvironment%></p>
        <p><b>Debug contenuto fileContent:</b> <%=debugFileContent%></p>

        <h2>Contenuto del file:</h2>
        <div id="fileContent">
            <c:choose>
                <c:when test="${not empty fileContent}">
                    <ul>
                        <c:forEach var="line" items="${fileContent}">
                            <li><c:out value="${line}" /></li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>Il file è vuoto o non esiste ancora.</p>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
