package com.example;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import java.util.HashMap;
import java.util.Map;

/**
 * Risorsa REST che espone un endpoint per ottenere la data attuale
 */
@Path("/date")
public class DateResource {

    private final DateService dateService = new DateService();

    /**
     * Endpoint per ottenere la data corrente
     * @return Un oggetto JSON che contiene la data attuale
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Map<String, String> getDate() {
        String currentDate = dateService.getCurrentDate();
        Map<String, String> response = new HashMap<>();
        response.put("date", currentDate);
        return response;
    }
}