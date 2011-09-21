function prob3d()

	data = load("../data/windms.data");
	n = length(data(:,1));
	t = 1:n;
	x = prob3(@qr);

	%SOLO PARA LA PRIMER ESTACION POR AHORA
	for i = 1:n
		ek(i) = abs(data(i,4) - v(t(i), x(1,1), x(2,1),x(3,1)));
	endfor

	plot(t,ek, "*b");
	print -dpng -r85 histo.png
endfunction
