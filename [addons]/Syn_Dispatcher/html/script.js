var audioPlayer = null;



function playSound(file){
  if (audioPlayer != null) {
	audioPlayer.pause();
  }

  audioPlayer = new Audio("../sounds/" + file);
  audioPlayer.volume = 0.1;
  var didPlayPromise = audioPlayer.play();

  if (didPlayPromise === undefined) {
	audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
  } else {
	didPlayPromise.then(_ => { //This does not execute until the audio is playing.
	}).catch(error => {
	  audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
	})
  }
}

var soundQueue = [];
var isPlaying = false;
var paddingDuration = 500; // Adjust the padding duration in milliseconds as needed

function playSoundTwo(file) {
  soundQueue.push(file);

  if (!isPlaying) {
    playNextSound();
  }
}

function playNextSound() {
  if (soundQueue.length === 0) {
    // No more sounds in the queue
    isPlaying = false;
    return;
  }

  const nextFile = soundQueue.shift();
  isPlaying = true;

  if (audioPlayer != null) {
    audioPlayer.pause();
  }

  audioPlayer = new Audio("../sounds/" + nextFile);
  audioPlayer.volume = 0.3;

  audioPlayer.play().then(() => {
    // Get the duration of the audio file in seconds
    const duration = audioPlayer.duration;
    
    // Use setTimeout to play the next sound after the duration
    setTimeout(() => {
      // Sound has finished playing
      audioPlayer = null;
      playNextSound(); // Play the next sound in the queue
    }, duration * 1000); // Multiply by 1000 to convert seconds to milliseconds
  }).catch((error) => {
    // Handle any errors during playback
    audioPlayer = null;
    console.error("Error playing sound:", error);
    playNextSound(); // Play the next sound in the queue after an error
  });
}


window.addEventListener('message', function (event) {

  var edata = event.data;


  /* console.log(edata.type); */
  if (edata.type == "sound") {
    playSoundTwo(edata.sounddata);
  }

});
