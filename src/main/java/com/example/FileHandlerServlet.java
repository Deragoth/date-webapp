package com.example;

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

        // Scrivi il testo nel file tramite il FileService
        fileService.writeFile(inputText);

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

        // Inoltra la richiesta alla JSP
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}