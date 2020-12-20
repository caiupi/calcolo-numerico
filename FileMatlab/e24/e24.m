function e24(n)
%       e24()
% Stampa su linea di commando i risultati richiesti dal esercizio 24. 
% Input:
% - n: Numero dei sottointervalli del intervallo di integrazione 
f=@(x) tan(x);
ValoreFunzione=log(cos(1)/cos(1.1));

fprintf('\nN  ||  Integrale I1n       || Integrale I2n\n');
for i=1 : n
    I1n=trapecomp(f,-1,1.1,i);
    if mod (i, 2) == 0
        I2n=simpcomp(f,-1,1.1,i);
        fprintf('%d  ||       %f       ||      %f \n',i,I1n,I2n);
    else
        fprintf('%d  ||       %f       ||      ---- \n',i,I1n);
    end
end
ValoreFunzione
