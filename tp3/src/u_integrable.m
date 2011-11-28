function out = u_integrable(r, t, v, deltaR)
	rIndex = (r - .5) / deltaR;
	out = v(t,ceil(rIndex) + 1) * r;
endfunction






