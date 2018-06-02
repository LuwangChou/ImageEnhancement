function  stdA  = count_StdDev( matA )
%Std Dev,标准差即为方差的算式平方根
%Var = 1/NM  * sum(i,j=1,N,M) ( f(i,j) - mean(f(i,j))^2 )
%Std Dev = sqrt(Var);

% 测试 matA =[1,2;1,2];
average = mean(mean(matA,1),2);
[row,col] = size(matA);
varA=0;

for i=1:row
    for j=1:col
       varA = power(matA(i,j)-average,2);
    end
end
stdA = sqrt( 1/(row*col) * varA );

end

