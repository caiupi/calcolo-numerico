function [b] = triangolareSup(A, b)
% [b] = triangolareSup(A, b)
% Risolve sistema lineare con matrice triangolare superiore
% Input:
% -A: la matrice dei coefficienti;
% -b: termini noti.
% Output:
% -b: vettore delle soluzioni.
n = size(A,1);
for i = n : -1 : 1
    for j = i+1 : n
        b(i) = b(i) - A(i,j) * b(j);
    end
    b(i)=b(i)/A(i,i);
end
end