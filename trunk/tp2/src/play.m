function play(wavFile)
	bps = 16;
	sps = 8000;
	readPartiture(sps, bps, writePartiture(getFrequencies(wavFile)));
endfunction
