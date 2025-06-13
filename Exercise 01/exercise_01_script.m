% DOPPI BIPOLI 
% Identificazione della Matrice Ibrida H

% ------------------------------------------------------------------------
% STEP 1

% Implementare il circuito in Simscape (Matlab) 

% ------------------------------------------------------------------------
% STEP 2

% Inserire:
% - un generatore di corrente pari ad 1A alla porta 1 
% - un circuito chiuso (c.c.) alla porta 2.

% ------------------------------------------------------------------------
% STEP 3

% Simulare il circuito, acquisendo:
% - la tensione alla porta 1 (v1);
% - la corrente alla porta 2 (i2).
% Il valore di v1 è numericamente (non dimensionalmente!) pari alla H11.
% Analogamente, i2 è numericamente pari alla H21.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%v1 
v11 = -0.8804;

%i2 
i21 = 1;

% di conseguenza saremo in grado di calcolare H11 e H21 dalle affermazioni
% precedentemente presentate:

H11 = v11;
H21 = i21;

% ------------------------------------------------------------------------
% STEP 4

% Modificare il circuito, inserire:
% - un generatore di tensione pari ad 1V alla porta 2 
%   (in sostituzione del circuito chiuso).
% - un circuito aperto (c.a.) alla porta 1 
%   (rimuovendo il generatore inserito al passo 2).

% ------------------------------------------------------------------------
% STEP 5

% Simulare il circuito, acquisendo:
% - la tensione alla porta 1 (v1) 
% - la corrente alla porta 2 (i2).
% Analogamente a prima, i2 è numericamente (non dimensionalmente!) pari 
% ad H22.
% v1 è numericamente pari alla H12 (non necessario in assenza di generatori
% controllati, poichè H12 = -H21).

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%v1
v12 = 1.839;

%i2  
i22 = 0;


% di conseguenza saremo in grado di calcolare H22 dalle affermazioni
% precedentemente presentata:

H22 = i22;

% dato che siamo in presenza di generatori controllati, H12 è diverso da
% -H21, quindi dovremo calcolarlo dalla affermazioni precedentemente 
% presentata:

H12 = v12; 

% ------------------------------------------------------------------------
% CONCLUSIONE

H = [H11,H12;
     H21,H22;]






