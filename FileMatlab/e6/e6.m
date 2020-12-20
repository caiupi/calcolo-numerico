function e6()
%  e6()
%Funzione per stampare i risultati per numero di iterazione e valutazione
%delle function bisezione, Newton, corde e secanti secondo una
%tolleranza variabile.
f=@(x) x-cos(x);
df=@(x) (sin(x) +1 );
x0=0;
iMax=500;
a=0;
b=1;
temp=3;
fprintf('\nIl metodo bisezione  || Il metodo Newton  || Il metodo Corde   || Il metodo Secanti');
for i = 1 : 4
    temp=3*i;
    [a1,b1]=bisezione( a, b, f, iMax, 10^(-temp));
    [a2,b2]=newton(x0,f,df, iMax, 10^(-temp));
    [a3,b3]=corde(x0,f,df, iMax, 10^(-temp));
    [a4,b4]=secanti(x0,f,df, iMax, 10^(-temp));
    fprintf('\n%d Iter: %d Valut: %d || Iter: %d Valut: %d || Iter: %d Valut: %d|| Iter: %d Valut: %d' ,i, a1, b1,a2,b2,a3,b3,a4,b4);
end
fprintf('\n');
end

