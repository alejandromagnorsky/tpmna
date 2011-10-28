function generatePartiture(wavFile)

% x es la señal del sonido
% fs es la frecuencia de muestreo (cantidad de muestreos por segundo). Es decir, un segundo equivale a fs muestras de x
% bits es la cantidad de bits de cada muestra
[x, fs, bits] = wavread(wavFile);

Ts = 1/fs;
interval = floor(fs*30/1000);
quant = floor(length(x)/interval);

for k=1:quant
	lower = (k-1)*interval+1;
	upper = k*interval;

	X = fft(x(lower:upper));
	X = fftshift(X);
	X = X(floor(length(X)/2)+1:length(X));
	f = 0:fs/interval:fs/2-1;

	plot(f, abs(X));
	[number, pos] = max(X);
	frecuencies(k) = f(pos);
endfor
frecuencies
plot(frecuencies)
endfunction
