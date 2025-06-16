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
            <button type="submit" name="action" value="write">Aggiungi nel file</button>
            <button type="submit" name="action" value="clear">Svuota File</button>
        </form>

        <!-- Mostra il contenuto del file -->
        <%
            Object appEnvironment = request.getAttribute("APP_ENVIRONMENT");
            System.out.println("               appEnvironment = " + appEnvironment);
        %>
       <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Chiave</th>
                        <th>Valore</th>
                        <th>Chiave</th>
                        <th>Valore</th>
                        <th>Chiave</th>
                        <th>Valore</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="property-cell">APP_VERSION</td>
                        <td class="value-cell">
                            <%=request.getAttribute("APP_VERSION")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">DATABASE_URL</td>
                        <td class="value-cell">
                            <%=request.getAttribute("DATABASE_URL")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">DATABASE_PASSWORD</td>
                        <td class="value-cell">
                            <%=request.getAttribute("DATABASE_PASSWORD")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="property-cell">APP_ENVIRONMENT</td>
                        <td class="value-cell">
                            <%=request.getAttribute("APP_ENVIRONMENT")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">DATABASE_DRIVER</td>
                        <td class="value-cell">
                            <%=request.getAttribute("DATABASE_DRIVER")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">JWT_SECRET</td>
                        <td class="value-cell">
                            <%=request.getAttribute("JWT_SECRET")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="property-cell">LOG_LEVEL</td>
                        <td class="value-cell">
                            <%=request.getAttribute("LOG_LEVEL")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">JAVA_OPTS</td>
                        <td class="value-cell">
                            <%=request.getAttribute("JAVA_OPTS")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td class="property-cell">API_KEY</td>
                        <td class="value-cell">
                            <%=request.getAttribute("API_KEY")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="property-cell">apiBaseUrl</td>
                        <td class="value-cell">
                            <%=request.getAttribute("APP_ENVIRONMENT")%>
                            <span class="badge badge-url">API</span>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="property-cell">appEnvironment</td>
                        <td class="value-cell">
                            <%=request.getAttribute("APP_ENVIRONMENT")%>
                            <span class="badge badge-dev">DEV</span>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

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
