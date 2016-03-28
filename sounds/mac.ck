/*
Big Mac UK index experiment

Iain Emsley

August 2015

Uses DragonBite.wav file to simulate the bite
(http://soundbible.com/1394-Dragon-Bite.html)
licensed under Public Domain
*/

SawOsc s => dac;
SndBuf snd => dac;

.2 => float timeSt;

//define the constants
1 => float durTime;
0 => float overTime;

[3.82,4.16,4.25,4.02,4.63,4.93,4.37,4.51] @=> float macIdx[];

//cheap way to provide a count
0 => int tickCount;

playTick(s);

for (0 => int i; i < macIdx.cap();i++) {
    tickCount++;
    playRecRise(snd, macIdx[i]);

    if (tickCount % 2 == 0) {
        playTick(s);
    }
}

playTick(s);

// Work out the sample Duration
fun float sampleDuration (float f) {
    return  (durTime + lenDur(f));
}

// Make the index into a duration
fun float lenDur(float m) {
    return (m * 0.1);   
}

// play the recording
fun void playRec(SndBuf snd,float f)
{
    "DragonBite.wav" => snd.read;
    0 => snd.pos;
    1 => snd.gain;
    sampleDuration(f) => snd.freq; 
    //speed the file up or down! 1 is the normal playback speed
    (1 + (f*0.1)) => snd.rate;
    //1 => snd.rate;

    (f*200)::ms => now;
}

// Function to provide a tick like an axis tick in a graph
fun void playTick (SawOsc sw) {
    Std.mtof(60) => sw.freq;
    0.1 => sw.gain;
    100::ms => now;
    0 => sw.gain;
}

// play the recording
fun void playRecRise(SndBuf snd,float f)
{
    "DragonBite.wav" => snd.read;
    0 => snd.pos;
    1 => snd.gain;
    f => snd.freq; 
    (1 + (f*0.1)) => snd.rate;
    
    (f*200)::ms => now;
}

