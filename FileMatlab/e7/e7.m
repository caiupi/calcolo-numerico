function e7()
% e7()
%Funzione per stampare e tabulare  i risultati per numero di iterazione e valutazione
%degli metodi di Newton, Newtn modificato e Aitken secondo una
%tolleranza variabile.
x0=1; % Punto di innesco
iMax=500;
fprintf('\nStampa dei risultati per riga per tolx rispettivamente 10^(-3), 10^(-6), 10^(-9),10^(-12)');
fprintf('\n')
fprintf('\n  Il metodo Newton   | Il metodo Newton  | Il metodo Aitken');
temp=3;
for i = 1 : 4
    [a1,b1]=newton2( x0,  iMax, 10^(-i*temp));
    [a2,b2]=newton3(x0, iMax, 10^(-i*temp));
    [a3,b3]=aitken2(x0, iMax, 10^(-i*temp));
    fprintf('\n%d Iter: %d Valut: %d | Iter: %d Valut: %d  | Iter: %d Valut: %d',i, a1, b1,a2,b2,a3,b3);
end
fprintf('\n');
end

