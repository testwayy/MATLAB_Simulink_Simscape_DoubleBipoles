% DOPPI BIPOLI 
% Identificazione della Matrice delle Ammettenze Y

% ------------------------------------------------------------------------
% STEP 1

% Implementare il circuito in Simscape (Matlab) scegliendo w se non
% fornita. 

% Ponendo:
%  -> L = XL/w;
%  -> C = -1/w*XC;
%  -> M = XM/w;

% Nel nostro caso:
% 1) dichiaro i dati dell'esercizio in Simscape;
% 2) w non è fornita, quindi la pongo uguale a 2*pigreco sia
%    nel Simscape che nello script a seguire e dichiaro i dati 
%    dell'esercizio.

w = 2*pi;

% ------------------------------------------------------------------------
% STEP 2

% Inserire:
% - un generatore di tensione pari a v1 = cos(w*t) alla porta 1; 
% - un circuito chiuso (c.c.) alla porta 2.

% ------------------------------------------------------------------------
% STEP 3

% Simulare il circuito, acquisendo la corrente:
% - alla porta 1 (i1);
% - alla porta (i2).
% Siano Im1 e tm1 il valore massimo di i1 e l'istante di tempo in cui 
% viene assegnato, allora Y11 è numericamente (non dimensionalmente!) 
% pari a Im1*[cos(w*tm1)-jsen(w*tm1)].
% Analogamente, Y21 è numericamente è pari a Im2*[cos(w*tm2)-jsen(w*tm2)].

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Im1 
Im11 = 0.3963;

%tm1 
tm11 = 0.051;

%Im2 
Im21 = 0.3956;

%tm2 
tm21 = 0.551;

% di conseguenza saremo in grado di calcolare Y11 e Y21 dalle formule
% precedentemente presentate:

Y11 = Im11*(cos(w*tm11)-j*sin(w*tm11));
Y21 = Im21*(cos(w*tm21)-j*sin(w*tm21));

% ------------------------------------------------------------------------
% STEP 4

% Modificare il circuito, inserire: 
% - un generatore di tensione pari a v2 = cos(w*t) alla porta 2 
%   (in sostituzione del circuito aperto); 
% - un circuito chiuso (c.c.) alla porta 1 (rimuovendo il generatore 
%   inserito al passo 2).

% ------------------------------------------------------------------------
% STEP 5

% Simulare il circuito, acquisendo la corrente:
% - alla porta 1 (i1);
% - alla porta 2 (i2).
% Analogamente a prima, Y22 è numericamente pari 
% a Im2*[cos(w*tm2)-jsen(w*tm2)].
% Y12 è numericamente pari a Im1*[cos(w*tm1)-jsen(w*tm1)] (non necessario
% in assenza di generatori controllati, poichè Y12 = Y21).

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Im1
Im12 = 0.3956;

%tm1
tm12 = 0.551;

%Im2  
Im22 = 0.3963;

%tm2
tm22 = 0.051;

% di conseguenza saremo in grado di calcolare Y22 dalle formula
% precedentemente presentata:

Y22 = Im22*(cos(w*tm22)-j*sin(w*tm22));

% dato che siamo in presenza di generatori controllati, Y12 è diverso da
% Y21, quindi dovremo calcolarlo dalla formula precedentemente presentata:

Y12 = Im12*(cos(w*tm12)-j*sin(w*tm12));

% ------------------------------------------------------------------------
% CONCLUSIONE

Y = [f(Im11,tm11), f(Im12,tm12);
     f(Im21,tm21), f(Im22,tm22)]

function y = f(Im,tm) 
    y = Im*(cos(2*pi*tm)-1j*sin(2*pi*tm));
end





