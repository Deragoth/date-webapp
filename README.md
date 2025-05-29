Applicazione di test

Compilazione:

    mvn clean package

Immagine:

    - from ./dockerfile

    docker build -t date-webapp:latest .

Run:

    docker run -p 8080:8080 date-webapp:latest


