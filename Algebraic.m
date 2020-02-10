% Deaconu Andreea-Carina, 314CC

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  fin = fopen(nume, 'r'); 
  [N, contor] = fscanf(fin, '%d', 1); 
  A = zeros(N, N); %initializeaza matricea de adiacenta
  L = zeros(N, 1); %initializeaza vectorul L, ce contine numarul de link-uri detinute de fiecare pagina
  
  % se formeaza matricea de adiacenta
  for i = 1 : N  %pentru fiecare pagina in parte
    [v, contor] = fscanf(fin, '%d', 2); %in v citeste numarul nodului curent si numarul sau de vecini
    m = v(2); %extrage numarul de vecini
    for j = 1 : m 
      [b, contor] = fscanf(fin, '%d', 1); % citeste cate un vecin
      A(i, b) = 1; %completeaza in matricea de adiacenta
    endfor
    A(i, i) = 0; %pune 0 pe elementul de pe diagonala
  endfor
 fclose(fin);
 
 % se formeaza vectorul L
 for i = 1 : N %parcurge matricea de adiacenta pentru fiecare nod
   for j = 1 : N
     if A(i, j) == 1 %daca gaseste un vecin
       L(i) = L(i) + 1; %incrementeaza elementul curent din L
     endif
   endfor
 endfor
 
 M = zeros(N, N); %initializeaza matricea M
 for i = 1 : N
   for j = 1 : N
     if A(i, j) == 1 %daca i are link catre j
       M(j, i) = 1 / L(i); %modifica elementul corespunzator
     endif
   endfor
 endfor
 
 l = ones(N, 1); 
 I = eye(N); 
 T = I - d * M; %matricea pentru care trebuie sa calculam inversa
 R = GramSchmidt(T) * (1 - d) / N * l; %se calculeaza R cu formula
 endfunction