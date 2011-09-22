% For testing:
% [Q, R] = gramSchmidt( [12,-51,4;6,167,-68;-4,24,-41] )
% Q*R deberia dar la matriz
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
		
		% for R, k is taken as rows...
		for j=k:n
			R(k,j) = (e(:,k)'*A(:,j)); 
		endfor
	endfor
	
	Q = e;
endfunction
