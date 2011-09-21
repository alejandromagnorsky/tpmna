function Ecm = prob3a()

	data = load("../data/wind.data");
	x = prob3(@qr);

	for j = 4:15
		aux = 0;
		for i = 1:length(data)
			ek = data(i,j) - v(data(i,3), x(1,j-3), x(2,j-3),x(3,j-3) );
			aux = aux + ek * ek;
		endfor
		Ecm(j-3) = sqrt(aux / length(data)); 
	endfor

endfunction
