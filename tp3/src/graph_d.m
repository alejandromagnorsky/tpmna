function graph_d(deltaR, deltaT)
	v = centeredDifferences(deltaR, deltaT);
	
	tTotal = 10/deltaT;
	plot(1/2:deltaR:1,v(tTotal+1,:));
	title("Temperatura en régimen permanente (t=10)");
	xlabel("Radio");
	ylabel("Temperatura");
					
	print -dpng "-S1100,720" graph_d.png	
endfunction






