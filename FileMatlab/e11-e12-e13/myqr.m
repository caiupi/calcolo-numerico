function [A] = myqr(A)
%       [A] = myqr(A)
% Questa funzione definisce una procedura per fattorizzare QR una matrice
% A data in input. Restituisce la matrice stessa fattorizzata.
% Input:
% - A: matrice dei coefficienti
% Output:
% - A: la parte superiore di A contiene la matrice triangolare
% superiore R mentre la parte strettamente inferiore contera i vettori di 
% Householder Q. A=QR
[m,n] = size(A);
for i=1:n
    alpha = norm(A(i:m, i));
    if alpha==0
        error('La matrice A non ha rango massimo');
    end
    if A(i,i)>=0
        alpha = -alpha;
    end
    v = A(i,i) - alpha;
    A(i,i) = alpha;
    A(i+1:m,i) = A(i+1:m,i)/v;
    beta = -v/alpha;
    A(i:m,i+1:n) = A(i:m, i+1:n)- (beta*[1; A(i+1:m,i)])*([1 A(i+1:m,i)']*A(i:m,i+1:n));
end
end

