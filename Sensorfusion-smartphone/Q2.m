%% Q2
% Get the data from the phone:
%   [xhat, meas] = filterTemplate(); % save data
%%
clear; clc; close all;

%Load data:
load('Q2_data.mat') 

% Clear all NaN values
acc = meas.acc(:,~any(isnan(meas.acc),1));
gyr = meas.gyr(:,~any(isnan(meas.gyr),1));
mag = meas.mag(:,~any(isnan(meas.mag),1));

t_acc = meas.t(:,~any(isnan(meas.acc),1));
t_gyr = meas.t(:,~any(isnan(meas.gyr),1));
t_mag = meas.t(:,~any(isnan(meas.mag),1));

% -- 3. Calculate means and covariances --

% Accelerometer
mean_acc = mean(acc,2);
cov_acc = cov(acc');

% Gyroscope
mean_gyr = mean(gyr,2);
cov_gyr = cov(gyr');

% Magnetometer
mean_mag = mean(mag,2);
cov_mag = cov(mag');

% -- 2. Plot of the signals over time -- 
figure(1); hold on
% Accelerometer plot
subplot(3,1,1)
plot(t_acc,acc(1,:))
xlim([0 t_acc(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Acceleration [$m/s^2$]','Interpreter','latex')
legend('Accelerometer x-reading','Interpreter','latex')

% Gyro plot
subplot(3,1,2)
plot(t_gyr,gyr(1,:))
xlim([0 t_gyr(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Angular velocity [$rad/s$]','Interpreter','latex')
legend('Gyroscope x-reading','Interpreter','latex')

% Magnetometer plot
subplot(3,1,3)
plot(t_mag,mag(1,:))
xlim([0 t_mag(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Mikrotesla [$\mu T$]','Interpreter','latex')
legend('Magnetometer x-reading','Interpreter','latex')

% -- 1. Histograms plots -- 
pdf_acc=normpdf(-0.2:0.001:0.2,mean_acc(1),sqrt(cov_acc(1,1))); 
pdf_gyr=normpdf(-2*10^-3:0.0001:2*10^-3,mean_gyr(1),sqrt(cov_gyr(1,1)));
pdf_mag=normpdf(40:0.001:44,mean_mag(1),sqrt(cov_mag(1,1)));

figure(2)
subplot(1,3,1)
histogram(acc(1,:),'Normalization','pdf')
hold on
plot(-0.2:0.001:0.2,pdf_acc,'--r','linewidth',1.5)

subplot(1,3,2)
histogram(gyr(1,:),'Normalization','pdf')
hold on
plot(-2*10^-3:0.0001:2*10^-3,pdf_gyr,'--r','linewidth',1.5)

subplot(1,3,3)
histogram(mag(1,:),'Normalization','pdf')
hold on
plot(40:0.001:44,pdf_mag,'--r','linewidth',1.5)

















