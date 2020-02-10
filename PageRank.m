% Deaconu Andreea-Carina, 314CC

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
	
  R1 = Iterative(nume, d, eps); %calculeaza vectorul PR pentru Cerinta 1
  R2 = Algebraic(nume, d, eps); %calculeaza vectorul PR pentru Cerinta 2
  
 fin = fopen(nume, 'r');
 [N, contor] = fscanf(fin, '%d', 1);
 fout = fopen(strcat(nume, '.out'), 'w');
 contor = fprintf(fout, '%d\n', N);
 % se scrie in fisier vectorul PR calculat cu primul algoritm
 for i = 1 : N
  contor = fprintf(fout, '%.6f\n', R1(i));
 endfor
 % se scrie in fisier vectorul PR calculat cu al doilea algoritm
 for i = 1 : N - 1
  contor = fprintf(fout, '\n%.6f', R2(i));
 endfor
 contor = fprintf(fout, '\n%.6f\n', R2(N));

 % se citesc val1 si val2 din fisierul de input
 for i = 1 : N + 1
   linie = fgetl(fin);
 endfor
 [val] = fscanf(fin, '%f', 2);
 fclose(fin);
 % se sorteaza R2 descrescator
 PR1 = sort(R2, 'descend');
  % se creeaza un vector k ce va contine corespondenta dintre indicii vectorului PR1 si R2
 k = zeros(N, 1);
 for i = 1 : N
    for j = N : -1 : 1 
      if PR1(i) == R2(j) %a gasit nodul a carui PageRank este PR1(i)
        k(i) = j; 
        if i > 1 && k(i) != k(i - 1) %daca doua valori din PR1 sunt egale (k are doua elemente egale), va trebui sa caute indicele urmator
          break; %altfel, se trece la pasul i urmator
        endif
      endif
    endfor
  endfor
 % se scrie in fisier clasamentul celor mai importante pagini
  for i = 1 : N
    fprintf(fout, '\n%d %d %f', i, k(i), Apartenenta(PR1(i), val(1), val(2)));
  endfor
 fclose(fout);
 endfunction