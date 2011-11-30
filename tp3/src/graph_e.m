function graph_e(deltaR, deltaT)

	v = finiteDifferences(deltaR, deltaT);
				
	tTotal = 10/deltaT;
	
	t = 0:deltaT:10;
	for i=1:tTotal+1
		[tmp a] =  quadv(@u_integrable, .5, 1, .1, false, i, v, deltaR);
		d(i) = 10.7 * tmp;
	endfor
	
	plot(t, d);
		
	title("Deformación de un cilindro por temperatura");
	xlabel("Tiempo");
	ylabel("Deformación");
					
	print -dpng "-S1100,720" graph_e.png	

	d(tTotal+1)
	
endfunction






