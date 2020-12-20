function [b] = triangolareInferiore(A, b)
%   [b] = triangolareInferiore(A, b)
% Risolve sistema lineare con matrice triangolare inferiore con diagonale unitaria
% Input:
% -A: la matrice dei coefficienti
% -b: vettore termini noti.
% Output:
% -b: vettore delle soluzioni
n = size(A,1);
for j=1:n
    for i = j + 1 : n
        b(i) = b(i) - A(i,j) * b(j);
    end
end
end