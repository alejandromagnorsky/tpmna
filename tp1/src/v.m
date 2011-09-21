function ans = v(t, A0, A1, B1)
	ans = A0;
	ans = ans + A1 * cos(2*pi*t);
	ans = ans + B1 * sin(2*pi*t);
endfunction
