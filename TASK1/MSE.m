function output = MSE(y1,y2)
y = y1 - y2;
output = 0;
for i = 1:length(y1)
    output = output + y(i)^2;
end
end

