function v = centeredDifferences(deltaR, deltaT)

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
			a = 0;
			if(m > 1)
				a = v(m-1,k);	
			endif
			v(m+1,k) = 2*v(m,k) - a + 4*K*deltaT^2/deltaR^2 * (v(m,k+1) - 2*v(m,k) + v(m,k-1)) + 4*K*deltaT^2/(2*deltaR*(1/2+k*deltaR)) * (v(m,k+1) - v(m,k-1));
		endfor
	endfor

endfunction






