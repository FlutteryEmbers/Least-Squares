function y = discrete_sin(m, interval)
step_size = (interval(2) - interval(1))/m;
x = interval(1);
for i = 1:(m+1)
    y(i) = sin(x);
    x = x + step_size;
end

end

