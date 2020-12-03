function y = discrete_approximate_function(b, x)
y = 0;

for i = 0:length(b)-1
    y = y + x^i*b(i+1);
end

end