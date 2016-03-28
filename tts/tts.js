/*
*
*  Command line driven TTS
*
*  Requires node-flite and flite
*  Usage: node tts.js
*
*/

var flite = require('flite');

var message = "Hello. Welcome to the Auditory UX session";
flite(function (err, speech) {
  //speech.config.voice="awb";
  speech.say(message, function (err) {
    if (err) console.error('I\ve lost my voice: ', err);
  });
});
