function P = pesi(n)
%    pesi(n) - Funzione che calcola i pesi di Newton - Cotes. Dato in ingresso
% il grado N la funzione calcola i pesi della formula rispetiva. Serve per 
% la soluzione del esercizio 21.
% Input:
% - n: Grado della funzione esempio (n= 1 ....50)
% Output:
% - P: il vettore di numeri razionali dei pesi della NC  
m=n+1;
P=sym('t' , [m 1]); 
syms t; % Per avere numeri razionali
if mod(m,2)==0 %Se il numero dei pesi e pari
    for k=0 : m/2-1
        i=k+1;
        P(i)=1;
        j=0;
        while j <= m-1
            if j==k
                j=j+1;
            else
                P(i)=(P(i)*(t-j))/(k-j);
                j=j+1;
            end
        end
    end
    a=1;
    for k=m/2+1 : m %P(k)= P(k-a)
        P(k)=P(k-a);
        a=a+2;
    end   
else    %Se il numero dei pesi e dispari
    for k=0 : m/2
        i=k+1;
        P(i)=1;
        j=0;
        while j <= m-1
            if j==k
                j=j+1;
            else
                P(i)=(P(i)*(t-j))/(k-j);
                j=j+1;
            end
        end
    end
    a=2;
    for k=n/2+2 : m
        P(k)=P(k-a);
        a=a+2;
    end
end
for k=1 : m
    P(k)=int(P(k),0,n); % calcoliamo l integrale per definire i pesi
end
end

