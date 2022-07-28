% developed by: ANIL TAHA BALKIR

clc
clear


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


% Aangular velocity calculations

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
    
roll(i+1,1)=roll(i)+t...
    *((wy(i,1)*sin(roll(i))+wz(i,1)*cos(roll(i)))*tan(pitch(i))...
    +wx(i,1));
pitch(i+1,1)=pitch(i)+t*(wy(i,1)*cos(roll(i))-wz(i,1)*sin(roll(i))...
    +w_orbit);
yaw(i+1,1)=yaw(i)+t*(wy(i,1)*sin(roll(i))+wz(i,1)*cos(roll(i)))...
    *sec(pitch(i));

end

% Quternions calculations

for i=1:N
    
    qs(i,1)=cos(roll(i)/2)*cos(pitch(i)/2)*cos(yaw(i)/2)+sin(roll(i)/2)...
        *sin(pitch(i)/2)*sin(yaw(i)/2);
    qx(i,1)=sin(roll(i)/2)*cos(pitch(i)/2)*cos(yaw(i)/2)-cos(roll(i)/2)...
        *sin(pitch(i)/2)*sin(yaw(i)/2);
    qy(i,1)=cos(roll(i)/2)*sin(pitch(i)/2)*cos(yaw(i)/2)+sin(roll(i)/2)...
        *cos(pitch(i)/2)*sin(yaw(i)/2);
    qz(i,1)=cos(roll(i)/2)*cos(pitch(i)/2)*sin(yaw(i)/2)+sin(roll(i)/2)...
        *sin(pitch(i)/2)*cos(yaw(i)/2);
    
end

% Quaternion rates calculations

for i=1:N  
    
    qsr(i,1)=-0.5*(qx(i,1)*wx(i,1)+qy(i,1)*wy(i,1)+qz(i,1)*wz(i,1));
    qxr(i,1)=0.5*(qs(i,1)*wx(i,1)-qz(i,1)*wy(i,1)+qy(i,1)*wz(i,1));
    qyr(i,1)=0.5*(qz(i,1)*wx(i,1)+qs(i,1)*wy(i,1)-qx(i,1)*wz(i,1));
    qzr(i,1)=-0.5*(qy(i,1)*wx(i,1)-qx(i,1)*wy(i,1)-qs(i,1)*wz(i,1));
    
end

% Modified Rodrigues parameters calculations

for i=1:N
    
  p1(i,1)=qx(i)/(1+qs(i));
  p2(i,1)=qy(i)/(1+qs(i));
  p3(i,1)=qz(i)/(1+qs(i));
  
end
 
%% Plot (rodrigues parameters)
figure(1);
sgtitle('Modified Rodrigues Parameters')
subplot(1,3,1)
x=0.1:0.1:5400;
plot(x,p1);
xlabel('Time (s)');
ylabel('The first Rodrigues parameter(unitless)');
subplot(1,3,2)
x=0.1:0.1:5400;
plot(x,p2);
xlabel('Time (s)');
ylabel('The second Rodrigues parameter(unitless)');
subplot(1,3,3)
x=0.1:0.1:5400;
plot(x,p3);
xlabel('Time (s)');
ylabel('The third Rodrigues parameter(unitless)');
