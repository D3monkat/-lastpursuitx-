var doorLock;
var doorLockAvaliable = true;

// Load the audio file when everything is ready.
window.onload = () => {
    doorLock = new Audio("sound/door_lock.wav"); // The audio file
}

function playDoorLockSound(){
    if(doorLockAvaliable){ // Check if the sound stopped playing
        doorLockAvaliable = false; // Set the avaliability to false, since we are going to play it now.
        
        doorLock.volume = 0.5; // Set the volume to 0.5 (or adjust to your own preference)

        doorLock.play().then(() => {
          doorLock.currentTime = 0; // Reset the position to start
          doorLockAvaliable = true; // Sound stopped playing, so it is now avaliable
        });
      }
}