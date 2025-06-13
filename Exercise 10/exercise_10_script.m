% DOPPI BIPOLI 
% Identificazione della Matrice delle Conduttanze G

% ------------------------------------------------------------------------
% STEP 1

% Implementare il circuito in Simscape (Matlab) 

% ------------------------------------------------------------------------
% STEP 2

% Inserire:
% - un generatore di tensione pari ad 1V alla porta 1;
% - un circuito chiuso (c.c.) alla porta 2.

% ------------------------------------------------------------------------
% STEP 3

% Simulare il circuito, acquisendo la corrente:
% - alla porta 1 (i1);
% - alla porta (i2).
% Il valore di i1 è numericamente (non dimensionalmente!) pari a G11.
% Analogamente, i2 è numericamente pari alla G21.

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%i1 
i11 = 0.05;

%i2 
i21 = -0.1;

% di conseguenza saremo in grado di calcolare G11 e G21 dalle affermazioni
% precedentemente presentate:

G11 = i11;
G21 = i21;

% ------------------------------------------------------------------------
% STEP 4

% Modificare il circuito, inserire:
% - un generatore di tensione pari ad 1V alla porta 2 
%   (in sostituzione del circuito chiuso); 
% - un circuito chiuso (c.c.) alla porta 1
%   (rimuovendo il generatore inserito al passo 2).
 
% ------------------------------------------------------------------------
% STEP 5

% Simulare il circuito, acquisendo la corrente:
% - alla porta 1 (i1); 
% - alla porta 2 (i2).
% Analogamente a prima, i2 è numericamente (non dimensionalmente!) pari 
% ad G22.
% i1 è numericamente pari alla G12 (non necessario in assenza di generatori
% controllati, poichè G12 = G21).

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%i1
i12 = 0.15;

%i2  
i22 = 0.2;


% di conseguenza saremo in grado di calcolare G22 dalle affermazioni
% precedentemente presentata:

G22 = i22;

% dato che siamo in presenza di generatori controllati, G12 è diverso da
% G21, quindi dovremo calcolarlo dalla affermazioni precedentemente 
% presentata:

G12 = i12; 

% ------------------------------------------------------------------------
% CONCLUSIONE

G = [G11, G12;
     G21, G22;]






