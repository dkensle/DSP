clear
clc

a=arduino();
j= 1:1:1000;
for i=1:1000
data(i) = readVoltage(a,'A0');
end
N=randn(size(j));
NoisyData = data + N;


%Create Transfer Functions for filters
%Butterworth
[b1,a1] = butter(5, .033, 'low');
[d1,c1] = butter(5, .066, 'low');
[f1,e1] = butter(5, .1, 'low');
[h1,g1] = butter(5, .133, 'low');
[j1, i1] = butter(5, .166, 'low');
[l1, k1] = butter(5, .2, 'low');


%Create Data Filters
DataFilterButter033 = filter(b1,a1,NoisyData);
DataFilterButter066 = filter(d1, c1, NoisyData);
DataFilterButter1 = filter(f1,e1, NoisyData);
DataFilterButter133 = filter(h1,g1, NoisyData);
DataFilterButter166 = filter(j1,k1, NoisyData);
DataFilterButter2 = filter(l1,k1, NoisyData);



%Chebyshev
[q,p] = cheby1(5, .02, .05, 'low');

%Plot the data
figure();
p2=plot(j,data, 'LineStyle', '-', 'Color', [0.8,0,0], 'LineWidth', 2);
axis([0,1000,0,5]);

%Plot the data with added Matlab noise
figure();
p1=plot(j,NoisyData, 'LineStyle', '-', 'Color', [0,0,0.8], 'LineWidth', .5);


%FFT to see frequency and plot it
z=0:.001:.999;
FastFT = fft(data);
magx = abs(FastFT);
figure();
p10=plot(z, magx, 'LineStyle', '-', 'Color', [0.8,0,0], 'LineWidth',1);




%Plot filters
figure();
p3=plot(j,DataFilterButter1, 'LineStyle', '-', 'Color', [0,0.8,0], 'LineWidth', 1);
axis([0,1000,0,5]);
hold on;
%p4=plot(j,DataFilterChebyshev, 'LineStyle','-','Color', [0.8,0.8,0],'LineWidth',1);
p5=plot(j, DataFilterButter05, 'LineStyle', '-', 'Color', [0,0,0.8], 'LineWidth', 1);
p6=plot(j, DataFilterButter01, 'LineStyle', '-', 'Color', [0.8,0,0], 'LineWidth', 1);
legend('Butterworth with .1 wc', 'Butterworth with .05 wc', 'Butterworth with .01 wc');%, 'Elliptic');