/**
* Simple streaming client that speaks
* Derived from: https://torchbox.com/blog/adios-manuel/
*
* Requires twitter, flite, node-flite
*
*/

var Twitter = require('twitter');
var flite = require('flite');
  
var client = new Twitter({
  consumer_key: '',
  consumer_secret: '',
  access_token_key: '',
  access_token_secret: ''
});


var speak_message = function (message) { 
  flite(function (err, speech) {
    speech.say(message, function (err) {
      if (err) console.error('I\ve lost my voice: ', err);
    });
  });
};


client.stream('statuses/filter', {track: 'javascript'}, function(stream) {
  stream.on('data', function(tweet) {
    console.log(tweet.text);
    speak_message(tweet.text);
  });
 
  stream.on('error', function(error) {
    throw error;
  });
});
