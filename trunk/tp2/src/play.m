function play(wavFile)
	bps = 16;
	sps = 11025;
	readPartiture(sps, bps, writePartiture(getFrequencies(wavFile)));
endfunction
