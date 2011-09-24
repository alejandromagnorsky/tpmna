function prob3d()
	[x,e] = prob3a();
	data = load("../data/windms.data");
	n = length(data(:,1));
	quant = 12;
	data = data(:,4:end);
	t = 1:n;

	% Para los histogramas
	e = zeros(n,1);
	for j = 1:quant
                for i = 1:n
			e(i) = data(i,j) - v(t(i), x(1,j), x(2,j),x(3,j));
                endfor
		figure(j);
		hist(e);
        endfor
endfunction
