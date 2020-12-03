clear;
interval = [0, 10];

k = [0, 0, 0, 0];

m = 10000;

step_size = (interval(2) - interval(1))/m;
x = interval(1):step_size:interval(2);

y = discrete_sin(m, interval);
b = discrete_least_squares_approximation(m, interval, x, y);

for i = 1:m+1
    approximate_y(i) = discrete_approximate_function(b, x(i));
end

err = mean(abs(y - approximate_y).^2)

plot(x, y, 'r-')
hold on;
plot(x, approximate_y, 'b-')

xlabel("x")
ylabel("y")