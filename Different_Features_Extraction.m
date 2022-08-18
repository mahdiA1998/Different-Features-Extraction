clc
clear
close all
load('s04.mat');
%% 6 features for every single channel signal obtained from each video
mean = zeros(40,40);
variance = zeros(40,40);
power = zeros(40,40);
medianFreq = zeros(40,40);
skewnessFreq = zeros(40,40);
gamaPerAlpha = zeros(40,40);
for i = 1:40
    for j = 1:40
        spectrum = pwelch(reshape(data(i,j,:),[1, size(data,3)]));
        mean(i,j) = sum(data(i,j,:))/size(data,3);
        variance(i,j) = var(data(i,j,:));
        power(i,j) = trapz(spectrum);
        medianFreq(i,j) = medfreq(reshape(data(i,j,:),[1, size(data,3)]));
        skewnessFreq(i, j) = skewness(spectrum);
        gamaPerAlpha(i, j) = bandpower(spectrum,128,[30 50])/bandpower(spectrum,128,[8 13]);
    end
end