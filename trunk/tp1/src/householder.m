% A is mxn with m >= n
function [x,e] = householder(A,b)
	[m, n] = size(A);
	R = A;
	
	for k=1:n
		x = R(k:m,k);
		u = x;
		nx2 = x'*x;
		sigma = sign(x(1))*sqrt(nx2);
		u(1) = u(1)+sigma;
		H = eye(m-(k-1)) - (1/(nx2+x(1)*sigma)).*(u*u');

		R(k,k) = -sigma;
		R(k+1:m,k) = 0;
		if k < n
			R(k:m,k+1:n) = H(:,:)*R(k:m,k+1:n);
		endif
		b(k:m) = H*b(k:m);
	endfor
	x = sust2(R(1:n,:), b(1:n));
	e = b(n+1:m)'*b(n+1:m);
endfunction
