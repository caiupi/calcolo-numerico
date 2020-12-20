function [x] = lusolve(LU,p,b)
%  [x] = lusolve(LU,p,b)
%Soluzione sistema lineare utilizando LU con pivoting parziale
% Input:
% -LU: matrice nonsingolare fatorizzata LU.
% -p: vettore delle permutazioni
% -b: vettore dei termini noti.
% Output:
% -x: vettore delle soluzioni.
P=zeros(length(LU));
for i=1:length(LU) %Creazione della matrice di permutazione
    P(i, p(i)) = 1;
end
%tril(A,-1) La matrice triandolare inferiore senza la diadonale di A
b = triangolareInferiore(tril(LU,-1)+eye(length(LU)), P*b); %
x = triangolareSup(triu(LU), b); % triu La parte triangolare superiore con diagonale di A
end
