function note = noteFromDistance(distance, epsilon)
	if (abs(distance - -9) <= epsilon)
		note = "C-";
	elseif (abs(distance - -8) <= epsilon)
		note = "C#";
	elseif (abs(distance - -7) <= epsilon)
		note = "D-";
	elseif (abs(distance - -6) <= epsilon)
		note = "Eb";
	elseif (abs(distance - -5) <= epsilon)
		note = "E-";
	elseif (abs(distance - -4) <= epsilon)
		note = "F-";
	elseif (abs(distance - -3) <= epsilon)
		note = "F#";
	elseif (abs(distance - -2) <= epsilon)
		note = "G-";
	elseif (abs(distance - -1) <= epsilon)
		note = "Ab";
	elseif (abs(distance - 0) <= epsilon)
		note = "A-";
	elseif (abs(distance - 1) <= epsilon)
		note = "Bb";
	else
		note = "B-";
	endif
endfunction
