function graph_mesh(deltaR, deltaT)

	v = centeredDifferences(deltaR, deltaT);
	
	surf((1/2):deltaR:1,0:deltaT:10,v);
	
	xlabel("Radio del cilindro");
	ylabel("Tiempo");
	zlabel("Temperatura");
	  
	title("Evolución de la temperatura de un cilindro");
		
	print -dpng "-S1100,720" graph_mesh.png	
	
endfunction






