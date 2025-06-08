#!/bin/bash
set -e

# Carica le variabili d'ambiente dal file properties
if [ -f /opt/app/config/env.properties ]; then
    set -a
    source /opt/app/config/env.properties
    set +a
    echo "Variabili d'ambiente caricate da env.properties"
fi

# Avvia Tomcat
exec "$@"
