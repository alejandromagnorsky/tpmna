function graph_mesh(deltaR, deltaT)

	v = centeredDifferences(deltaR, deltaT);
	
	r = .6:.9;
	
	rTotal = (1/2)/deltaR;
	tTotal = 10/deltaT;
		
	%hold;
	%for i=1:rTotal
	%		plot(v(:,1), v(:,i));
	%endfor
			
	surf((1/2):deltaR:1,0:deltaT:10,v);
	
	% Para los histogramas
	%e = zeros(n,1);
	%for j = 1:quant
      %          for i = 1:n
	%		e(i) = data(i,j) - v(t(i), x(1,j), x(2,j),x(3,j));
      %          endfor
	%	subplot(4,3,j);
	%	hist(e);
	%	title(names(j,:));
      %  endfor
	  
	xlabel("Radio del cilindro");
	ylabel("Tiempo");
	zlabel("Temperatura");
	
	
	
	  
	title("Evolución de la temperatura de un cilindro");
		
	print -dpng "-S1100,720" graph_mesh.png	
	
endfunction






