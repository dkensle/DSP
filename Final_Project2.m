clear
clc

a=arduino();
j= 1:1:1000;
for i=1:1000
data(i) = readVoltage(a,'A0');
end

%Plot the data
figure();
p1=plot(j,data, 'LineStyle', '-', 'Color', [0.8,0,0], 'LineWidth', 2);
axis([0,1000,0,5]);
title('Data');
xlabel('samples');
ylabel('voltage');

%Create noise and add to data
N=randn(size(j));
NoisyData = data + N;


%Plot the data with added Matlab noise
figure();
p2=plot(j,NoisyData, 'LineStyle', '-', 'Color', [0,0,0.8], 'LineWidth', .5);
title('Noisy Data');
xlabel('samples');
ylabel('voltage');


%FFT to see frequency and plot it
z=0:.001:.999;
FastFT = fft(data);
magx = abs(FastFT);
figure();
p3=plot(z, magx, 'LineStyle', '-', 'Color', [0.8,0,0], 'LineWidth',1);
title('Fast Fourier Transform');
xlabel('frequency, \omega');
ylabel('|H(j\omega)|');


%Create Butterworth Transfer Functions
[b1,a1] = butter(5, .005, 'low');
[d1,c1] = butter(5, .01, 'low');
[f1,e1] = butter(5, .015, 'low');
[h1,g1] = butter(5, .02, 'low');
[j1,i1] = butter(5, .025, 'low');
[l1,k1] = butter(5, .03, 'low');
[n1,m1] = butter(5, .035, 'low');
[p1,o1] = butter(5, .04, 'low');
[r1,q1] = butter(5, .045, 'low');
[t1,s1] = butter(5, .05, 'low');
[v1,u1] = butter(5, .1, 'low');
[x1, w1] = butter(5, .5, 'low');



%Create Data Filters for Butterworth Transfer Functions
DataFilterButter005 = filter(b1,a1,NoisyData);
DataFilterButter01 = filter(d1, c1, NoisyData);
DataFilterButter015 = filter(f1,e1, NoisyData);
DataFilterButter02 = filter(h1,g1, NoisyData);
DataFilterButter025 = filter(j1,i1, NoisyData);
DataFilterButter03 = filter(l1,k1, NoisyData);
DataFilterButter035 = filter(n1,m1, NoisyData);
DataFilterButter04 = filter(p1,o1, NoisyData);
DataFilterButter045 = filter(r1,q1, NoisyData);
DataFilterButter05 = filter(t1,s1, NoisyData);
DataFilterButter1 = filter(v1,u1, NoisyData);
DataFilterButter5 = filter(x1,w1, NoisyData);



%Create Transfer Functions for Chebyshev
[b2,a2] = cheby1(5, .02, .005, 'low');
[d2,c2] = cheby1(5, .02, .01, 'low');
[f2,e2] = cheby1(5, .02, .015, 'low');
[h2,g2] = cheby1(5, .02, .02, 'low');
[j2,i2] = cheby1(5, .02, .025, 'low');
[l2,k2] = cheby1(5, .02, .03, 'low');
[n2,m2] = cheby1(5, .02, .035, 'low');
[p2,o2] = cheby1(5, .02, .04, 'low');
[r2,q2] = cheby1(5, .02, .045, 'low');
[t2,s2] = cheby1(5, .02, .05, 'low');
[v2,u2] = cheby1(5, .02, .1, 'low');
[x2,w2] = cheby1(5, .02, .5, 'low');


%Create Filters for Chebyshev
DataFilterChebyshev005 = filter(b2,a2, NoisyData);
DataFilterChebyshev01 = filter(d2,c2, NoisyData);
DataFilterChebyshev015 = filter(f2,e2, NoisyData);
DataFilterChebyshev02 = filter(h2,g2, NoisyData);
DataFilterChebyshev025 = filter(j2,i2, NoisyData);
DataFilterChebyshev03 = filter(l2,k2, NoisyData);
DataFilterChebyshev035 = filter(n2,m2, NoisyData);
DataFilterChebyshev04 = filter(p2,o2, NoisyData);
DataFilterChebyshev045 = filter(r2,q2, NoisyData);
DataFilterChebyshev05 = filter(t2,s2, NoisyData);
DataFilterChebyshev1 = filter(v2,u2, NoisyData);
DataFilterChebyshev5 = filter(x2,w2, NoisyData);


%Plot butterworth filters
figure();
p4=plot(j,DataFilterButter005, 'LineStyle', '-', 'Color', 'blue', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .005');
xlabel('samples');
ylabel('voltage');

figure();
p5=plot(j, DataFilterButter01, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .01');
xlabel('samples');
ylabel('voltage');

figure();
p6=plot(j, DataFilterButter015, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .015');
xlabel('samples');
ylabel('voltage');

figure();
p7=plot(j, DataFilterButter02, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .02');
xlabel('samples');
ylabel('voltage');

figure();
p8=plot(j, DataFilterButter025, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .025');
xlabel('samples');
ylabel('voltage');

figure();
p9=plot(j, DataFilterButter03, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .03');
xlabel('samples');
ylabel('voltage');

figure();
p10=plot(j, DataFilterButter035, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .035');
xlabel('samples');
ylabel('voltage');

figure();
p11=plot(j, DataFilterButter04, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .04');
xlabel('samples');
ylabel('voltage');

figure();
p12=plot(j, DataFilterButter045, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .045');
xlabel('samples');
ylabel('voltage');

figure();
p13=plot(j, DataFilterButter05, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .05');
xlabel('samples');
ylabel('voltage');

figure();
p14=plot(j, DataFilterButter1, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .1');
xlabel('samples');
ylabel('voltage');

figure();
p15=plot(j, DataFilterButter5, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0,1000,-0.5,5]);
title('Butterworth filter with cutoff frequency, \omega_c, of .5');
xlabel('samples');
ylabel('voltage');



%plot chebyshev filters
figure();
p16=plot(j, DataFilterChebyshev005, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .005');
xlabel('samples');
ylabel('voltage');

figure();
p17=plot(j, DataFilterChebyshev01, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .01');
xlabel('samples');
ylabel('voltage');

figure();
p18=plot(j, DataFilterChebyshev015, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .015');
xlabel('samples');
ylabel('voltage');

figure();
p19=plot(j, DataFilterChebyshev02, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .02');
xlabel('samples');
ylabel('voltage');

figure();
p20=plot(j, DataFilterChebyshev025, 'LineStyle', '-', 'Color', 'g', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .025');
xlabel('samples');
ylabel('voltage');

figure();
p21=plot(j, DataFilterChebyshev03, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .03');
xlabel('samples');
ylabel('voltage');

figure();
p22=plot(j, DataFilterChebyshev035, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .035');
xlabel('samples');
ylabel('voltage');

figure();
p23=plot(j, DataFilterChebyshev04, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .04');
xlabel('samples');
ylabel('voltage');

figure();
p24=plot(j, DataFilterChebyshev045, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .045');
xlabel('samples');
ylabel('voltage');

figure();
p25=plot(j, DataFilterChebyshev05, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .05');
xlabel('samples');
ylabel('voltage');

figure();
p26=plot(j, DataFilterChebyshev1, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .1');
xlabel('samples');
ylabel('voltage');

figure();
p27=plot(j, DataFilterChebyshev5, 'LineStyle', '-', 'Color', 'green', 'LineWidth', 1);
axis([0, 1000, -0.5, 5]);
title('Chebyshev filter with cutoff frequency, \omega_c, of .5');
xlabel('samples');
ylabel('voltage');




