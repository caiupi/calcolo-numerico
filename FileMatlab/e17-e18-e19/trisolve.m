function x = trisolve( phi, d, csi, b )
n = length(d);
x = b;
for i = 1:n-1
    phi(i) = phi(i)/d(i);
    d(i+1) = d(i+1) -phi(i)*csi(i);
    x(i+1) = x(i+1) -phi(i)*x(i);
end
x(n) = x(n)/d(n);
for i = n-1:-1:1
    x(i) = (x(i)-csi(i)*x(i+1))/d(i);
end
return
end