function [x, Ecm] = prob3a()

	data = load("../data/windms.data");
	n = length(data(:,1));
	quant = 12;
	data = data(:,4:end);
	t = 1:n;
	f1 = 1/365.25;
	A(1:n,1) = 1;
	A(1:n,2) = cos(2*pi*f1*t);
	A(1:n,3) = sin(2*pi*f1*t);
	x = zeros(3,quant);
	em = zeros(quant,1);

	for k=1:quant
		b = data(:,k);
		[x(:,k),em(k)] = householder(A, b);
		Ecm(k) = sqrt(em(k)/n);
	endfor
endfunction
