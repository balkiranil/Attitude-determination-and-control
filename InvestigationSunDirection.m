
clc
clear

disp("Developed by ANIL TAHA BALKIR")

n= 9;
period= 5400;
dt= 0.1;
iteration_number= period/dt;

year= 2018;
month= 1;
day= 1;
second= 20;
min= 35;
hour= 7;

JD= zeros(1,iteration_number);

% Julian date

for i= 0 : iteration_number-1
    if  second/60 >= 1
        min= min + 1;
    end

    if  min/60 >= 1
        hour= hour + 1;
    end

    if second >= 60    
       second= 0;
    end

    if min >= 60
        min= 0;
    end

    if hour >= 24
        hour= 0;
    end

    JD(i+1)= 367*year - fix((7*(year + fix((month + 9)/12))/4)) + fix(275*month/9) + ((hour + min/60 + second/3600)/24) + day + 1721013.5;

    second = second + dt;
end

T_UT1= (JD - 2451545)/36525;

% The mean longitude of the sun

delta_M_Sun= 280.460 + 36000.770*T_UT1;

T_TDB= T_UT1;

% The mean anomaly of the sun

M_Sun= 357.5277233 + 35999.05034*T_TDB;

% The ecliptic longitude of the sun

delta_ecliptic= delta_M_Sun + 1.914666471*sind(M_Sun) + 0.019994643*sin(2*M_Sun);

% The linear model of the ecliptic of the sun

E= 23.439291 - 0.0130042*T_TDB;

% The unit sun vector is given in the ECI frame

S_ECI= [cosd(delta_ecliptic); sind(delta_ecliptic).*cosd(E); sind(delta_ecliptic).*sind(E)];

plot3(S_ECI(1,:), S_ECI(2,:), S_ECI(3,:));
title('Sun Direction Vector in ECI');
xlabel('S-ECI 1');
ylabel('S-ECI 2');
zlabel('S-ECI 3');
grid on;
grid minor;
