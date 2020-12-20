function [m] = multi(x0, iMax, tolx)
%   [m] = multi(x0, iMax, tolx)
% Metodo Newton con criterio d'arresto sul errore relativo
% Input:
% - x0: punto d'innesco
% - iMax: numero massimo di iterazioni 
% - tolx: tolleranza 
% Output:
% - m: Vettore che contiene gli errori relativi di f.
f=@(x) x^2*tan(x);
    df=@(x) x*(2*tan(x)+x*sec(x)^2);
    fx = feval(f, x0);               
    dfx = feval(df, x0);             
    x = x0 - (fx / dfx);
%   fprintf('\nx = %.16f  %.16f %.16f' , x , fx ,dfx);
    nVal = 2;    
    i = 1;
    e1=1;
    e2=1;
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
        %-----------Codice che tiene tracia del rapporto della molteplicita  
        e2=errorX;  %Errore relativo della nuova approssimazione
        m(i)=e2/e1;  % Diviso per l'errore della vecchia approssimazione
        e1=e2; 
        x0 = x;
        i = i + 1;
    end
    %fprintf('\nIl metodo non converge!\nNumero di iterazioni: %d\n %.16f', i , x );
end

