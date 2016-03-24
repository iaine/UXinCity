// Use laptop shaking to control model of coin in mug
Shakers peso => JCRev rev => dac.right;
// coin in coffee mug
0.03 => rev.mix;
19 => peso.preset;
10 => peso.objects;    
// setup parameters
1.0 => peso.decay;
1 => peso.noteOn;


Hid hi;
HidMsg msg;

if (!hi.openTiltSensor())
{
// open tilt sensor
  <<<"tilt sensor unavailable","">>>;
  me.exit();
}
<<<"tilt sensor ready","">>>;
// if success opening hid
float lacc[3];

while (true)
{
 hi.read(9,0,msg);
// read accel (device 9) number 0
//     <<< msg.x, msg.y, msg.z >>>; // (optional) print results
(msg.x-lacc[0])*(msg.x-lacc[0]) => float shaking;
// 
get total(msg.y-lacc[1])*(msg.y-lacc[1]) +=> shaking;
// 3D squared
(msg.z-lacc[2])*(msg.z-lacc[2]) +=> shaking;

shaking / 4000.0 => peso.energy;
 // and use that to shake model 
msg.x => lacc[0];
msg.y => lacc[1];
msg.z => lacc[2];
// store last
30::ms => now;

}
