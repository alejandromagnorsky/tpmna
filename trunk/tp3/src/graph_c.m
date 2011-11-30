function graph_c(deltaR, deltaT)

	v = finiteDifferences(deltaR, deltaT);
	
	r = .6:.9;
	
	rTotal = (1/2)/deltaR;
	tTotal = 10/deltaT;
	
	rStep = .1/deltaR;
	
	hold
	for i=1:rStep:rTotal-rStep
		subplot(2,2,i);
		plot(0:deltaT:10,v(:,i+rStep));
		axis( [ 0, 10, 0, 450 ] );
		title(strcat("Temperatura en r=", num2str(1/2 + i*deltaR)) );
		xlabel("Tiempo");
		ylabel("Temperatura");
	endfor
					
	print -dpng "-S1100,720" graph_c.png	
	
endfunction






