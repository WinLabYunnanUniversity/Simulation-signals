clear
%信号产生
forwardPresetConfig = evdoForwardReferenceChannels('RevA-5120-2-64',150);
forwardPresetConfig.OversamplingRatio=2;%过采样率
forwardPresetWaveform = evdoForwardWaveformGenerator(forwardPresetConfig);

ori_sig = forwardPresetWaveform(1:1024000,1);
save('A3.mat','ori_sig')

