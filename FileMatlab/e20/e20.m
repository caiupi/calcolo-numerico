function [] = e20(m)
%   e20(m)
%Funzione per la soluzione del esercizio 20. Esegue l'approssimazione della
%funzione data tramite il metodo dei minimi quadrati. Confronta il grafico
%della approssimazione e del errore rispetivo.
% Input:
% - m: Grado desiderato della funzione da approssimare
f=@(x) cos((pi*x.^(2))./2);
n=10000; %numero delle ascisse da valutare
x=zeros(1,n)';
for i = 0 : n-1
    x(i+1)= -1 + (2*(i))/(n-1);
end
fx=feval(f,x);
f1=fx+10^(-3).*rand(size(x));
V=fliplr(vander(x));%Costruzione della matrice Vandermonde
V=V(:,1:m+1);
V=myqr(V);
p=qrsolve(V,f1); %Soluzione tramite fattorizzazione qr
y=valuta(flip(p),x);
subplot(2 ,1 ,1);
plot(x,f1,'b',x,y,'r');
title ('Approssimazione minimo quadrati');
legend('Grafo funzione perturbata','Grafico della funzione approssimata');
e=abs(fx-f1);
e1=abs(fx-y);
subplot(2 ,1 ,2);
semilogy(x,e,'b',x,e1,'r');
title ('Errore di approssimazione in semilogy')
legend('Errore funzione perturbata','Errore funzione approssimata');
%Stampa delle norme del errore da confrontare
norm(e)   
norm(e1)
end

