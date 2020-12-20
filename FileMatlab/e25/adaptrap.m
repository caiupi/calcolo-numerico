function [I2,points] = adaptrap( f, a, b, tol, fa, fb )
% [I2,points] = adaptrap( f, a, b, tol )
% Calcolo dell'integrale di una funzione in un dato
% intervallo [a, b] utilizzando la formula adattiva dei trapezi.
% Input:
% - f: stringa con il nome della funzione che implementa la funzione
%       integranda
% - a: estremo sinistro dell'intervallo
% - b: estremo destro dell'intervallo
% - tol: toleranza richiesta per il calcolo
% - fa: Valore della funzione  per la chiamata ricorsiva 
% - fb: Valore della funzione  per la chiamata ricorsiva 
% Output:
% - I2: l'area approssimat
% - points: L'insieme delle ascisse e delle coordinate dei punti valutati
global points   %opzionale 
delta = 0.5; % ampiezza minima intervalli
if nargin<=4   %numero argumenti 4 chiamata function del utente
    fa = feval( f, a );
    fb = feval( f, b );
    if nargout==2
        points = [a fa; b fb];
    else
        points = [];
    end
end
h = b-a;
x1 = (a+b)/2;
f1 = feval( f, x1 );
if ~isempty(points)
    points = [points; [x1 f1]];  %contateniamo nuovo valore
end
I1 = .5*h*( fa+fb );
I2 = .5*( I1 + h*f1 );
e = abs( I2-I1 )/3;
if e>tol || abs(b-a)>delta
    I2 = adaptrap( f, a, x1, tol/2, fa, f1 ) +...
        adaptrap( f, x1, b, tol/2, f1, fb );
end
return
end