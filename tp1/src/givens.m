% Descomposición QR utilizando rotaciones de Givens
%	A debe ser de mxn, con m >= n
function [Q R] = givens(A)
	m = length(A);
	n = length(A(1,:));

	Q = eye(m);
	R = A;
	aux = zeros(m);

	% Rotando y anulando de abajo hacia arriba, de izquierda a derecha.
	% Ejemplo para una matriz A de 4x4:
	%	X X X X		X X X X		X X X X		X X X X		
	%	X X X X		X X X X		X X X X		0 X X X		
	%  -->	X X X X	  -->	X X X X	  -->	0 X X X	  -->	0 X X X	  -->	
	%	X X X X		0 X X X		0 X X X		0 X X X		
	%	se rota (4,1)	se rota (3,1)	se rota (2,1)	se rota (4,2)	
	%	con (3,1)	con (2,1)	con (1,1)	con (3,2)	
	%
	%	X X X X		X X X X		X X X X
	%	0 X X X		0 X X X		0 X X X
	%  -->	0 X X X	  -->	0 0 X X	  -->	0 0 X X
	%	0 0 X X		0 0 X X		0 0 0 X
	%	se rota (3,2)	se rota (4,3)	triangular
	%	con (2,2)	con (3,3)	superior

	for j = 1:n;
		for i = m:-1:j+1
			if (R(i,j) != 0)
				a = R(i-1,j);		% Se rotará b con a
				b = R(i,j);		% b será el que resulte anulado
                                d = sqrt(a^2 + b^2);	% distancia ab en el plano xy
                                c = a / d;		% coseno
                                s = -b / d;		% seno
				
				% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%  La rotación del elemento en (i,j) con el elemento
				% en (i-1,j) sólo afecta a las filas i e i-1 de R.
				%  Es ineficiente realizar un producto matricial
				% entero si sólo son afectadas algunas filas,
				% especialmente en matrices de dimensiones grandes.
				% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

				%  Las siguientes asignaciones mejoran el producto:
				%	R = G * R
				%  donde:
				%	- G es la matriz de rotación de Givens para
				% rotar (i,j) con (i-1,j).
				%	- R es la matriz triangular superior parcial,
				% para un cierto paso del algoritmo.
				
				aux = [R(i-1,:); R(i,:)];
				R(i-1,:) = c * aux(1,:) - s * aux(2,:);
				R(i,:) = s * aux(1,:) + c * aux(2,:);

				%  Las siguientes asignaciones mejoran el producto:
				%	Q = Q * G'
				%  donde:
				%	- G' es la matriz de rotación de Givens traspuesta
				% para rotar (i,j) con (i-1,j).
				%	- Q es la matriz ortogonal parcial de la descomposición,
				% para un cierto paso del algoritmo.
				
				aux = [Q(:,i-1)  Q(:,i)];
				Q(:,i-1) = c * aux(:,1) - s * aux(:,2);
				Q(:,i) = s * aux(:,1) + c * aux(:,2);
			endif
		endfor
	endfor
endfunction
