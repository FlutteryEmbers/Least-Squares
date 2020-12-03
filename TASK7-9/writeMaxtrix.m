sum = 0;
sum_err = 0;
for i=1:10
    for j = 1:10
        if not(i==j)
            sum_err = sum_err + test(i, j);
        end
        sum = sum + test(i, j);
    end
end

sum_err/sum
% writematrix(train, 'result_multiclasstrain.csv');
% writematrix(test, 'result_multiclasstest.csv');