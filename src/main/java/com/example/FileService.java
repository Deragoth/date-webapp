package com.example;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Servizio per gestire la lettura e scrittura di un file di testo.
 */
public class FileService {

    private static final String FILE_PATH = "/usr/local/tomcat/text-data/data.txt";

    /**
     * Legge il contenuto del file e lo restituisce come lista di stringhe.
     * @return Lista contenente le righe del file.
     * @throws IOException In caso di errore durante la lettura del file.
     */
    public List<String> readFile() throws IOException {
        System.out.println("Entra nel ReadFile");
        List<String> lines = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    lines.add(line);
                }
            }
        } else {
            System.out.println("Il file non esiste: " + FILE_PATH);
        }

        System.out.println("Linee lette dal file: " + lines); // Mostra le linee lette per debug
        return lines;
    }

    /**
     * Scrive una stringa nel file, aggiungendola come nuova riga.
     * @param text La stringa da scrivere.
     * @throws IOException In caso di errore durante la scrittura nel file.
     */
    public void writeFile(String text) throws IOException {
        File file = new File(FILE_PATH);

        // Assicurati che se il file o la directory non esistono, vengano creati
        file.getParentFile().mkdirs();

        try (FileWriter writer = new FileWriter(file, true)) {
            writer.write(text + "\n");
        }
    }
}