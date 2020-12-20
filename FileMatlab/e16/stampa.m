function stampa()
    %   stampa()  Stampa i risultati per l'esercizio 15
    %Stampa in linea di commando la norma del errore assoluto
    %rispetivamente al metodo Hermite con ascisse equidistanti 
    % e i metodo Newton con ascisse di Chebyshev
    f=@(x) cos((pi*x.^2)/2);
    df=@(x) (-pi*x.*sin((pi*x.^2)/2));
    a=-1;
    b=1;
    k=101;  %punti da valutare meglio dispari
    x=linspace(a,b,k);
    fprintf('\nN   ||Norma errore equidistanti|| Norma errore Hermite ascisse Chebyshev');
    for n=1 : 20
        xi=linspace(a,b,n+1);
        fi=f(xi);
        fli=df(xi);
        fx=f(x);
        y=hermite(xi,fi,fli,x);
        xi2=ceby(n,a,b);
        fi2=f(xi2);
        fli2=df(xi2);
        y2=hermite(xi2,fi2,fli2,x);
        e=norm(abs(y-fx));
        e1=norm(abs(y2-fx));
        fprintf('\n%d   ||        %d     ||            %d' ,n, e, e1);
    end
end

