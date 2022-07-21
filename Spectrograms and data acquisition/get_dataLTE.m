%循环1000次，获取数据4GLTE-2010—2025MHz
tic; 
Fs=3.84e6;
test = ori_sig(1+20480*30:20480+20480*30,1);
test = test/sqrt(mean(abs(test).^2)); %能量归一化
spectrum_scope = dsp.SpectrumAnalyzer('SampleRate', Fs,'Method','Filter Bank');
% spectrum_scope = dsp.SpectrumAnalyzer('SampleRate', Fs);
spectrum_scope(test);%对时域样本进行频谱的转换
release(spectrum_scope);
spectrum_waveform_ray=getSpectrumData(spectrum_scope);  %获取数据
data = spectrum_waveform_ray.Spectrum;
% data1=data{1}; plot(data1)
% ylim([-120,0]);
% xlabel('Frequency (MHz)')
% ylabel('dBm');
d=3.3*data{1};%cell格式转换

new_data=[];id=1;
%采样
for ik=1:1024
   if mod(ik,5)==0
       new_data(id)=d(ik);
       id=id+1;
   end   
end
  
%循环1000次生成多张波形图
sig=[];
for k=1:1
    len_sig=1024;
    noise_dm=normrnd(-100,0.5,len_sig,1)';% 生成均值mu,标准差为sigmax，m行n列的正态分布的噪声  转置'
    index_c=len_sig/2;index_l=index_c-length(new_data)/2;index_r=index_c+length(new_data)/2;  %信号左、中、右
    new_sig = noise_dm;
    new_sig(:,index_l:index_r-1)=new_data; %替换
    % plot(new_sig)
    xi=linspace(2010,2025,len_sig);
    figure(1);
    plot(xi,new_sig);
    % title('2010—2025MHz频谱图');
    xlabel('Frequency (MHz)')
    ylabel('dBm');
    ylim([-120,20]);
    xlim([2010,2025]);
    set(gca,'xtick',2010:3:2025)
    sig(k,:)=new_sig;%数据拼接
    k1=k-1;
%     filename=['image\6.28mp4\4G\',num2str(k1),'.png'];
%     saveas(gcf,filename)
end
% save('dataset\4G1.mat','sig');
timett=toc;%计算仿真1000次的时长