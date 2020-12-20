function mi = spline0( xi, fi )
% mi = spline0( xi, fi ) Calcola il vettore degli mi per il calcolo di una
% spline cubica naturale interpolante i punti (xi,fi).
% Input:
% - xi: vettore delle ascisse d'interpolazione
% - fi: vettore dei valori assunti nelle ascisse d'interpolazione
% Output:
% - mi: momenti
    m = length(xi);
    if m~=length(fi), error('dati errati'); end
    for i = 1:m-1
        if any( find(xi(i+1:m)==xi(i)) ), error('ascisse non distinte'), end
    end
    xi = xi(:); fi = fi(:);
    [xi,ind] = sort(xi); fi = fi(ind); % ordino le ascisse in modo crescente
    hi = diff(xi);
    n = m-1;
    df = diff(fi)./hi;
    hh = hi(1:n-1)+hi(2:n);
    rhs = 6*diff(df)./hh;
    phi = hi(1:n-1)./hh;
    csi = hi(2:n)./hh; % = 1-phi;
    d = 2*ones(n-1,1);
    phi = phi(2:n-1);
    csi = csi(1:n-2);
    mi = trisolve( phi, d, csi, rhs );
    mi = [0;mi;0];
    return
end

