% developed by: ANIL TAHA BALKIR

clc
clear

disp("Powered by Javelin Tech.")
disp("Developed by ANIL TAHA BALKIR")

n        = 9;                              %given random number 
roll(1)  = -0.01-0.002*n;                  %initial value of roll angle 
pitch(1) = 0.01+0.002*n;                   %initial value of pitch angle
yaw(1)   = 0.005+0.002*n;                  %initial value of yaw angle
wx(1)    = 0.0002+0.0001*n;                %initial value of x component of angular velocity
wy(1)    = 0.0003+0.0001*n;                %initial value of y component of angular velocity
wz(1)    = 0.0004+0.0001*n;                %initial value of z component of angular velocity
Jx       = 2.1*10.^-3;                     %x component of moment of inertia
Jy       = 2*10.^-3;                       %y component of moment of inertia
Jz       = 1.9*10.^-3;                     %z component of moment of inertia
w_orbit  = 0.0011;                         %initial value of angular velocity of orbit
N        = 54000;                          %iteration number 
N_t      = 3.6*10^-10;                     %disturbance torque
t        = 0.1;                            %sample time

% Angular velocity calculations

for i=1:N-1

wx(i+1,1)=wx(i)+t*(Jy-Jz)...
    *wz(i)*wy(i)/Jx+(t*N_t)/Jx;
wy(i+1,1)=wy(i)+t*(Jz-Jx)...
    *wx(i)*wz(i)/Jy+(t*N_t)/Jy;
wz(i+1,1)=wz(i)+t*(Jx-Jy)...
    *wx(i)*wy(i)/Jz+(t*N_t)/Jz;
    
end

% Euler angles calculations

for i=1:N-1

roll(i+1,1)=roll(i)+t*((wy(i,1)*sin(roll(i))+wz(i,1)*cos(roll(i)))*tan(pitch(i))+wx(i,1));
pitch(i+1,1)=pitch(i)+t*(wy(i,1)*cos(roll(i))-wz(i,1)*sin(roll(i))+w_orbit);
yaw(i+1,1)=yaw(i)+t*(wy(i,1)*sin(roll(i))+wz(i,1)*cos(roll(i)))*sec(pitch(i));
    
end

% Transformation matrix
A=zeros(3,3,N);
for i=1:N   

A(:,:,i)=[cos(pitch(i))*cos(yaw(i)) cos(pitch(i))*sin(yaw(i)) -sin(pitch(i));
-cos(roll(i))*sin(yaw(i))+sin(roll(i))*sin(pitch(i))*cos(yaw(i)) cos(roll(i))*cos(yaw(i))+sin(roll(i))*sin(pitch(i))*sin(yaw(i)) sin(roll(i))*cos(pitch(i));
sin(roll(i))*sin(yaw(i))+cos(roll(i))*sin(pitch(i))*cos(yaw(i)) -sin(roll(i))*cos(yaw(i))+cos(roll(i))*sin(pitch(i))*sin(yaw(i)) cos(roll(i))*cos(pitch(i))];
    
end

% Plot (Euler Angles)
figure(1);
sgtitle('Euler Angles Components')
subplot(1,3,1)
x=0.1:0.1:N/10;
plot(x,roll);
xlabel('Time (s)')
ylabel('Roll angle(rad)')
subplot(1,3,2);
plot(x,pitch);
xlabel('Time (s)');
ylabel('Pitch angle(rad)');
subplot(1,3,3);
plot(x,yaw);
xlabel('Time (s)');
ylabel('Yaw angle(rad)');
% Plot (Angular Velocity)
figure(2);
sgtitle('Angular Velocity Components')
subplot(1,3,1);
plot(x,wx);
xlabel('Time (s)')
ylabel('X comp. of angular velocity (rad/s)') 
subplot(1,3,2);
plot(x,wy);
xlabel('Time (s)');
ylabel('Y comp. of angular velocity (rad/s)'); 
subplot(1,3,3);
plot(x,wz);
xlabel('Time (s)');
ylabel('Z comp. of angular velocity (rad/s)');
