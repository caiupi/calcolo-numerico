function  mRoot()
%  mRoot()
%Metodo utilizzato per verificare se la funzione f(x)=x^2*tan(x)ha
%molteplicita 3.
limite=2/3;  %La funzione ha molteplicita 3,  (m-1)/m
fprintf('\n Calcolo della molteplicita della funzione f(x)=x^2*tan(x)\n');
a=multi(1,100,eps); %chiamata al metodo newton per il calcolo del vettore degli errori relativi
control= true;
i=1;
while control
    if( abs(a(i)- limite)<= 10^(-10) )
        control = false;
    end
    i=i+1;
end
if  ~ control
    fprintf('\nLa molteplicita della funzione f(x)=x^2*tan(x) = \n 3 \n');
else
    fprintf('\n La molteplicita della funzione f(x)=x^2*tan(x) e diversa da \n 3 \n');
end
end

