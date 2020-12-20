function e25(tol)
%   e25(tol)
%La funzione che implementa la risoluzione del esercizio 25.
%Prende come input una tolleranza e mette in confronto le formule adattive 
%dei trapezi e di Simpson stampando in linea di comando il numero dei punti
%e graficando i rispetivi punti sul grafico della funzione del esercizio.
% Input:
% - tol: Toleranza richiesta per il confronto (Es: 10.^(-2)
f=@(x) 1./(1+(10.^2).*(x.^2));
x=linspace(-1,1,1001);
y=feval(f,x);
fprintf('\n   tol   ||Adattive Trapezi|Numero punti||Adattive Simpson |Numero punti\n');
    [I1,P1]=adaptrap(f,-1,1,tol);
    [I2,P2]=adapsim(f,-1,1,tol);
    fprintf('%f ||   %f     |   %d       ||    %f     |   %d\n',tol,I1,length(P1),I2,length(P2));
figure
subplot(2 ,1 ,1);
plot(x,y,P1(1:length(P1),1),P1(1:length(P1),2),'ro');
title ('Grafico con punti delle formule adattive dei trapezi');
legend('Grafico della funzione','Punti adative trapezi');

subplot(2 ,1 ,2);
plot(x,y,P2(1:length(P2),1),P2(1:length(P2),2),'ro');
title ('Grafico con punti delle formule adattive di Simpson');
legend('Grafico della funzione','Punti adative Simpson');
end


