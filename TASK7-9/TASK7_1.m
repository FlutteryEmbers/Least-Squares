T0 = readtable('0_train.csv');
[rows_0, columns_0] = size(T0);
train_M0 = T0{:,:};

T1 = readtable('1_train.csv');
[rows_1, columns_1] = size(T1);
train_M1 = T1{:,:};

y_0 = [];
for i = 1:rows_0
    y_0(i) = -1;
end

y_1 = [];
for i = 1:rows_1
    y_1(i) = 1;
end

y = [y_0, y_1];

M = [train_M0; train_M1];

step_size = 0.0000001;
b = [];
N = rows_0 + rows_1;
for i = 1:784
    b = [b 0];
end

test_err = [];
t = 0;
b_star = [];
err_star = 9999999999999;
index_star = -1;
for i = 1: 10000
    i
    index = mod(t, N) + 1;
    b = b + step_size * (y(index) - M(index,:) * b.' ) * M(index,:);
    t = t + 1;
    pred_y = sign(M * b.');
    train_confusion = confusionmat(y, pred_y)
    num_err = train_confusion(1,2) + train_confusion(2,1);
    train_err_rate = num_err / N;
    test_err = [test_err train_err_rate];
    if num_err < err_star
        index_star = i;
        err_star = num_err;
        b_star = b;
    end
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T0 = readtable('0_test.csv');
% [rows_0, columns_0] = size(T0);
% test_M0 = T0{:,:};
% 
% T1 = readtable('1_test.csv');
% [rows_1, columns_1] = size(T1);
% test_M1 = T1{:,:};
% 
% y_0 = [];
% for i = 1:rows_0
%     y_0(i) = -1;
% end
% 
% y_1 = [];
% for i = 1:rows_1
%     y_1(i) = 1;
% end
% 
% y = [y_0, y_1];
% testM = [test_M0; test_M1];
% pred_y = sign(testM * bt.');
% 
% test_confusion = confusionmat(y, pred_y)
% num_err = test_confusion(1,2) + test_confusion(2,1);
% test_err_rate = num_err / (rows_0 + rows_1)

