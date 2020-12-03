%Logistic version of Task 8
for i=1:10
    for j=1:9
        err(i, j) = 0;
    end
end

for i=1:10
    for j=1:i
        if not(i ==j)
            [train_err_rate, test_err_rate] = logistic_err_rate(i,j);
            err(i, j) = test_err_rate;
            err(j, i) = train_err_rate;            
        end
    end
end

err
writematrix(err, 'result_logistic.csv');