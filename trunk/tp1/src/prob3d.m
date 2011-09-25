function prob3d()

	names = [ "Roche's Pt." ; "Valentia" ; "Rosslare" ; 
		 "Kilkenny" ; "Shannon"; "Birr"; "Dublin" ;
		"Claremorris"; "Mullingar"; "Clones"; "Belmullet";"Malin head" ];

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
		subplot(4,3,j);
		hist(e);
		title(names(j,:));
        endfor
	print -dpng "-S1100,720" prob_3d.png
endfunction
