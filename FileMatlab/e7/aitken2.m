function [ i,val ] = aitken2(x0, max, tolx) 
%   [ i,val ] = aitken2(x0, max, tolx) 
%Il metodo di Newton con accelerazione di Aitken.
% Input:
% - x0: punto d'innesco 
% - max: numero massimo di iterazioni prefissate
% - tolx: tolleranza usata per il calcolo della soglia d'arresto
% Output:
% - i: Numero di iterazioni richieste per l'approssimazione del zero
% -nVal: Numero di valutazioni richieste
f=@(x) x^2*tan(x);
    df=@(x) x*(2*tan(x)+x*sec(x)^2);
    control=false;                    %Controllo della funzione  
    x=x0;
    i = 1;
    val=0;
    fx=feval(f,x0);  
    dfx=feval(df,x0);
    val=val+2;
    if (fx==0)
        x=x0; %abbiamo trovato la soluzione 
        return;
    end
    if(dfx==0)
        %fprintf('Errore la derivala uguale a zero il metodo non converge');
        return;
    end   
    x0=x0-fx/dfx; % primo passo del metodo Newton
    while ( i < max )
        fx=feval(f,x0);  
        dfx=feval(df,x0);
        val=val+2;
        if (fx==0)
            x=x0;
            control = true; %abbiamo trovato la soluzione 
            break;
        end
        if(dfx==0)
            %fprintf('Errore la derivala uguale a zero il metodo non converge');
            return;
        end
        x1=x0-fx/dfx; % primo passo del metodo Newton
        fx=feval(f,x1);
        dfx=feval(df,x1);
        val=val+2;
        if (fx==0)
            x=x1;
            control = true; %abbiamo trovato la soluzione
            break;
        end
        if(dfx==0)
            %fprintf('Errore la derivala uguale a zero il metodo non converge');
            return;
        end
        x2=x1-fx/dfx; % secondo passo del metodo Newton
        y=x2-2*x1+x0; %controlliamo se denominatore diverso da 0
        if(y==0)
            %fprinf('Denominatore del equazione di Aitken uguale a zero metodo non utilizabile');
            x=x2;
            return;
        end
        x=(x2*x0-x1.^2)/y;  %accelerazione di Aitken
        %fprintf('\n x%d: =  %.16f' , i, x);
        error = abs(x - x0) / (1 + abs(x)); %errore relativo di x
        if (error <= tolx)
            control = true;
            break;
        end
        x0 = x;
        i = i + 1;
    end
    if(control) %Metodo convergente
        %fprintf('\nIl metodo converge con \nx: %.16f \nNumero di iterazioni: %d \nNumero valutazioni: %d', x,i,val);
    else
        %fprinf('Il metodo non converge. Raggiunto il massimo numero di iterazioni');
    end
end