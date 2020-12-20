function [x] = qrsolve(QR,b)
%   [x] = qrsolve(QR,b)
% % Risoluzione del sistema lineare sovradeterminato fattorizzato QR.
% Input:
% - QR: matrice dei coefficienti fattorizzato QR
% -b: vettore termini noti.
% Output:
% - x : vettore delle soluzioni.
[m,n] = size(QR);
for i =1:n
    v =[1;QR(i+1:m,i)];
    b(i:m)= b(i:m)-((2*v*(v'))/((v')*v))*b(i:m);
end
x=triangolareSup(QR(1:n,1:n),b(1:n));
end

