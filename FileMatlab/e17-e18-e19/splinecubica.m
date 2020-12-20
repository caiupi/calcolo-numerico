function [ p ] = splinecubica(xi, fi)
% [ p ] = splinecubica(xi, fi) Determina degli n polinomi che formano una spline
% cubica di tipo naturale.
% Input:
% - xi: vettore delle ascisse d'interpolazione
% - fi: vettore dei valori assunti nelle ascisse d'interpolazione
% Output:
% - p: il vettore contenente le n espressioni dei polinomi
    m = spline0(xi,fi);
    ni = length(xi) - 1;
    p = sym('x' , [ni 1]); %Crea un vettore di variabili simboliche
    syms x;
    for i = 2 : ni + 1
        hi = xi(i) - xi(i - 1);
        ri = fi(i - 1) - hi^2/6 * m(i - 1);
        qi = (fi(i) - fi(i - 1))/hi - hi/6 * (m(i) - m(i - 1));
        p(i-1)=((x-xi(i-1))^3 *m(i) + (xi(i) - x)^3 *m(i-1))/(6*hi)+qi*(x-xi(i-1))+ ri;
    end
end