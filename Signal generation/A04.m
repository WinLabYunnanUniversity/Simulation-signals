ori_sig=simout.data;
ori_sig = reshape(ori_sig,2048*1501,1);
ori_sig=resample(ori_sig,30.72e6/2,30.72e6);
ori_sig=ori_sig(1:1024000,1);
save('A4.mat','ori_sig');
