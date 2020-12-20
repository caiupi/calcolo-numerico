function [ x ] = newton(x0,f,df, iMax, tol)
% [ x ] = newton(x0,f,df, iMax, tol)
% Metodo Newton con criterio d'arresto sul errore relativo
% Input:
% - x0: punto d'innesco
% - f: stringa con il nome della funzione che implementa la funzione
% - df: stringa con il nome della funzione che implementa la derivata
%       della funzione
% - iMax: numero massimo di iterazioni
% - tol: tolleranza richiesta
% Output:
% - x: approssimazione della radice
fx = feval(f, x0);
dfx = feval(df, x0);
x = x0 - (fx / dfx);
i = 1;
nVal = 2;
while (i < iMax )
    fx = feval(f, x0);
    dfx = feval(df, x0);
    x = x0 - (fx / dfx);
    fprintf('\nx%d = %.16f ' , i, x);
    nVal = nVal + 2;
    errorX = abs(x - x0)/(1 + abs(x));
    if (errorX <= tol)
        fprintf('\nIl metodo converge a %.16f\nNumero di iterazioni: %d\nNumero Valutazioni: %d \n', x, i, nVal);
        return;
    end
    x0 = x;
    i = i + 1;
end
fprintf('\nIl metodo non converge!\nNumero di iterazioni: %d\n %.16f', i , x );
end