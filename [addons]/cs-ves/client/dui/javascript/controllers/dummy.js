class DummyController {
    constructor(manager, ready) {
        this.key = 'dummy'
        this.playing = false
        this.seeking = false
        this.manager = manager
        
        this.pending = {
            stop: false,
            play: false,
            pause: false,
            seek: false
        }

        this.ready = ready
    }

    hook() {}

    play(muted) {}

    pause() {}

    stop() {}

    seek(time) {}

    set(source) {}

    time() {
        return null
    }

    seeked() {
        if (!this.seeking)
            return
        
        this.seeking = false
        this.manager.controllerSeeked(this)
    }

    controls(mediaSession) {
        mediaSession.setActionHandler('play', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'play',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('pause', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'pause',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('stop', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'stop',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('seekbackward', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'seekbackward',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('seekforward', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'seekforward',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('seekto', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'seekto',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('previoustrack', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'previoustrack',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('nexttrack', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'nexttrack',
                plate: this.manager.plate
            })
        }).catch(error => {}))

        mediaSession.setActionHandler('skipad', () => fetch(`https://${resourceName}/mediaKey`, {
            method: 'POST',
            body: JSON.stringify({
                type: 'skipad',
                plate: this.manager.plate
            })
        }).catch(error => {}))
    }

    show() {}

    hide() {}
}
