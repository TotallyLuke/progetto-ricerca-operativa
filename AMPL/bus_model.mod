set S = 1 .. 22;        # studenti
set L = 1 .. 8; # F \cup D \cup I
set F = 1 .. 5;         # punti di raccolta studenti (fermate)
set D = 6 .. 7;         # depositi
set I = {8};            # scuole
set B = 1 .. 3;         # bus
set FI = {1, 2, 3, 4, 5, 8}; # F \cup I
set FD = 1 .. 7;    # F \cup D

param DistMatr{L, L};
param TimeMatr{L, L};
param FeStMatr{F, S};		# FeStMatr[i,s]==1 sse studente s dice di poter raggiungere fermata i
param b{D, B};              # b[i,k]==1 sse bus k parte da i
param C{B};                 # C[k] : capacità del bus k
param t;                    # inizio delle lezioni, in (minuti dopo le 7:00)/5
param minS;                 # minimo di studenti da far salire in una fermata

var x{B, L, L} binary;		# x[k,i,j]==1 sse il bus k percorre il nodo ij
var y{B, L} binary;         # y[k,i]==1 sse il bus k visita la fermata i
var z{S, B, F} binary;  	# z[s,k,i]==1 sse il bus k preleva lo studente s allo stop i

minimize costs:
80 * sum{i in L, j in L, k in B} DistMatr[i,j] * x[k,i,j]+
120 * ((sum{i in L, j in L, k in B} TimeMatr[i,j] * x[k,i,j]) + 2*sum{k in B, i in F}y[k,i]) +
5000 * sum{k in B, i in D, j in F}x[k,i,j] +
3000 * (card(B) - sum{k in B, i in D, j in F}x[k,i,j]);



# 3.5 Per ogni punto di raccolta studenti il n. di arrivi è uguale al numero di partenze.
s.t. EnterExitIdentity{k in B, i in F}:	 
sum{j in FD} x[k,j,i] = sum{j in FI} x[k,i,j];

# 3.6 Per ogni scuola il n. di arrivi è maggiore o uguale al numero di partenze.
s.t. EnterExitInequalitySchool{k in B, i in I}:	 
sum{j in I} x[k,j,i] >= sum{j in I} x[k,i,j];

# 3.7 Un bus arriva in un deposito, né rimane fermo nella stessa locazione, né visita m in F \cup D dopo l in I
s.t. ForbiddenMovements:
sum{k in B, i in L}x[k,i,i] + sum{k in B, i in L, j in D}x[k,i,j] + sum{k in B, i in I, j in FD}x[k,i,j] + sum{k in B, i in D, j in I}x[k,i,j] = 0;

# 3.8 Il numero di bus che esce da un nodo è uguale a 1 se la fermata è visitata
s.t. NodesLeft{k in B, j in FI}:
sum{i in FD} x[k,i,j] = y[k,j];

# 3.9 Il numero di bus che lascia un nodo è uguale a 1 se la fermata è visitata
s.t. NodesEntered{k in B, i in FD}: 			 
sum{j in FI} x[k,i,j] = y[k,i];

# 3.10 Ogni studente viene prelevato una sola volta.
s.t. PickUpOnce{s in S}: 
sum{k in B, i in F} z[s,k,i] = 1;

# 3.11 Se un bus k non visita una fermata i, nessuno studente sale in k nella fermata i.
s.t. UnvisitedStops{s in S, i in F, k in B}: 
z[s,k,i] <= y[k,i];

 s.t. CanReach{i in F, s in S}: 
sum{k in B} z[s,k,i] <= FeStMatr[i,s];

# 3.13 L'occupazione dei bus non può superare la capienza del bus.
s.t. BusOccupation{k in B}: 
sum{s in S, i in F} z[s,k,i] <= C[k];

# 3.14 Se una fermata viene visitata da k allora k non è rimasto al deposito.
s.t. UsedBus{k in B, i in FD, j in F}:
x[k,i,j] <= sum{l in D, m in F}x[k,l,m];

# 3.15 Ogni bus parte dal proprio deposito.
s.t. OwnDeposit{k in B, i in D}:
sum{j in L}x[k,i,j] <= b[i,k];

# 3.16 Ogni bus partito da un deposito arriva in una scuola.
s.t. ArrivedBus:
sum{k in B, i in D, j in F} x[k,i,j] = sum{k in B, i in F, j in I}x[k,i,j];

# 3.17 Ogni bus deve completare la propria corsa entro il suono della campanella.
s.t. TimeConstraint{k in B}:
(sum{i in L, j in L} TimeMatr[i,j] * x[k,i,j]) + 2*sum{i in F}y[k,i] <= 5*t;

# 3.18 Un bus visita una fermata solo se può prelevare un numero minimo di studenti.
s.t. MinStudent{k in B, i in F}:
y[k,i] <= (1/minS) * sum{s in S} z[s,k,i];
