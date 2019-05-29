%% Q2
% Get the data from the phone:
%   [xhat, meas] = filterTemplate(); % save data
%%
clear; clc; close all;

%Load data:
load('Q2_data.mat') 

% -- Calculate means and covariances --

% Accelerometer
mean_acc = mean(meas.acc(:,~any(isnan(meas.acc),1)),2);
cov_acc = cov(meas.acc(:,~any(isnan(meas.acc),1))');

% Gyroscope
mean_gyr = mean(meas.gyr(:,~any(isnan(meas.gyr),1)),2);
cov_gyr = cov(meas.gyr(:,~any(isnan(meas.gyr),1))');

% Magnetometer
mean_mag = mean(meas.mag(:,~any(isnan(meas.mag),1)),2);
cov_mag = cov(meas.mag(:,~any(isnan(meas.mag),1))');






