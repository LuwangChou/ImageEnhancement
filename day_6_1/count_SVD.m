function [ LLnew ] = count_SVD( ca, caHq )
% ���� SVD ����ֵ����
%����ca �� ���⻯���caHq,�����ظı���ca ����ֵ

[U1,S1,V1] = svd(caHq);

[U2,S2,V2] = svd(ca);

beta = max(S1)/max(S2);

Snew =beta * S2;

LLnew=U2*Snew*V2';

end

