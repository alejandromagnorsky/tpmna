function x = sust(R1,Q1,b)

n = length(R1(:,1));
b = Q1'*b;
x = zeros(n,1);

for k=n:-1:1
	x(k) = (b(k) - R1(k,k+1:n)*x(k+1:n))/R1(k,k);
end



