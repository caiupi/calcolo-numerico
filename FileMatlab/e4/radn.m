function [ y ] = radn(x,n)
% [ y ] = radn(x,n)
%Il metodo rappresenta una procedura iterativa basatu sul metodo di Newton.
%Trova la radice n-essima di x. Dove x reale positivo e n interno.
% Input:
% - x: radicando della radice (deve essere maggiore di 0)
% - n: radice interno diverso da 0.
% Output:
% - y: approssimazione della radice
if x <= 0 % se x reale non positivo esci con errore
    error('x deve essere > 0');
end
if n==0 %La divisione per 0 fa si che il metodo non funziona
    error('n deve essere interno diverso da 0');
end
yi=1; %Punto di inesco del metodo
i = 1;  %Numero di iterazioni del metodo.
while 1 %Ciclo al infinito finche non si arriva alla tolleranza giusta
    y=yi + (yi.^(1-n).*(x - yi.^n))./n;
    fprintf('\nx%d = %.16f' , i, y);
    errOnX = abs(y - yi)/(1 + abs(y)); %Tolleranza relativa
    if (errOnX <= eps) %eps precisione macchina
        fprintf('\n\nIl metodo converge a %.16f\nNumero di iterazioni: %d\n', y, i);
        return;
    end
    yi = y;
    i = i + 1;
end
end