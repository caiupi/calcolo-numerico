function [y,dfi] = newton( xi, fi, x )
    % [y,dfi] = newton( xi, fi, x ) Calcola il valore del polinomio
    % interpolante i punti (xi,fi) nei punti del vettore x secondo il metodo Newton.
    % - xi: asisse interpolanti
    % - fi: il valore della funzione delle ascisse interpolanti
    % - x: punti da valutare  
    % Output:
    % - y:  Le coordinate dei punti x
    % - dfi. Le differenze divise
        n = length(xi)-1; % grado del polinomio interpolante
    if n~=length(fi)-1, error('dati inconsistenti')
    else
    for i = 1:n     
        if any( find(xi(i+1:n)==xi(i)) )
            error('ascisse non distinte'), end
        end
    end
    dfi = fi;
    for i = 1:n
        for j = n+1:-1:i+1
            dfi(j) = ( dfi(j)-dfi(j-1) )/( xi(j)-xi(j-i) );
        end
    end
    y = dfi(n+1)*ones(size(x)); %Horner generalizato
    for k = 0:n-1    
        y = y.*( x-xi(n-k) ) + dfi(n-k);
    end
    return

end