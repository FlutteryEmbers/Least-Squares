clear;
interval = [0, 10];
ma = [10, 100, 1000, 10000];
k = [0, 0, 0, 0];

m = 1000;

step_size = (interval(2) - interval(1))/m;
x = interval(1):step_size:interval(2);

y = discrete_sin(m, interval);

for i = 1:m+1
    approximate_y(i) = taylor_approximate_function(i);
end

err = immse(y, approximate_y)


figure();
plot(x, approximate_y, 'r-')
hold on
plot(x, y, 'b-')