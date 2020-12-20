function [ A, p] = palu( A )
%   palu( A )
% Fattorizza la matrice A quadrata in LU con il metodo del pivoting
% parziale pA=LU
% Input:
% -A: matrice nonsingolare.
% Output:
% -A: la matrice fattorizzata L ed U con pivoting parziale;
% -p: vettore di permutazione
[m,n] = size(A);
if m~=n
    error('La matrice non è quadrata');
end
p = 1 : n;
for i = 1 : n - 1
    [mi, ki] = max(abs(A(i : n, i)));
    if mi == 0
        error('La matrice è singolare');%Se la matrice e singolare termina
    end
    ki = ki + i - 1;
    if ki > i
        A([i,ki], :) = A([ki,i], :);
        p([i, ki]) = p([ki,i]);
    end
    A(i + 1: n, i) = A(i + 1 : n, i) / A(i,i);
    A(i + 1 : n, i + 1 : n) = A(i + 1 : n, i + 1 : n) - A(i + 1 :n, i) * A(i, i + 1 : n);
end
end
