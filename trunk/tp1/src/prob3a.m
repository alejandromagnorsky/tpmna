function Ecm = prob3a()

	data = load("../data/windms.data");
	n = length(data(:,1));
	data = data(:,4:end);
	t = 1:n;
	x = prob3(@qr);

	for j = 1:12
		aux = 0;
		for i = 1:n
			ek = data(i,j) - v(t(i), x(1,j), x(2,j),x(3,j));
			aux = aux + ek * ek;
		endfor
		Ecm(j) = sqrt(aux / length(data)); 
	endfor

endfunction
