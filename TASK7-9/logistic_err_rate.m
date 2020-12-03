function [train_err_rate, test_err_rate] = logistic_err_rate(set1,set2)
set1 = set1 - 1;
set2 = set2 - 1;
T0 = readtable(append(int2str(set1),'_train.csv'));
[rows_0, columns_0] = size(T0);
train_M0 = T0{:,:};

T1 = readtable(append(int2str(set2),'_train.csv'));
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

cat = categorical(y);
b = glmfit(M,cat,'binomial','link','logit');
% [b,dev,stats] = mnrfit(M,cat);
b_1 = b(1);
b_2 = b(2:785);
z = b_1 + M*b_2;
for i = 1: rows_0 + rows_1
    if 1 ./ (1 + exp(-z(i))) < 0.5
        y_predit(i) = -1;
    else
        y_predit(i) = 1;
    end
    
end
train_confusion = confusionmat(y, y_predit);
num_err = train_confusion(1,2) + train_confusion(2,1);
train_err_rate = num_err / (rows_0 + rows_1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T0 = readtable(append(int2str(set1),'_test.csv'));
[rows_0, columns_0] = size(T0);
test_M0 = T0{:,:};

T1 = readtable(append(int2str(set2),'_test.csv'));
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

z_test = b_1 + testM*b_2;
for i = 1: rows_0 + rows_1
    if 1 ./ (1 + exp(-z_test(i))) < 0.5
        y_predit_test(i) = -1;
    else
        y_predit_test(i) = 1;
    end
    
end
test_confusion = confusionmat(y, y_predit_test);
num_err = test_confusion(1,2) + test_confusion(2,1);
test_err_rate = num_err / (rows_0 + rows_1);
end

