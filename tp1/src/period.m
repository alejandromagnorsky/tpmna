function period = period()
	data = load("../data/wind.data");
	period = length(data(:,3)) / (78-61+1);
endfunction
