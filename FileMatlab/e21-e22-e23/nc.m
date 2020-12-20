function I=nc(f,a,b,n)
% nc(f,a,b,n) - Calcola l integrale della funzione f nel intervallo a , b
% usando le formule di Newton Cotes di grado n
% Input:
% - f: funzione da integrare
% - a: estemo inferiore della funzione integrana
% - b: estemo superiore della funzione integrana
% - n: Grado delle formule di NC
% Output:
% - I: Integrale della funzione 
if n>=1 & n<=40 %Per la relazione e richesta calcolo fino a 9
    w=pesi(n)/n;
    x=linspace(a,b,n+1)';
    vf=feval(f,x);
    I=(b-a)*(eval(w)'*vf);
else
    disp('Si deve scegliere grado di valore fra 1 e 9 compresi');
end



