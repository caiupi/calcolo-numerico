function [I2,points] = adapsim( f, a, b, tol, fa, f1, fb )
% [I2,points] = adapsim( f, a, b, tol )
% Calcolo dell'integrale di una funzione in un dato
% intervallo [a, b] utilizzando la formula adattiva dei trapezi.
% Input:
% - f: stringa con il nome della funzione che implementa la funzione
%       integranda
% - a: estremo sinistro dell'intervallo
% - b: estremo destro dell'intervallo
% - tol: toleranza richiesta per il calcolo
% - fa: Valore della funzione  per la chiamata ricorsiva 
% - f1: Valore della funzione  per la chiamata ricorsiva
% - fb: Valore della funzione  per la chiamata ricorsiva 
% Output:
% - I2: l'area approssimat
% - points: L'insieme delle ascisse e delle coordinate dei punti valutati
global points
delta = 0.5; % ampiezza minima intervalli
x1 = (a+b)/2;
if nargin<=4
    fa = feval( f, a );
    fb = feval( f, b );
    f1 = feval( f, x1 );
    if nargout==2
        points = [a fa;x1 f1; b fb];
    else
        points = [];
    end
end
h = (b-a)/6;
x2 = (a+x1)/2;
x3 = (x1+b)/2;
f2 = feval( f, x2 );
f3 = feval( f, x3 );
if ~isempty(points)
    points = [points; [x2 f2; x3 f3]];
end
I1 = h*( fa+4*f1+fb );
I2 = .5*h*( fa + 4*f2 + 2*f1 + 4*f3 +fb );
e = abs( I2-I1 )/15;
if e>tol || abs(b-a)>delta
    I2 = adapsim( f, a, x1, tol/2, fa, f2, f1 ) + ...
        adapsim( f, x1, b, tol/2, f1, f3, fb );
end
return
end