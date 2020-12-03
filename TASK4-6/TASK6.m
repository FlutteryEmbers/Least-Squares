b = [0,0,0];
step_size = 0.0002;
err = 10000;
x = 1:6;
y = [2, 3, 5, 7, 11, 13];
err = 100000000;
M = Vandermonde(x, 2);
t = 0;
N = 6;
while 1
    index = mod(t, N) + 1;
    t = t+1;
    b = b + step_size * (y(index) - M(index,:) * b.' ) * M(index,:);
    y_approx = polyval(b,x);
    err = immse(y_approx, y);
    if err <= 0.1821*(1.2)
        break
    end
end

b
t
err
plot(x, y, 'o')
hold on 
plot(x, y_approx, 'g-')