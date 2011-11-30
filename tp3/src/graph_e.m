function graph_e(deltaR, deltaT)

	v = finiteDifferences(deltaR, deltaT);
				
	tTotal = 10/deltaT;
	
	t = 0:deltaT:10;
	for i=1:tTotal+1
		d(i) =  stable_deformation(deltaR, deltaT, v, i );
	endfor
	
	plot(t, d);
		
	title("Deformaci�n de un cilindro por temperatura");
	xlabel("Tiempo");
	ylabel("Deformaci�n");
					
	print -dpng "-S1100,720" graph_e.png	

	d(tTotal+1)
	
endfunction






