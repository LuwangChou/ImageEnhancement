function  covAB  = count_Covar( A,B )
%Std Dev,标准差即为方差的算式平方根
%Var = 1/NM  * sum(i,j=1,N,M) ( f(i,j) - mean(f(i,j))^2 )
%Std Dev = sqrt(Var);

% 测试 A =[1,2;1,2];
averageA = mean(mean(A,1),2);
averageB = mean(mean(B,1),2);
[row,col] = size(A);
A = double(A);
B = double(B);
varAB=0;

for i=1:row
    for j=1:col
       varAB = (A(i,j)-averageA)*(B(i,j)-averageB);
    end
end
covAB = sqrt( 1/(row*col-1) * varAB );

end

