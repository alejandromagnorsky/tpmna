function prob3d()

	data = load("../data/wind.data");
	x = prob3(@qr);

	t = 1:length(data);

	%SOLO PARA LA PRIMER ESTACION POR AHORA
	for i = 1:length(data)
		%ek(i) = abs(data(i,j) - v(data(i,3), x(1,j-3), x(2,j-3),x(3,j-3)));
		ek(i) = abs(data(i,4) - v(data(i,3), x(1,1), x(2,1),x(3,1)));
	endfor

	plot(t,ek);

endfunction
