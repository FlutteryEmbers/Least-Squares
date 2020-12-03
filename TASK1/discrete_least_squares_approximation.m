function b = discrete_least_squares_approximation(m, interval, x, y)
A = [];
for i = 1:(m+1)
    for j = 0:10
        A(i,j+1) = x(i)^j;
    end       
%     x = x + step_size;
end
AT = transpose(A);
b = inv(AT*A)* AT * y.';
end

