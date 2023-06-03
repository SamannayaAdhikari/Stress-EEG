data= Clean_data;
data= data';
win_size= 128;

for i=1:32
cz= data(:,i);

hamming_window= hamming(win_size);
windowed_signal= cz(1:win_size).*hamming_window;

fft_output= fft(windowed_signal);

power_spectrum=abs(fft_output).^2;

fs=128;
f=(0:win_size-1)*(fs/win_size);

%figure;
%plot(fft_output);
%plot(f, power_spectrum);

mean_power=mean(power_spectrum);
median_power=median(power_spectrum);
variance_power= var(power_spectrum);
std_power=std(power_spectrum);
skewness_power= std(power_spectrum);
kurtosis_power=kurtosis(power_spectrum);




delta_band=[0.5 4];
theta_band=[4 8];
alpha_band=[8 13];
beta_band=[13 30];
gamma_band= [30 100];

delta_power = sum(power_spectrum(f>=delta_band(1) & f<=delta_band(2)));
theta_power = sum(power_spectrum(f>=theta_band(1) & f<=theta_band(2)));
alpha_power = sum(power_spectrum(f>=alpha_band(1) & f<=alpha_band(2)));
beta_power = sum(power_spectrum(f>=beta_band(1) & f<=beta_band(2)));
gamma_power = sum(power_spectrum(f>=gamma_band(1) & f<=gamma_band(2)));


theta_alpha_ratio=theta_power/alpha_power;
beta_alpha_ratio=beta_power/alpha_power;
ratio_one=(theta_power+alpha_power)/beta_power;
theta_beta_ratio=theta_power/beta_power;
gamma_delta_ratio= gamma_power/delta_power;
ratio_two=(theta_power+alpha_power)/(alpha_power+beta_power);
ratio_three=(gamma_power+beta_power)/(delta_power+alpha_power);



[max_power, max_idx]=max(power_spectrum);
peak_frequency=f(max_idx);


fprintf('mean power : %2f\n', mean_power);
feature_f(i,1)=mean_power;
fprintf('median power : %2f\n', median_power);
feature_f(i,2)=median_power;
fprintf('variance : %2f\n', variance_power);
feature_f(i,3)=variance_power;
fprintf('std : %2f\n', std_power);
feature_f(i,4)=std_power;
fprintf('skewness : %2f\n', skewness_power);
feature_f(i,5)=skewness_power;
fprintf('kurtosis : %2f\n', kurtosis_power);
feature_f(i,6)=kurtosis_power;


fprintf('Delta power : %.2f\n', delta_power);
feature_f(i,7)=delta_power;
fprintf('Theta_power : %.2f\n', theta_power);
feature_f(i,8)=theta_power;
fprintf('Alpha power : %.2f\n', alpha_power);
feature_f(i,9)=alpha_power;
fprintf('Beta power : %.2f\n', beta_power);
feature_f(i,10)=beta_power;
fprintf('gamma power : %.2f\n', gamma_power);
feature_f(i,11)=gamma_power;
fprintf('peak frequency : %2f\n', peak_frequency);
feature_f(i,12)=peak_frequency;


fprintf('theta to alpha ratio : %2f\n', theta_alpha_ratio);
feature_f(i,13)=theta_alpha_ratio;
fprintf('beta to alpha ratio : %2f\n', beta_alpha_ratio);
feature_f(i,14)=beta_alpha_ratio;
fprintf('theta to beta ratio : %2f\n', theta_beta_ratio);
feature_f(i,15)=theta_beta_ratio;
fprintf('gamma to delta ratio : %2f\n', gamma_delta_ratio);
feature_f(i,16)=gamma_delta_ratio;
fprintf('theta plus alpha by beta : %2f\n', ratio_one);
feature_f(i,17)=ratio_one;
fprintf('theta plus alpha by alpha plus beta : %2f\n', ratio_two);
feature_f(i,18)=ratio_two;
fprintf('gamma plus beta by delta plus alpha : %2f\n', ratio_three);
feature_f(i,19)=ratio_three;

end
