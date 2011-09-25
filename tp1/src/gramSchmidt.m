% A es una matriz de mxn con m >= n
% Devuelve las matrices Q y R
 function [Q,R] = gramSchmidt(A)
	[m, n] = size(A);
	Q = zeros(m,n);
	R = zeros(m,n);
	e = zeros(m,n);
	
	for k=1:n
		accum = zeros(m,1);
		for j=1:k-1
			accum = accum + e(:,j)  .*	(  (e(:,j)'*A(:,k))   /   (e(:,j)'*e(:,j))  );
		endfor
		u = A(:,k) - accum;
		e(:,k) = u / norm(u);
		
		for j=k:n
			R(k,j) = (e(:,k)'*A(:,j)); 
		endfor
	endfor
	
	Q = e;
endfunction
