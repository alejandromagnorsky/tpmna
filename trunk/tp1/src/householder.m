function [Q,R] = householder(A)

[m, n] = size(A);
Q = eye(m);
R = A;

for k=1:n
	if(k >= m)
		Q = Q';
		return;
	end
	x = R(k:m,k);
	u = x;
	u(1) = u(1)+sign(x(1))*norm(x);
	H = eye(m-(k-1)) - (2/norm(u)^2).*(u*u');

	Hk = eye(m);
	Hk(k:m,k:m) = H;

	R = Hk*R;
	Q = Hk*Q;
end
Q = Q';
