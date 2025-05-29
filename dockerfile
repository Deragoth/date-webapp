FROM tomcat:10-jdk17

# Rimuove la ROOT app predefinita
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia il WAR nella cartella webapps come ROOT.war
COPY target/date-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Espone la porta standard
EXPOSE 8080

# Avvia Tomcat
CMD ["catalina.sh", "run"]