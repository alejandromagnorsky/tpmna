function leapyears = leapyears()
	data = load("../data/wind.data");
	
	j = 0;
	k = 1;
	currentyear = data(1,1);
	
	for i = 1:length(data)
		if (currentyear != data(i,1))
			if (j == 366)
				leapyears(k) = currentyear;
				k = k + 1;
			endif
			j = 1;
			currentyear = data(i,1);
		else
			j = j + 1;
		endif
	endfor 

endfunction
