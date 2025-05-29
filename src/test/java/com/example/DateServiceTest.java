package com.example;

import org.junit.jupiter.api.Test;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class DateServiceTest {

    @Test
    public void testGetCurrentDate() {
        DateService dateService = new DateService();
        String result = dateService.getCurrentDate();

        // Verifica che il formato sia corretto (gg/mm/aaaa)
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String expected = today.format(formatter);

        assertEquals(expected, result);
    }
}
