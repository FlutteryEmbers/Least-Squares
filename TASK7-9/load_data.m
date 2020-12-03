clear;
T = readtable('mnist_train.csv');
[rows, column] = size(T)
X = {};
for i = 1: 10
    X{i} = []; 
end
T{1, 1}
for i = 1:rows
    i
    X{T{i,1} + 1} = [X{T{i,1}+1}; T{i,2:column}];
end
