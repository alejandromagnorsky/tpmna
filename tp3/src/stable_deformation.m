function d = stable_deformation(deltaR, deltaT, v, tIndex)
	r = .5:deltaR:1;
	ur = v(tIndex,:) .* r;
	d = 10.7 * trapz(r, ur);
endfunction
