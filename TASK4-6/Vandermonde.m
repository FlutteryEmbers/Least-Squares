function M = Vandermonde(x, P)
    M = [];
    for i = 0:length(x)-1
        for j = 0:P
            M(i+1,P-j+1) = x(i+1)^j;
        end       
%     x = x + step_size;
    end
end