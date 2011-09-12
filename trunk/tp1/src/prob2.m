data = load("../data/windms.data");
j = 0;
for i=4:length(data(1,:))
	j = j+1;
	avgdata(j) = sum(data(:,i))/length(data(:,1));
end
