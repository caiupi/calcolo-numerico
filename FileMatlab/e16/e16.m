function e16(n)
    %   e16(n)  Funzione per calcolare i risultati del esercizio 16
	%   Mostra e confronta i grafici delle funzioni costruite ripetivamente con le 
    %   asscisse equidistanti e le ascisse di Chebyshev.
    %   % - xi: asisse interpolanti
    f=@(x) cos((pi*x.^2)/2);
    df=@(x) (-pi*x.*sin((pi*x.^2)/2));
    a=-1;
    b=1;
    xi=linspace(a,b,n+1);
    fi=f(xi);
    fli=df(xi);
    k=10001;  %punti da valutare meglio dispari
    x=linspace(a,b,k);
    fx=f(x);
    y=hermite(xi,fi,fli,x);
    xi2=ceby(n,a,b);
    fi2=f(xi2);
    fli2=df(xi2);
    y2=hermite(xi2,fi2,fli2,x);
    figure
    subplot(2 ,1 ,1);
    plot(x,y,'b',x,y2,'r',x,fx,'k--',xi,fi,'bo',xi2,fi2,'ro');
    title ('Grafico della funzione ');
    grid on;
    legend('Hermite ascisse equidistanti','Hermite ascisse Chebyshev','Grafico della funzione');
    e=abs(y-fx);
    e1=abs(y2-fx);
    subplot(2,1,2);
    semilogy(x,e,'b',x,e1,'r');
    title ('Errore Assoluto in semilogy')
    grid on
    legend('Errore Equidistante','Errore Chebycov');
    norm(e)
    norm(e1)
end

