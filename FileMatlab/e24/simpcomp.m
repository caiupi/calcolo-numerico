function [I] = simpcomp(fun,a,b,n)
% [ I ] = simpcomp( f, a, b, n)
%     simpcomp(@sin,0,1,6) Esempio
% Algoritmo per il calcolo dell'integrale di una funzione in un dato
% intervallo [a, b] utilizzando la formula dei trapezi composita.
% Input:
% - f: stringa con il nome della funzione che implementa la funzione
%       integranda
% - a: estremo sinistro dell'intervallo
% - b: estremo destro dell'intervallo
% - n: numero desiderato di partizioni nell'intervallo [a, b] (numero pari)
% Output:
% -I: l'area approssimata
if a==b
    I=0;
elseif n<2 || n/2 ~= fix(n/2)
    errore('Numero di ascisse non valide');
else
    h=(b-a)/n;
    x=linspace(a,b,n+1);
    f=feval(fun,x);
    I=(h/3)*(f(1)+f(n+1)+4*sum(f(2:2:n))+2*sum(f(3:2:n-1)));
end
return 

end

