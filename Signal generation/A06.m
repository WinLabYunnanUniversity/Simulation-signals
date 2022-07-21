clear
cfggsmdl = gsmDownlinkConfig;  %进行GSM下行信号的生成
cfggsmdl.SamplesPerSymbol=4;   %每个符号采4个样点
wfInfo = gsmInfo(cfggsmdl);
Rs = wfInfo.SampleRate;
waveform = gsmFrame(cfggsmdl,205);
ori_sig = waveform(1:1024000,1);   %仿真1024000个点
save('A6.mat','ori_sig')
