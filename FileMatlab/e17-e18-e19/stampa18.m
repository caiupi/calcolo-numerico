function stampa18()
    %   stampa18()  Stampa i risultati per l'esercizio 18
    %Stampa in linea di commando la norma del errore assoluto
    %rispetivamente al metodo spline natirale con ascisse equidistanti 
    % e i metodo spline naturale con ascisse di Chebyshev
    f=@(x) cos((pi*x.^2)/2);
    a=-1;
    b=1;
    k=101; 
    x=linspace(a,b,k);
    fprintf('\nN   ||Norma errore equidistanti|| Norma errore Spline ascisse Chebyshev');
    for n=4 :5: 100 
        xi=linspace(a,b,n+1);
        fi=f(xi);
        fx=f(x);
        y=splinenat(xi,fi,x);
        xi2=ceby(n,a,b);
        fi2=f(xi2);
        x2=linspace(xi2(1),xi2(end),k);
        y2=splinenat(xi2,fi2,x2);
        e=norm(abs(y-fx));
        e2=norm(abs(y2-fx));
        fprintf('\n%d   ||        %d     ||            %d' ,n, e, e2);
    end
end

