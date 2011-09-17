function G = givensrot(i, j, c, s, n)
	G = eye(n);
	G(i,i) = c;
	G(j,j) = c;
	G(j,i) = -s;
	if (i > j)
		G(i,j) = s;
	endif
endfunction
