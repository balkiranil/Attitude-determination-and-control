# Attitude-determination-and-control

## Simulation of The Low Earth Orbit Satellite’s Attitude Dynamics
The subject of the program is to characterize the attitude dynamics of the Low Earth Orbit satellite in the simulation environment. Since euler angles are correlated with angular velocity components, firstly, the angular velocity values will be found with the given initial values and then the values found will be transferred to the vectors. This matrix data and euler angles will be found using the initial data and finally presented as a plot graph.

The notations used in the assignment are given below.
-𝝓 is the roll angle,
-𝜽 is the pitch angle,
-𝝍 is the yaw angle,
-𝒘𝒙, 𝒘𝒚, and 𝒘𝒛 are the angular velocities of the satellite,
-𝑱𝒙, 𝑱𝒚, and 𝑱𝒛 are the moments of inertia of the satellite,
-𝒘𝒐𝒓𝒃𝒊𝒕 is the angular orbit velocity of the satellite,
-𝑵𝑻 is the disturbance torque acting on the satellite,
-𝑵 is the iteration number,
-∆𝒕 is the sample time,
-A is the transformation matrices


## Quaternion Attitude Representation for Small Satellite Transformed from Euler Angles
The subject of the program is to characterize the attitude dynamics of the Low Earth Orbit Satellite in terms of quaternions. Euler angles and angular velocity vectors taken from the first homework and quaternion are found and then quaternion rates are found with these values. There are 4 parameters in quaternions, one of which is scalar, others are vectoral.


## Modified Rodrigues Parameters Representation for Small Satellite Using Quaternions
The subject of the program is to characterize the attitude dynamics of the Low Earth Orbit Satellite in terms of Modified Rodrigues Parameters. Quaternions have 4 parameters. With modified rodrigues, a new method with 3 parameters is created by dividing the vectorial 3 parameters with 1 scalar.


## Investigation of the Sun Direction Vector in ECI
The sun model calculates the sun line in the inertial reference system and determines whether the sun is obstructed by the Earth at any given time into the mission. Due to the spacecraft orbiting the Earth and the Earth itself revolving about the sun, the inertial sun vector changes minutely while the satellite travels along its orbit. However, for LEO satellites with negligible orbit radius compared to the astronomical unit these cyclic changes, in the order of few arcseconds, are well below the accuracy of the sun sensors and the required accuracy of the reference model; this enables the useful simplification of the sun model by assuming the sun line to be independent of the position of the spacecraft and hence always parallel to the vector from the Earth to the sun. The following standard algorithm describes the true motion of the Earth around the inertially fixed sun in the form of the sun orbiting the Earth being fixed in inertial space. The right ascension of the ascending node of this virtual orbit of the sun around the Earth is 0° by definition. The reference epoch of this first-order model is the 1st of January 2000, 12:00:00 pm, or 2451545.0 Julian Date (JD).


## Modeling of the Sun Sensor Measurement in Satellite Body Frame
Sun direction vector was determined in ECI frame in the previous homework. Besides, the
transformation matrix from Orbit to Body frame was calculated in HW1.
In this homework, the sun direction vector in body frame must be produced. First, ECI to Orbit
transformation matrix must be calculated, then the Sun direction vector in Orbit frame can be
determined. By using pre-calculated Orbit to Body transformation matrix, the Sun direction
vector must be mapped from Orbit frame to Body frame and the noise must be added.
## Transformation Matrix from ECI to Orbit Frame
As the Sun direction vector is determined in ECI, the vectors have to be transformed into Orbit
and then Body coordinates using the orbital parameters of the satellite.


