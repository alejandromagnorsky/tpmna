function ans = v(t, A0, A1, B1)
	f1 = 1/365.25;
	ans = A0 + A1 * cos(2*pi*f1*t) + B1 * sin(2*pi*f1*t);
endfunction
