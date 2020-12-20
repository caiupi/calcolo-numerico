
function [x] = splinenat(xi, fi, x)
%  [y] = splinenat(xi, fi, x)  Spline cubica naturale per i punti richiesti.
% Input:
% - xi: ascisse di interpolazione
% - fi: valori della funzione nelle ascisse di interpolazione
% - x:  vettore di ascisse 
% Output:
% - x: il vettore contenente le coordinate delle ascisse x 
    n = length(xi) - 1;
    if length(xi) < 3
        error('Inserire almeno 4 ascisse interpolanti!');
    end
    fi=splinecubica(xi, fi);
    %disp(fi);
    j = 1;
    k = 1;
    for i = 1 : n
    control = true;
    while j <= length(x) && control
        if x(j) >= xi(i) && x(j) <= xi(i + 1)
            j = j + 1;
        else
            control = false;
        end
    end
    x(k :j - 1) = eval(subs(fi(i), x(k : j - 1)));
    k = j;
    end
 end

