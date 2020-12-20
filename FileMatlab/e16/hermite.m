function [y,df] = hermite( xi, fi, f1i, xx )
    % [y,dfi] = hermite( xi, fi,fli, x ) Calcola il valore del polinomio
    % interpolante i punti (xi,fi) nei punti del vettore x secondo il metodo di Hermite.
    % - xi: asisse interpolanti
    % - fi: il valore della funzione delle ascisse interpolanti
    % - fli: il valore della derivata della funzione delle ascisse interpolanti
    % - x: punti da valutare  
    % Output:
    % - y:  Le coordinate dei punti x
    % - dfi. Le differenze divise
    m = length(xi);
    if m~=length(fi) || m~=length(f1i), error('dati inconsistenti'), end
    for i = 1:m-1
        if any( find(xi(i+1:m)==xi(i)) ), error('ascisse non distinte'), end
    end
    n = 2*m-1; % grado del polinomio interpolante
    x = zeros(n+1,1);
    df = x;
    x(1:2:n) = xi(:);
    x(2:2:n+1) = xi(:);
    df(1:2:n) = fi(:);
    df(2:2:n+1) = f1i(:);
    for i = n:-2:3 % seconda colonna della tabella
        df(i) = ( df(i)-df(i-2) )/( x(i)-x(i-1) );
    end
    for i = 2:n % colonne successive della tabella
        for j = n+1:-1:i+1
            df(j) = ( df(j)-df(j-1) )/( x(j)-x(j-i) );
        end
    end
    % calcolo il polinomio interpolante nelle ascisse prescritte
    %
    y = df(n+1)*ones(size(xx));
    for k = 0:n-1
        y = y.*( xx-x(n-k) ) +df(n-k);
    end
    return
end