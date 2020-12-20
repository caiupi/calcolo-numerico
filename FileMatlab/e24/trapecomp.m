function [ I ] = trapecomp( fun, a, b, n)
% [ I ] = trapecomp( f, a, b, n)
% Ccalcolo dell'integrale di una funzione in un dato
% intervallo [a, b] utilizzando la formula dei trapezi composita.
% Input:
% - f: stringa con il nome della funzione che implementa la funzione
%       integranda
% - a: estremo sinistro dell'intervallo
% - b: estremo destro dell'intervallo
% - n: numero desiderato di partizioni nell'intervallo [a, b]
% Output:
% -I: l'area approssimata
if a==b
    I=0;
elseif n<1 || n ~= fix(n)
    errore('Numero di ascisse non valide');
else
    h=(b-a)/n;
    x=linspace(a,b,n+1);
    f=feval(fun,x);
    I=h*(f(1)/2+sum(f(2:n))+f(n+1)/2);
end
return 
end