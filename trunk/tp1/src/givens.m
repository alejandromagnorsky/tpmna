% Using QR Givens' method.
%	A is mxn with m >= n
function [Q R] = givens(A)
	m = length(A);
	n = length(A(:,1));

	Q = eye(m);
	R = A;
	
	% Bottom-up until diagonal, then left-right.
	for j = 1:n;
		for i = m:-1:j+1
			if (R(i,j) != 0)
				a = R(i-1,j);
				b = R(i,j);
				d = sqrt(a^2 + b^2);
				c = a / d;
				s = -b / d;

				G = givensrot(i, j, c, s, m);
				R = G * R;
				Q = Q * G';
			endif
		endfor
	endfor

endfunction
