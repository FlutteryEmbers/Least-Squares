for i=1:10
    writematrix(X{i}, append(int2str(i-1), '.csv'))
end