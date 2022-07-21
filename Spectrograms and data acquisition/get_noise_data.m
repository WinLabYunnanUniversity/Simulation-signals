%底噪为-100dBm，标准差为0.5的噪声
%循环1000次生成多张波形图,获取数据
tic;
sig=[];
for k=1:1000
    len_sig=1024;
    noise_dm=normrnd(-100,0.5,1,len_sig);% 生成均值mu,标准差为sigmax，m行n列的正态分布的噪声  
    xi=linspace(20.01,21.00,len_sig);
    figure(1);
    plot(xi,noise_dm);
    % title('100.6—101.0MHz频谱图');
    xlabel('Frequency (MHz)')
    ylabel('dBm');
    ylim([-110,-90]);
    xlim([20.01,21.00]);
    set(gca,'xtick',20.01:0.198:21.00);
    sig(k,:)=noise_dm;
    k1=k-1;
    filename=['image\noise1000\',num2str(k1),'.png'];
    saveas(gcf,filename)
   
end
save('datest\noise1000.mat','sig');
timett=toc;%计算仿真1000次的时长