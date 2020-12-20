function [ i,val ] = newton3(x0, max, tolx)
% [ i,val ] = newton3(x0, max, tolx)
% Il metodo di Newton modificato con criterio d'arresto del'incremento relativo.
% punto d'innesco in modo tale da determinare la radice 1 del polinomio
% radice 1 e di moltiplicita 3.       m=3.
% Input:
% - x0: punto d'innesco
% - max: numero massimo di iterazioni prefissate
% - tolx: tolleranza usata per il calcolo della soglia d'arresto
% Output:
% - i: Numero di iterazioni richieste per l'approssimazione del zero
% -nVal: Numero di valutazioni richieste
f=@(x) x^2*tan(x);
df=@(x) x*(2*tan(x)+x*sec(x)^2);
fx = feval(f, x0);
dfx = feval(df, x0);
val = 2;
i = 1;
if (fx == 0)  %se x0 è soluzione della funzione
    x = x0;
    %fprintf('Il metodo converge a %1.16f\nNumero di iterazioni: 1\nNumero di valutazioni di funzioni: %d\n', x, val);
    return;
end
if (dfx == 0)  %Se la derivata uguale a zero
    x = x0;
    %fprintf('\nDerivata prima uguale a zero --> impossibile continuare l''iterazione\nApprossimazione della radice ottenuta: %d\nNumero di iterazioni: %d\nNumero di valutazioni di funzioni: %d\n', x, i, val);
    return;
end
x1 = x0 - 3*(fx / dfx); %Primo passo di Newton. Molteplicita 3
%fprintf('\n x1 = %1.16f', x1);
errorX = abs(x1 - x0)/(1 + abs(x1));
if (errorX <= tolx)   %approssimazione trovata
    x = x1;
    %fprintf('\nIl metodo converge a %1.16f\nNumero di iterazioni: 1\nNumero di valutazioni di funzioni: %d\n', x, val);
    return;
end
i=i+1;
while (i < max)
    fx = feval(f, x1);
    val = val + 1;
    if(fx==0)
        %fprintf('\nIl metodo converge a zero a %1.16f\nNumero di iterazioni: %d\nNumero di valutazioni di funzioni: %d\n\n', x,i, val);
        return;
    end
    dfx = feval(df, x1);
    if (dfx == 0)  %Se la derivata uguale a zero
        x = x0;
        %fprintf('\nDerivata prima uguale a zero --> impossibile continuare l''iterazione\nApprossimazione della radice ottenuta: %d\nNumero di iterazioni: %d\nNumero di valutazioni di funzioni: %d\n', x, i, val);
        return;
    end
    val = val + 1;
    x = x1 - 3* (fx / dfx);  %3 molteplicita della radice della funzione
    %fprintf('\n x%d = %.16f ' , i, x);
    errOnX = abs(x - x1)/(1 + abs(x));
    if (errOnX <= tolx ) %controllo dell approssimazion
        %fprintf('\nIl metodo converge a %1.16f\nNumero di iterazioni: %d\nNumero di valutazioni di funzioni: %d\n\n', x,i, val);
        return;
    end
    x0=x1;
    x1=x;
    i = i + 1;
end
%fprintf('\nIl metodo NON converge! Numero di iterazioni: %d\n', i);
end