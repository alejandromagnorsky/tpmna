% A es una matriz de mxn con m >= n
% b es un vector de mx1
% Devuelve el vector x de nx1 / R1*x = Q1'*b
function [x,e] = householder(A,b)
	[m, n] = size(A);
	R = A;
	
	for k=1:n
		x = R(k:m,k);
		% ||x||^2 = <x,x> = x'*x
		nx2 = x'*x;
		sigma = sign(x(1))*sqrt(nx2);
		u = x;
		u(1) = u(1)+sigma;

		H = eye(m-(k-1)) - (1/(nx2+x(1)*sigma)).*(u*u');

		R(k,k) = -sigma;
		R(k+1:m,k) = 0;
		if k < n
			R(k:m,k+1:n) = H*R(k:m,k+1:n);
		endif

		% Calcula Q1'*b en lugar de calcular Q
		b(k:m) = H*b(k:m);
	endfor

	% Calcula x por sustitucion hacia atras
	x = zeros(n,1);
	for k=n:-1:1
		x(k) = (b(k) - R(k,k+1:n)*x(k+1:n))/R(k,k);
	end

	% Calcula el error minimo
	e = b(n+1:m)'*b(n+1:m);
endfunction
