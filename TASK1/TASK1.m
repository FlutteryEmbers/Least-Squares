clear;
interval = [0, 10];
ma = [10, 100, 1000, 10000];
k = [0, 0, 0, 0];
for j = 1: 4
m = ma(j);

step_size = (interval(2) - interval(1))/m;
x = interval(1):step_size:interval(2);

y = discrete_sin(m, interval);
b = discrete_least_squares_approximation(m, interval, x, y);

for i = 1:m+1
    approximate_y(i) = discrete_approximate_function(b, x(i));
end

err = mean(abs(y - approximate_y).^2);
k(j) = err
end

plot(log10(ma), log10(k), 'o-')
xlabel("log10(approximation points)")
ylabel("log10(mean square err)")
hold on;
% plot(k)