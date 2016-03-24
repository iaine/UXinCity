/*
*
*  Using the text example.
*
*/

var flite = require('flite')

var message = "Hello. Welcome to the Auditory UX session"

flite(function (err, speech) {

  speech.config(voice => 'awb');

  speech.say(message, function (err) {
    if (err) console.error('I\'m afraid I can\'t do that, Dave', err);
  });
});
