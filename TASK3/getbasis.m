clear
syms x
for i=0:10
w(i+1) = x^i;
end
% [1, x, x^2, x^3, x^4, x^5, x^6, x^7, x^8, x^9, x^10]
w
v = [x^0];
for i=2:11
    eq = w(i);
%     eq
    for j=2:i
        n = int(w(i)*v(j-1) / 10, [0 10]);
        d = int(v(j-1)*v(j-1) / 10, [0, 10]);
        eq = eq - n/d*v(j-1);
    end
    v(i) = eq;
%     eq
end
v
eq = 0;
func = sin(x);
for i=1:11
    c = vpa(int(v(i) * func, [0, 10]))/vpa(int(v(i)*v(i), [0, 10]));
    eq = eq + c*v(i);
    
    i, eq
end
eq