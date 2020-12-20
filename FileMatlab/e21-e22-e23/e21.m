function e21()
% e21() - Funzione per la risoluzione del esercizio 21. Stampa nella linea
%di commando i pesi delle formule di grado 1.2...7 in numeri razionali-
    fprintf('\nN - Pesi delle formule di Newton Cotes come numeri razionali\n');    
    for n=1 : 7 
        fprintf('%d - ',n);
        disp(pesi(n)'); %La funzione che calcola i pesi di NC
    end
end

