function prob1()
	data = load("../data/wind.data");
	data(:,4:15) = data(:,4:15)*0.51444;
	save("-ascii", "../data/windms.data", "data");
end
