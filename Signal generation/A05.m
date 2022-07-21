ori_sig=simout.data;
ori_sig = reshape(ori_sig,256*9601,1);
ori_sig=resample(ori_sig,4.92e6/2,4.92e6);
ori_sig=ori_sig(1:1024000,1);
save('A5.mat','ori_sig');
