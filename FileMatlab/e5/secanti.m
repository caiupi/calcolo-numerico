function [ x ] = secanti(x0,fx,df, iMax, tol)
%  [ x ] = secanti(x0,fx,df, iMax, tol)
% Il metodo  delle Secanti con criterio d'arresto sul errore relativo
% Input:
% - x0: punto di nnesco
% - f: stringa con il nome della funzione che implementa la funzione
% - df: stringa con il nome della funzione che implementa la derivata
%       della funzione 
% - iMax: numero massimo di iterazioni 
% - tol: tolleranza 
% Output:
% - x: approssimazione della radice
fx0= feval(fx,x0);
    dfx0 = feval(df, x0);             
    nVal=2;
    x1 = x0 - (fx0 / dfx0);    
    i = 1;
    while i < iMax
        fx1= feval(fx,x1);
        x =( fx1 * x0 - fx0 * x1 )/(fx1 - fx0);
        nVal =nVal + 1 ;  
        fprintf('\nx%d = %.16f ' , i, x);
        errOnX = abs(x - x1)/(1 + abs(x));
        if (errOnX <= tol)
            fprintf('\nIl metodo converge a %.16f\nNumero di iterazioni: %d\nNumero Valutazioni: %d \n', x, i, nVal);
            return;
        end
        x0 = x1;
        x1=x;
        fx0=fx1;
        i = i + 1;
    end
    fprintf('\nIl metodo non converge!\nNumero di iterazioni: %d\nNumero Valutazioni: %d \n', i, nVal);
end