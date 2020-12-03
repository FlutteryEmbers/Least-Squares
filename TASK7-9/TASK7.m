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
MT = transpose(M);
% b = inv(MT*M)*MT*transpose(y);
b = M\transpose(y);
pred_y = sign(M * b);
train_confusion = confusionmat(y, pred_y)
num_err = train_confusion(1,2) + train_confusion(2,1);
train_err_rate = num_err / (rows_0 + rows_1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T0 = readtable('0_test.csv');
[rows_0, columns_0] = size(T0);
test_M0 = T0{:,:};

T1 = readtable('1_test.csv');
[rows_1, columns_1] = size(T1);
test_M1 = T1{:,:};

y_0 = [];
for i = 1:rows_0
    y_0(i) = -1;
end

y_1 = [];
for i = 1:rows_1
    y_1(i) = 1;
end

y = [y_0, y_1];
testM = [test_M0; test_M1];
pred_y = sign(testM * b);

test_confusion = confusionmat(y, pred_y)
num_err = test_confusion(1,2) + test_confusion(2,1);
test_err_rate = num_err / (rows_0 + rows_1)

