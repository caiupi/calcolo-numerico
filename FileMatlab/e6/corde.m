function [ i, nVal] = corde(x0,f,df, iMax, tol)
% Metodo delle Corde criterio d'arresto errore relativo
% Input:)
% - x0: punto di innesco
% - f: stringa con il nome della funzione che implementa la funzione
% - df: stringa con il nome della funzione che implementa la derivata
%       della funzione
% - iMax: numero massimo di iterazioni prefissate
% - tol: tolleranza
% Output:
% - x: approssimazione della radice
    fx1=feval(df,x0);
    nVal=1;
    i = 1;
    while i < iMax
        fx=feval(f,x0);
        nVal=nVal+1;
        x = x0 - fx/fx1;
        %fprintf('\nx%d = %.16f ' , i, x);
        errOnX = abs(x - x0)/(1 + abs(x));
        if (errOnX <= tol)
            %fprintf('\n\nIl metodo converge a %.16f\nNumero di iterazioni: %d\n Numero valutazioni: %d\n\n', x, i, nVal);
            return;
        end
        x0 = x;
        i = i + 1;
    end
    fprintf('\n\nIl metodo NON converge!\nNumero di iterazioni: %d\nT Numero valutazioni:%d \n', i, nVal);
end