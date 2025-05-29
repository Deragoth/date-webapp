package com.example;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Servizio che fornisce la data corrente
 */
public class DateService {

    /**
     * Restituisce la data attuale formattata
     * @return Data attuale nel formato italiano (gg/mm/aaaa)
     */
    public String getCurrentDate() {
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return today.format(formatter);
    }
}