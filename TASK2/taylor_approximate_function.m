function y = taylor_approximate_function(x)
% 
% syms a
% func = taylor(sin(a),'Order', 10);

y = x^9/362880 - x^7/5040 + x^5/120 - x^3/6 + x;


end