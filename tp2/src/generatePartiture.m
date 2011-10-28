function generatePartiture(wavFile)

% x es la señal del sonido
% fs es la frecuencia de muestreo (cantidad de muestreos por segundo). Es decir, un segundo equivale a fs muestras de x
% bits es la cantidad de bits de cada muestra
[x, fs, bits] = wavread(wavFile);

Ts = 1/fs;
% frecuencia maxima
fa = 524;
interval = ceil(fs*30/1000);
quant = 1000;

for k=1:quant
	lower = (k-1)*interval+1;
	upper = k*interval;
	X = fft(x(lower:upper));
	X = fftshift(X);
	f = 1:fa/(interval/2):fa;
	figure(1);
	plot(f, abs(X(1:length(f))));
	[number, pos] = max(X(1:length(f)));
	f(pos)
end
endfunction
