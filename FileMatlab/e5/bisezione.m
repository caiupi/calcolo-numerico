function[ x ] = bisezione( a, b, f, iMax, tol)
% [ x ] = bisezione( a, b, f, iMax, tol)
% Il metodo di Bisezione con criterio d'arresto sul errore relativo. Per
% funzionare il metodo ha come requisito il fatto che il punto di zero x0
% della funzione deve cadere del intervallo, a<x0<b.
% - a: Punto  di estremo sinstro del intervallo [a,b]
% - b: Punto  di estremo desctro del intervallo [a,b]
% - f: stringa con il nome della funzione che implementa la funzione
% - iMax: numero massimo di iterazioni
% - tol: tolleranza
% Output:
% - x: approssimazione della radice
fa = feval(f,a);
fb = feval(f,b);
nVal = 2;
x0=b; % Inizializzazione xo
i = 1;
while (i < iMax )
    x = (a + b) / 2;
    fprintf('\nx%d = %1.16f', i, x);
    fx = feval(f, x);
    nVal = nVal + 1;
    errorX = abs(x - x0)/(1 + abs(x));
    if (errorX <= tol)
        fprintf('\nIl metodo converge a %.16f\nNumero di iterazioni: %d Numero di valutazioni: %d\n', x, i,nVal);
        return;
    elseif fa * fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    x0=x;
    i=i+1;
end
fprintf('\nIl metodo non converge! Numero di iterazioni: %d\nNumero di valutazioni: %d\n\n', i, nVal);
end
