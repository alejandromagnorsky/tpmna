% QR descomposition using Givens' rotations.
%	A must be mxn with m >= n
function [Q R] = givens(A)
	m = length(A);
	n = length(A(1,:));

	Q = eye(m);
	R = A;
	aux = zeros(m);

	% Rotating and zeroing in bottom-up order, from left to right.
	% E.g. for a 4x4 A matrix:
	%	X X X X		X X X X		X X X X		X X X X		
	%	X X X X		X X X X		X X X X		0 X X X		
	%  -->	X X X X	  -->	X X X X	  -->	0 X X X	  -->	0 X X X	  -->	
	%	X X X X		0 X X X		0 X X X		0 X X X		
	%	will rotate	will rotate	will rotate	will rotate	
	%	(4,1)<->(3,1)	(3,1)<->(2,1)	(2,1)<->(1,1)	(4,2)<->(3,2)	
	%
	%	X X X X		X X X X		X X X X
	%	0 X X X		0 X X X		0 X X X
	%  -->	0 X X X	  -->	0 0 X X	  -->	0 0 X X
	%	0 0 X X		0 0 X X		0 0 0 X
	%	will rotate	will rotate	upper
	%	(3,2)<->(2,2)	(4,3)<->(3,3)	triangular

	for j = 1:n;
		for i = m:-1:j+1
			if (R(i,j) != 0)
				a = R(i-1,j);		% a will rotate with b
				b = R(i,j);		% zeroing target
                                d = sqrt(a^2 + b^2);	% distance from a to b
                                c = a / d;		% cos
                                s = -b / d;		% sin
				
				% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				%  Rotation of element (i,j) with (i-1,j) only
				% affects rows i and i-1 of R. 
				%  It's unefficient to perform a whole matrix
				% multiplication if only few rows are affected,
				% specially for large matrixes.
				% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

				%  The following assignations improve:
				%	R = G * R
				%  where:
				%	- G is the rotation matrix for rotating
				% (i,j) with (i-1,j).
				%	- R starts being A, but at the end, becomes
				% the upper triangular matrix of QR descomposition.
				
				aux = [R(i-1,:); R(i,:)];
				R(i-1,:) = c * aux(1,:) - s * aux(2,:);
				R(i,:) = s * aux(1,:) + c * aux(2,:);

				%  The following assignations improve:
				%	Q = Q * G'
				%  where:
				%	- G' is the transpose of (i,j)-with-(i-1,j)
				% rotation matrix G.
				%	- Q starts being an mxm identity matrix, but
				% at the end, becomes the orthogonal matrix of QR
				% descomposition.
				
				aux = [Q(:,i-1)  Q(:,i)];
				Q(:,i-1) = c * aux(:,1) - s * aux(:,2);
				Q(:,i) = s * aux(:,1) + c * aux(:,2);
			endif
		endfor
	endfor
endfunction
