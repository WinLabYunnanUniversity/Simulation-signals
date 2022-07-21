ori_sig=simout.data;
ori_sig = reshape(ori_sig,2048*536,1);
ori_sig=ori_sig(1:1024000,1);
save('A16.mat','ori_sig');
