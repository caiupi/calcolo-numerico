%  script
%Script per tabullare i risultati del esercizio 10
clc;
n = 10;
xref = (1:10)';
fprintf('\nTabulazione dei risultati dello script ');
fprintf('\n   Prova numero | Condizionamento della matrice A | Distanza dei vettori  norm(x-xref)|   ');
for i = 1:10
    [A,b] = linsis(n,i);
    [LU,p] = palu(A);
    x = lusolve(LU,p,b);
    a2=cond(A);
    a1=norm(x-xref);
    fprintf('\n       %d        |           %0.5e           |      %0.5e ' ,i,a2,a1);
end
fprintf('\n');