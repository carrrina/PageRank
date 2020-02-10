% Deaconu Andreea-Carina, 314CC

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
	
  % Functia fiind continua, limitele ei trebuie sa fie egale la stanga si la dreapta lui val1, respectiv val2.
  % Obtinem doua ecuatii: 0 = a * val1 + b si a * val2 + b = 1.
  % Scazandu-le, obtinem:
  a = 1 / (val2 - val1);
  b = -1 * a * val1;
  % se construieste functia
  if x < val1
    y = 0;
  endif
  if x > val2
    y = 1;
  endif
  if x >= val1 && x <= val2
    y = a * x + b;
  endif
  endfunction