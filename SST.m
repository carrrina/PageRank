%Deaconu Andreea-Carina, 314CC

function x = SST(A, b)
  %Functia care rezolva un sistem liniar superior triunghiular.
  %Date de intrare: matricea sistemului (A) si vectorul termenilor liberi (b).
  %Date de iesire: vectorul solutie (x).
    
  [n n] = size(A); 
  x = zeros(n, 1); %se initializeaza vectorul solutie
  for i = n: -1 : 1 %pornind cu ultima ecuatie a sistemului (care are o necunoscuta), se calculeaza cate un element din x
    s = 0; 
    for j = n: -1 : i + 1
      s = s + A(i, j) * x(j); %se face suma produselor dintre elementele lui x deja calculate (de la i + 1 la n) si coeficientii lor (elementele lui A)
    endfor
    x(i) = (b(i) - s) / A(i, i); %se determina si singura necunoscuta din ecuatia i
  endfor
endfunction