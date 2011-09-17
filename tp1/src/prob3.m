function x = prob3(qrFunction)

data = load("../data/windms.data");
n = length(data(:,1));
data = data(:,4:length(data(1,:)));

t = 1:n;
f1 = 1/365.25;

for k=1:12
	A(1:n,1) = 1;
	A(1:n,2) = cos(2*pi*f1*t);
	A(1:n,3) = sin(2*pi*f1*t);
	b = data(:,k);

	[Q,R] = qrFunction(A);
	R1 = R(1:3,:);
	Q1 = Q(1:n,1:3);

	x(:,k) = sust(R1, Q1, b);
end

