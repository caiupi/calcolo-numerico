function e19(n)
%   e19(n)  Funzione per calcolare i risultati del esercizio 19
%   Mostra e confronta i grafici delle funzioni costruite con la funzione spline
%   commando di Matlab, ripetivamente con le asscisse equidistanti e le ascisse di Chebyshev.
    f=@(x) cos((pi*x.^2)/2);
    a=-1;
    b=1;
    xi=linspace(a,b,n+1);
    fi=f(xi);
    k=1001;  
    x=linspace(a,b,k);
    fx=f(x);
    y=spline(xi,fi,x);
    xi2=ceby(n,a,b)';
    fi2=f(xi2);
    x2=linspace(xi2(1),xi2(end),k);
    y2=spline(xi2,fi2,x2);
    figure
    subplot(2 ,1 ,1);
    plot(x,y,'b',x2,y2,'r',x,fx,'k--',xi,fi,'bo',xi2,fi2,'ro');
    title ('Grafico della funzione ');
    grid on;
    legend('Spline ascisse equidistanti','Spline ascisse Chebyshev','Grafico della funzione');
    e=abs(y-fx);
    e1=abs(y2-fx);
    subplot(2,1,2);
    semilogy(x,e,'b',x2,e1,'r');
    title ('Errore Assoluto in semilogy')
    grid on
    legend('Errore Equidistante','Errore Chebyshev');
    norm(e)
    norm(e1)
end

