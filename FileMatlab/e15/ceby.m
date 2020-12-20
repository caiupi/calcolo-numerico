function [xi] = ceby(n,a,b)
%         [xi] = ceby(n,a,b)
% Function per la determinazione delle ascisse di Chebyshev
% - n: Grado del polinomio interpolante
% - a: estremo sinistro del intervallo interpolante [a,b]
% - b: estremo destro del intervallo interpolante [a,b]  
% Output:
% - xi:  vettore contenete le ascisse di Chebyshev di lunghezza n+1.
    xi = zeros(n+1, 1);
    for i=0:n
        xi(n+1-i) = (a+b)/2 + cos(pi*(2*i+1)/(2*(n+1)))*(b-a)/2;
    end
end

