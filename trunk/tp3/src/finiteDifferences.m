function v = finiteDifferences(deltaR, deltaT)

	K = 0.1;
	n = (1/2)/deltaR;
	l = 10/deltaT;

	v = zeros(l+1,n+1);
	for k = 0:n
		v(1,k+1) = 200*(1/2 + k*deltaR - 0.5);
	endfor
	for m=0:l
		v(m+1,1) = m*deltaT;
		v(m+1,n+1) = 100 + 40*m*deltaT;
	endfor

	for m=1:l
		for k=2:n
			v(m+1,k) = v(m,k) + 4*K*deltaT/deltaR^2 * (v(m,k+1) - 2*v(m,k) + v(m,k-1)) + 4*K*deltaT/((1/2+(k-1)*deltaR)*2*deltaR) * (v(m,k+1) - v(m,k-1));
		endfor
	endfor

endfunction






