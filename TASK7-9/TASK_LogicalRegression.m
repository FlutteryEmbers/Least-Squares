M = [];
y = [];
rows = 0;
for i=1:10
    i
    T = readtable(append( int2str(i-1), '_train.csv'));
    [rows_i, col] = size(T);
    rows = rows + rows_i;
    for j = 1:rows_i
        M = [M; T{j,:}];
        y = [y;i];
    end
end
cat = categorical(y);
[b,dev,stats] = mnrfit(M,cat);
y_predit_M = M * b;

for i = 1:21003
    [S, index] = max(y_predit_M(i,:));
    y_predit(i) = index;
end
train = confusionmat(y, y_predit)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test_y_M = [];
% test_M = [];
% test_y = [];
% for i=1:10
%     T = readtable(append( int2str(i-1), '_test.csv'));
%     [rows_i, col] = size(T);
%     rows = rows + rows_i;
%     for j = 1:rows_i
%         test_M = [test_M; T{j,:}];
%         test_y = [test_y i];
%     end
% end
% test_y_predit = [];
% test_y_predit_M = test_M * b;
% 
% for i = 1:length(test_y)
%     [S, index] = max(test_y_predit_M(i,:));
%     test_y_predit(i) = index;
% end
% test = confusionmat(test_y, test_y_predit)