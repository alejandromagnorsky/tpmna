function readPartiture(sps, bps, triplets)

	min_octave = 55;
	triplet_duration = 0.03;

	duration = triplet_duration * length(triplets(:,1));	
	samples = sps * duration;
	step = 1 / samples;

	t = linspace(0, triplet_duration, sps * triplet_duration);

	wave = 0;
	for i=1:length(triplets(:,1))
		frequency = noteToFrequency(triplets(i,:));
		t = t + t;
		wave = [wave sin(t * 2*pi * frequency)];
	endfor	

	wavwrite(wave', sps, bps, 'audio.wav');

endfunction
