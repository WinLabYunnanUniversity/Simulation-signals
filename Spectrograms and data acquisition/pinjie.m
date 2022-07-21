%画87—108MHz频谱图(14个频段叠加)    
Fs=228000;
% test = ori_sig(1:200000,1);
sig=[];
for i=1:14
    i1=i-1;
    test = ori_sig(1+51200*i1:51200+51200*i1,1);
    test = test/sqrt(mean(abs(test).^2)); %能量归一化
    spectrum_scope = dsp.SpectrumAnalyzer('SampleRate', Fs,'Method','Filter Bank');
    % spectrum_scope = dsp.SpectrumAnalyzer('SampleRate', Fs);
    spectrum_scope(test);
    release(spectrum_scope);
    spectrum_waveform_ray=getSpectrumData(spectrum_scope);  %获取数据
    data = spectrum_waveform_ray.Spectrum;
    % data1=data{1}; plot(data1)
    d=0.65*data{1};%cell格式转换
    
    new_data=[];id=1;
    %采样
    for ik=1:1024
       if mod(ik,2)==0
           new_data(id)=d(ik);
           id=id+1;
       end   
    end
    
    len_sig=1024;
    noise_dm=normrnd(-100,0.5,len_sig,1)';% 生成均值mu,标准差为sigmax，m行n列的正态分布的噪声  转置'
    index_c=len_sig/2;index_l=index_c-length(new_data)/2;index_r=index_c+length(new_data)/2;  %信号左、中、右
    new_sig = noise_dm;
    new_sig(:,index_l:index_r-1)=new_data; %替换
    
    sig=[sig,new_sig];
    
end

xi=linspace(87,108,length(sig));
figure(1);
plot(xi,sig);
% title('87—108MHz频谱图');
xlabel('Frequency (MHz)')
ylabel('dBm');
ylim([-120,20]);
xlim([87,108]);
set(gca,'xtick',87:3:108);
% set(gca,'LooseInset',[0,0,0,0]); %切白边
% filename=['image/new/FM/87—108MHz.png'];
% saveas(gcf,filename)
