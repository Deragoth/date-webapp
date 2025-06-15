package com.example;

import com.example.config.AppConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FileHandlerServlet", urlPatterns = {"/FileHandlerServlet"})
public class FileHandlerServlet extends HttpServlet {

    private final FileService fileService = new FileService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ottieni il testo inviato dalla casella del form
        String inputText = request.getParameter("textInput");
        String action = request.getParameter("action");

        if ("write".equals(action)) {
            // Logica per scrivere nel file
            // Scrivi il testo nel file tramite il FileService
            fileService.writeFile(inputText);
        } else if ("clear".equals(action)) {
            // Logica per svuotare il file
            fileService.cleanFile();
        }

        // Reindirizza alla pagina JSP per aggiornare il contenuto
        response.sendRedirect(request.getContextPath() + "/home");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Leggi il contenuto del file tramite il FileService
        System.out.println("Esecuzione del metodo doGet() - Lettura del file...");
        List<String> fileContent = fileService.readFile(); // Chiama la funzione di lettura
        System.out.println("Contenuto file letto: " + fileContent); // Log per verificare i dati


        // Salva il contenuto come attributo della richiesta
        request.setAttribute("fileContent", fileContent);

        // Legge le variabili d'ambiente
        request.setAttribute("API_BASE_URL", AppConfig.API_BASE_URL);
        request.setAttribute("APP_ENVIRONMENT", AppConfig.APP_ENVIRONMENT);

        // Inoltra la richiesta alla JSP
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}