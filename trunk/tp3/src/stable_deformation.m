function d = stable_deformation(deltaR, deltaT)
	r = .5:deltaR:1;
	v = finiteDifferences(deltaR, deltaT);
	ur = u_times_r(r, v, 10, deltaT);
	d = 10.7 * trapz(r, ur);
endfunction
