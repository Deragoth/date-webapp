FROM tomcat:10-jdk17

# Rimuove la ROOT app predefinita
RUN rm -rf /usr/local/tomcat/webapps/*

# Installa curl per health checks
#Per Alpine
#RUN apk add --no-cache curl
#Per Ubuntu
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Imposta le variabili ambiente
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH


# Copia il WAR nella cartella webapps come ROOT.war
COPY target/date-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Per sicurezza crea utente non root
# inserire le variabili sempre fra doppi apici per evitare injection
RUN chmod +x "${CATALINA_HOME}"/bin/*.sh

#comandi specifici per Ubuntu
RUN groupadd -g 1001 tomcat && \
    useradd -r -u 1001 -g tomcat -s /bin/bash -d /usr/local/tomcat tomcat && \
    chown -R tomcat:tomcat "${CATALINA_HOME}" \
USER tomcat

# Espone la porta standard
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1


# Avvia Tomcat
CMD ["catalina.sh", "run"]