function [i,nVal ] = newton2(x0, iMax, tolx)
%  [i,nVal ] = newton2(x0, iMax, tolx)
%Metodo NEWTON con criterio d'arresto sul errore relativo
% Input:
% - x0: punto d'innesco
% - iMax: numero massimo di iterazioni
% - tolx: tolleranza
% Output:
% - i: Numero di iterazioni richieste per l'approssimazione del zero
% -nVal: Numero di valutazioni richieste
i = 1;
f=@(x) x^2*tan(x);
df=@(x) x*(2*tan(x)+x*sec(x)^2);
fx = feval(f, x0);
dfx = feval(df, x0);
x = x0 - (fx / dfx);
%   fprintf('\nx = %.16f  %.16f %.16f' , x , fx ,dfx);
nVal = 2;
i=i+1;
while (i < iMax )
    fx = feval(f, x0);
    dfx = feval(df, x0);
    x = x0 - (fx / dfx);
    %fprintf('\nx%d = %.16f ' , i, x);
    nVal = nVal + 2;
    errorX = abs(x - x0)/(1 + abs(x));
    if (errorX <= tolx)
        %fprintf('\nIl metodo converge a %.16f\nNumero di iterazioni: %d Numero di valutazioni: %d\n', x, i,nVal);
        return;
    end
    x0 = x;
    i = i + 1;
end
%fprintf('\nIl metodo non converge!\nNumero di iterazioni: %d\n %.16f', i , x );
end