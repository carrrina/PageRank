% Deaconu Andreea-Carina, 314CC

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se descompune matricea A ca produsul a doua matrice: A = Q * R.
  % Q este matrice ortogonala (inversa ei este egala cu transpusa), iar R este superior triunghiulara.
  % Se inmulteste la dreapta cu inversa matricii A (pe care o vom nota B).
  % Se obtine ca matricea identitate (I) este: I = Q * R * B.
  % Inmultind la stanga cu inversa lui Q (care este Q'), se obtine Q' = R * B.
  % Raman de rezolvat n sisteme de ecuatii superior triunghiulare, unde R este matricea sistemului.
  % Coloanele termenilor liberi sunt, pe rand, coloanele lui Q', iar vectorul de necunoscute este reprezentat de coloanele lui B.
	
  [n n] = size(A); %se stie ca matricea este patratica; se determina dimensiunea ei
  Q = zeros(n, n); 
  R = zeros(n, n); 
  V = A; %initial, vectorii coloana din V sunt egali cu cei din A
  for i = 1 : n %se lucreaza cu cate o coloana 
    R(i, i) = norm(V(:, i)); %R are pe diagonala principala normele coloanelor din V
    Q(:, i) = V(:, i) / R(i, i); %Q are ca elemente coloanele din V ortogonalizate (impartite la norma lor)
    for j = i + 1 : n %se completeaza R deasupra diagonalei principale
      R(i, j) = Q(:, i)' * V(:, j); %cu produsul dintre o coloana transpusa din Q (ortogonalizata) si o coloana din V (care nu a fost modificata)
      V(:, j) = V(:, j) - R(i, j) * Q(:, i); %folosind noile Q si R, se modifica si V 
    endfor
  endfor

  B = zeros(n, n); %se initializeaza inversa ce trebuie calculata
  for i = 1 : n %se rezolva cele n sisteme de ecuatii superior triunghiulare
   B(:, i) = SST(R, Q'(:, i));
  endfor
 endfunction
      