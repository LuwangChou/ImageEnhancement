matData = load('SSIMOnTID.mat');
SSIMOnTID = matData.SSIMOnTID;
SSIM_TID_SROCC = corr(SSIMOnTID(:,1), SSIMOnTID(:,2), 'type', 'spearman');
SSIM_TID_KROCC = corr(SSIMOnTID(:,1), SSIMOnTID(:,2), 'type', 'kendall');