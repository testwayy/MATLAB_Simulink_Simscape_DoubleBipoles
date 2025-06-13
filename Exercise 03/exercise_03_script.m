% DOPPI BIPOLI 
% Identificazione Matrice di Trasmissione Diretta T in Regime Sinusoidale

% ------------------------------------------------------------------------
% STEP 1

% Implementare il circuito in Simscape (Matlab) scegliendo w se non
% fornita. 

% Ponendo:
%  -> L = Xl/w;
%  -> C = -1/w*Xc;
%  -> M = Xm/w;

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
% - un circuito aperto (c.a.) alla porta 2.

% ------------------------------------------------------------------------
% STEP 3

% Simulare il circuito, acquisendo la tensione:
% - alla porta 2 (v2).
% Siano Vm2 e tm2 il valore massimo di v2 e l'istante di tempo in cui 
% viene assegnato, allora T11 è numericamente (non dimensionalmente!) 
% pari a [cos(w*tm2)+jsen(w*tm2)]/Vm2.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Vm2
Vm11 = 1.494;

%tm2
tm11 = 0.217;

% di conseguenza saremo in grado di calcolare T11 dalla formule
% precedentemente presentate:

T11 = (cos(w*tm11)+j*sin(w*tm11))/Vm11;

% ------------------------------------------------------------------------
% STEP 4

% Modificare il circuito:
% - inserire un generatore di corrente pari i1 = cos(w*t) alla porta 1 
%   (in sostituzione del generatore di tensione inserito nello passo 2) 
% - lasciare inalterata la porta 2.

% ------------------------------------------------------------------------
% STEP 5

% Simulare il circuito, acquisendo la tensione:
% - alla porta 2 (v2).
% Analogamente a prima, T21 è numericamente pari 
% a [cos(w*tm2)+jsen(w*tm2)]/Vm2.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Vm2 
Vm21 = 7.616;

%tm2 
tm21 = 0.18;

% di conseguenza saremo in grado di calcolare T21 dalla formula
% precedentemente presentata:

T21 = (cos(w*tm21)+j*sin(w*tm21))/Vm21;

% ------------------------------------------------------------------------
% STEP 6

% Modificare il circuito:
% - inserire un circuito chiuso (c.c.) alla porta 2 
%   (in sostituzione del circuito aperto);
% - lasciare inalterata la porta 1.

% ------------------------------------------------------------------------
% STEP 7

% Simulare il circuito, acquisendo la corrente:
% - alla porta 2 (i2).
% Siano Im2 e Tm2 il valore massimo di i2 e l'istante di tempo in cui viene
% raggiunto, allora T22 è numericamente pari 
% a -[cos(w*tm2)+jsen(w*tm2)]/Im2.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Im2 
Im22 = 1.527;

%tm2 
tm22 = 0.333;

% di conseguenza saremo in grado di calcolare T22 dalla formula
% precedentemente presentata:

T22 = (cos(w*tm22)+j*sin(w*tm22))/Im22;

% ------------------------------------------------------------------------
% STEP 8

% In assenza di generatori controllati T12 = T21, altrimenti: 
% - lasciare inalterata la porta 2;
% - inserire un generatore di tensione pari a v1 = cos(w*t) alla porta 1 
%   (in sostituzione del generatore di corrente inserito al passo 4).

% ------------------------------------------------------------------------
% STEP 9

% Simulare il circuito, acquisendo la corrente: 
% - alla porta 2 (i2).
% Analogamente a prima, T12 è numericamente pari 
% a -[cos(w*tm2)-jsen(w*tm2)]/Im2.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Im2 
Im12 = 0.1451; 

%tm2 
tm12 = 0.386; 

% di conseguenza saremo in grado di calcolare T12 dalla formula
% precedentemente presentata:

T12 = (cos(w*tm12)-j*sin(w*tm12))/Im12;

% ------------------------------------------------------------------------
% CONCLUSIONE

T = [f(Vm11,tm11), g(Im12,tm12);
     f(Vm21,tm21), g(Im22,tm22)]

function y = f(Vm,tm) 
    y = (cos(2*pi*tm)+1j*sin(2*pi*tm))/Vm;
end

function h = g(Im,tm) 
    h = (cos(2*pi*tm)+1j*sin(2*pi*tm))/Im;
end




