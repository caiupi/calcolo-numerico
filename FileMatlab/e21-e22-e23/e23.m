function e23()
% e23() - Funzione per la risoluzione del esercizio 23. Stampa in console il
% calcolo del integrale e lerrore relativo in base al grado n =1...9 
    f=@(x) tan(x);
    If=log(cos(1)/cos(1.1));
    I=ones(0,9);
    E=ones(0,9);
    for i=1 : 9
        I(i)=nc(f,-1,1.1,i);
        E(i)=If-I(i);
    end
    fprintf('\nN || Approssimazione Integrale ||Errore di approssimazione\n');    
    for i=1 : 9 
        fprintf('%d ||               %.3f       ||      %.3f \n',i,I(i),E(i));
    end 
end

