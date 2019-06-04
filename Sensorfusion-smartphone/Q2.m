%% Q2
% Get the data from the phone:
%   [xhat, meas] = filterTemplate(); % save data
clear; clc; close all;
%%
close all;
%Load data:
%load('Q2_data.mat')
load('Q2_data_new.mat')

% Clear all NaN values
acc = meas.acc(:,~any(isnan(meas.acc),1));
gyr = meas.gyr(:,~any(isnan(meas.gyr),1));
mag = meas.mag(:,~any(isnan(meas.mag),1));

t_acc = meas.t(:,~any(isnan(meas.acc),1));
t_gyr = meas.t(:,~any(isnan(meas.gyr),1));
t_mag = meas.t(:,~any(isnan(meas.mag),1));

% Cut off bad data in the end
acc = acc(:,1:end-300);
gyr = gyr(:,1:end-300);
mag = mag(:,1:end-300);

t_acc = t_acc(1:end-300);
t_gyr = t_gyr(1:end-300);
t_mag = t_mag(1:end-300);

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
plot(t_acc(:),acc(3,:))
xlim([0 t_acc(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Acceleration [$m/s^2$]','Interpreter','latex')
legend('Accelerometer z-reading','Interpreter','latex')
title('Accelerometer')

% Gyro plot
subplot(3,1,2)
plot(t_gyr,gyr(3,:))    
xlim([0 t_gyr(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Angular velocity [$rad/s$]','Interpreter','latex')
legend('Gyroscope z-reading','Interpreter','latex')
title('Gyroscope')

% Magnetometer plot
subplot(3,1,3)
plot(t_mag,mag(3,:))
xlim([0 t_mag(end)])
xlabel('Time [s]','Interpreter','latex')
ylabel('Mikrotesla [$\mu T$]','Interpreter','latex')
legend('Magnetometer z-reading','Interpreter','latex')
title('Magnetometer')

% -- 1. Histograms plots -- 
pdf_acc=normpdf(9.7:0.001:10,mean_acc(3),sqrt(cov_acc(3,3))); 
pdf_gyr=normpdf(-5*10^-3:0.0001:5*10^-3,mean_gyr(3),sqrt(cov_gyr(3,3)));
pdf_mag=normpdf(-50:0.001:-40,mean_mag(3),sqrt(cov_mag(3,3)));

% Accelerometer
figure(2)
subplot(1,3,1)
histogram(acc(3,:),'Normalization','pdf')
hold on
plot(9.7:0.001:10,pdf_acc,'--r','linewidth',1.5)
xlabel('Acceleration [$m/s^2$]','Interpreter','latex')
ylabel('Probability density')
legend('Histogram of z-measurement','Normal PDF of x-measurements','Interpreter','latex')
title('Accelerometer')
xlim([9.7 10])
% Gyroscope
subplot(1,3,2)
histogram(gyr(3,:),'Normalization','pdf')
hold on
plot(-5*10^-3:0.0001:5*10^-3,pdf_gyr,'--r','linewidth',1.5)
xlabel('Angular velocity [$rad/s$]','Interpreter','latex')
ylabel('Probability density')
legend('Histogram of z-measurement','Normal PDF of x-measurements','Interpreter','latex')
title('Gyroscope')

% Magnetometer
subplot(1,3,3)
histogram(mag(3,:),'Normalization','pdf')
hold on
plot(-50:0.001:-40,pdf_mag,'--r','linewidth',1.5)
xlabel('Mikrotesla [$\mu T$]','Interpreter','latex')
ylabel('Probability density')
legend('Histogram of z-measurement','Normal PDF of x-measurements','Interpreter','latex')
title('Magnetometer')

%%
clear all 
close all
clc
showIP();
startup();
[test, test2] = filterTemplate46();
%[own,google] = filterTemplate9();
%[test, test2] = filterTemplate();
%% q to Euler: 
close all;
% Clear all NaN values
own_clean = own.x(:,~any(isnan(own.x),1));
google_clean = google.orient(:,~any(isnan(google.orient),1));
t_own = own.t(:,~any(isnan(own.x),1));
t_google = google.t(:,~any(isnan(google.orient),1));

euler_own = q2euler(own_clean);
euler_google = q2euler(google_clean);

figure(1)
sgtitle('EKF filter using only gyroscope and magnetometer readings','Interpreter','latex')
title('EKF filter using only accelerometer and magnetometer readings')
hold on
subplot(1,3,1)
plot(t_own,euler_own(1,:))
hold on
plot(t_google,euler_google(1,:))
legend('EKF filter','Google software filter','Interpreter','latex')
ylabel('Angle [rad]','Interpreter','latex')
xlabel('Time [s]')
title('Roll $\theta$','Interpreter','latex')
xlim([t_own(1) t_own(end)])

subplot(1,3,2)
plot(t_own,euler_own(2,:))
hold on
plot(t_google,euler_google(2,:))
legend('EKF filter','Google software filter','Interpreter','latex')
ylabel('Angle [rad]','Interpreter','latex')
xlabel('Time [s]')
title('Pitch $\varphi$','Interpreter','latex')
xlim([t_own(1) t_own(end)])

subplot(1,3,3)
plot(t_own,euler_own(3,:))
hold on
plot(t_google,euler_google(3,:))
legend('EKF filter','Google software filter','Interpreter','latex')
ylabel('Angle [rad]','Interpreter','latex')
xlabel('Time [s]')
title('Yaw $\psi$','Interpreter','latex')
xlim([t_own(1) t_own(end)])









