function  e22(m)
% e22() - Funzione per la risoluzione del esercizio 22. Mostra il grafo del
% rapporto fra kn/k per i = 1 .... m . Per l esercizio e richiesto m=50.
% Input:
% - m: Naturale fino a che grado confrontare i condizionamenti
kn=zeros(1,m);
for n =1 : m
    tmp=abs(pesi(n));
    for j=1 : length(tmp)
        kn(n)=kn(n)+tmp(j);
    end
    kn(n)=kn(n)/n;
end
semilogy([1:m],kn,'b');
title ('Rapporto del condizionamento Kn/K');
grid on;
legend('Kn/K rispeto a N');
end