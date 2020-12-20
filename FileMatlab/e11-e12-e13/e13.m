function [x] = e13()
%       e13()
%Funzione per la soluzione del esercizio 13
% Output:
% -x: vettore delle soluzioni.
disp(' A: matrice nonsingolare dei coeffienti');
A=[1 2 3;1 2 4;3 4 5;3 4 6;5 6 7];
A
disp(' b: vettore dei termini noti.');
b=[14;17;26;29;38];
b
A = myqr(A);
x=qrsolve(A,b);
disp('Solozione del sistema lienare tramite la fattorizzazione QR ');
end
