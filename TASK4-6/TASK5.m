x = 1:6;
y = [2, 3, 5, 7, 11, 13];
M = Vandermonde(x, 2);
M
MT = transpose(M);
b = inv(MT*M)* MT * y.'

y_approx = polyval(b,x);


err = immse(y, y_approx)

plot(x, y, 'o')
hold on 
plot(x, y_approx, 'g-')

% b = polyfit(x, y, 2)