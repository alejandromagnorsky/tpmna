function ur = u_times_r(r, v, t, deltaT)
	tIndex = t / deltaT + 1;
	ur = v(tIndex,:) .* r;
endfunction
