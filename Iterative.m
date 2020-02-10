% Deaconu Andreea-Carina, 314CC

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
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
 R = l * (1 / N); %initial, toate elementele din vectorul R sunt 1 / N 
 t = 0; %se porneste de la pasul 0
 dif = eps; %notez dif = |R(t + 1) - R(t)| si ii dau ca valoare initiala eps
 while dif >= eps %cat timp nu s-a depasit pragul de eroare
   t = t + 1; %se trece la pasul urmator
   Q = R; %se pastreaza R(t) (de la pasul precedent)
   R = d * M * Q + (1 - d) / N * l; %se calculeaza R(t + 1) cu formula matriceala
   dif = norm((R - Q), 2); %se calculeaza norma din R(t + 1) - R(t)
 endwhile
 R = Q; %se va returna R(t) (nu R(t + 1))
 endfunction