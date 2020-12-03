for i = 1:10
    T = readtable(append(int2str(i-1),'.csv'));
    [rows, columns] = size(T);

    rand_id = randperm(rows);
    
    divided_rows = round(rows/2);
    M = [];
    for j = 1: divided_rows
        
        M = [M; T{rand_id(j), :}];
    end
    writematrix(M, append(int2str(i-1),'_train.csv'));

    M = [];
    for j = divided_rows + 1: rows
        M = [M; T{rand_id(j), :}];
    end
    writematrix(M, append(int2str(i-1),'_test.csv'));
end
