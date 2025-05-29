document.addEventListener('DOMContentLoaded', function() {
    // Riferimento al pulsante e all'elemento risultato
    const getDateBtn = document.getElementById('getDateBtn');
    const resultElement = document.getElementById('result');

    // Aggiunta dell'event listener al pulsante
    getDateBtn.addEventListener('click', function() {
        // Chiamata all'API REST
        fetch('api/date')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Errore nella risposta del server');
                }
                return response.json();
            })
            .then(data => {
                resultElement.textContent = 'Data attuale: ' + data.date;
            })
            .catch(error => {
                resultElement.textContent = 'Errore: ' + error.message;
                console.error('Errore:', error);
            });
    });
});
