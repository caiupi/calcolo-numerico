function [y] = valuta(p,x)
%   valuta(p,x)
% % Valutazione delle ascisse x tramite i coefficenti del polinomio in modo
% tale che y=p(x).
% Input:
% - p: coefficienti polinomiali
% - x: ascisse della funzione da valutare.
% Output:
% - y : coordinate dell polinomio valutati.
a = length(p);
y = zeros(size(x));
if a > 0
    y(:) = p(1);
end
for i = 2:a
    y = x .* y + p(i);
end
end

