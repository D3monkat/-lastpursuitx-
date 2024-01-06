const hash = window.location.hash ? window.location.hash.replace('#', '') : null
const hashData = hash ? hash.split('|') : []
const resourceName = hashData[0]
const keyPlate = hashData[1]
const urlCheckElement = document.createElement('input')
const lerp = (a, b, t) => (a * (1 - t)) + (b * t)

const gainLerpIntervalMs = 16.66
const filterLerpIntervalMs = 16.66
const playingInfoUpdateIntervalMs = 500

let activeInstance = null

class Speaker {
    constructor(id, options, manager) {
        this.id = id
        this.options = options
        this.manager = manager

        this.volumeMultiplier = this.options.volumeMultiplier
        this.filterGainMultiplier = 1.0
        this.applyLowPassFilter = true

        this.filter = this.manager.context.createBiquadFilter()
        this.panner = this.manager.context.createPanner()
        this.gain = this.manager.context.createGain()

        this.filter.type = 'highshelf'
        this.filter.frequency.value = 975
        this.filter.gain.value = -40.0

        this.gain.gain.value = 0.0

        this.filterLerp = {
            interval: null
        }

        this.gainLerp = {
            interval: null
        }

        this.panner.panningModel = 'HRTF'
        this.panner.distanceModel = 'exponential'
        this.panner.refDistance = this.options.refDistance
        this.panner.maxDistance = this.options.maxDistance
        this.panner.rolloffFactor = this.options.rolloffFactor
        this.panner.coneInnerAngle = this.options.coneInnerAngle
        this.panner.coneOuterAngle = this.options.coneOuterAngle
        this.panner.coneOuterGain = this.options.coneOuterGain

        this.manager.node.connect(this.panner)
        this.panner.connect(this.gain)
        this.gain.connect(this.manager.context.destination)

        this.lowPassFilterFade = 0.0
        this.filterConnected = false
        this.insideVehicle = false
        this.twoDimensionalAudio = false
    }

    update(data) {
        this.panner.positionX.setValueAtTime(Math.round(data.position[0]), this.manager.context.currentTime + this.manager.timeDelta)
        this.panner.positionY.setValueAtTime(Math.round(data.position[1]), this.manager.context.currentTime + this.manager.timeDelta)
        this.panner.positionZ.setValueAtTime(Math.round(data.position[2]), this.manager.context.currentTime + this.manager.timeDelta)

        this.panner.orientationX.setValueAtTime(Math.round(data.orientation[0]), this.manager.context.currentTime + this.manager.timeDelta)
        this.panner.orientationY.setValueAtTime(Math.round(data.orientation[1]), this.manager.context.currentTime + this.manager.timeDelta)
        this.panner.orientationZ.setValueAtTime(Math.round(data.orientation[2]), this.manager.context.currentTime + this.manager.timeDelta)

        if (data.lowPassFilterFade !== this.lowPassFilterFade || (this.applyLowPassFilter !== this.manager.applyLowPassFilter) || (this.filterConnected !== this.manager.applyLowPassFilter)) {
            this.applyLowPassFilter = this.manager.applyLowPassFilter
            this.lowPassFilterFade = data.lowPassFilterFade
            this.applyingLowPassFilter = this.lowPassFilterFade > 0

            if (!this.applyLowPassFilter)
                this.disconnectFilter()
            else
                this.connectFilter(this.lowPassFilterFade)
        }

        this.gain.gain.value = 0.75 * this.manager.volume * this.volumeMultiplier * this.filterGainMultiplier * (data.distance < this.options.refDistance ? 1.0 : (data.distance - this.options.refDistance) > this.options.maxDistance ? 0 : (1.0 - ((data.distance - this.options.refDistance) / this.options.maxDistance)))

        if (this.manager.insideVehicle !== this.insideVehicle) {
            this.insideVehicle = this.manager.insideVehicle

            if (this.insideVehicle) {
                this.twoDimensionalAudio = true
                this.manager.node.disconnect(this.panner)
                this.manager.node.connect(this.gain)
            } else if (this.twoDimensionalAudio) {
                this.twoDimensionalAudio = false
                this.manager.node.disconnect(this.gain)
                this.manager.node.connect(this.panner)
            }
        }
    }

    connectFilter(fade) {
        clearInterval(this.filterLerp.interval)
        clearInterval(this.gainLerp.interval)
        
        this.filterLerp.startValue = this.filter.gain.value
        this.filterLerp.startTime = Date.now()
        this.filterLerp.targetValue = fade * -40.0

        this.gainLerp.startValue = this.filterGainMultiplier
        this.gainLerp.startTime = Date.now()
        this.gainLerp.targetValue = this.applyingLowPassFilter ? ((100 - this.options.lowPassGainReductionPercent) / 100) : 1.0
        
        this.filterLerp.interval = setInterval(() => {
            const timeSinceStarted = Date.now() - this.filterLerp.startTime
            const percentageComplete = timeSinceStarted / this.options.fadeDurationMs

            this.filter.gain.value = percentageComplete >= 1.0 ? this.filterLerp.targetValue : lerp(this.filterLerp.startValue, this.filterLerp.targetValue, percentageComplete)

            if (percentageComplete >= 1.0)
                clearInterval(this.filterLerp.interval)
        }, filterLerpIntervalMs)
        
        this.gainLerp.interval = setInterval(() => {
            const timeSinceStarted = Date.now() - this.gainLerp.startTime
            const percentageComplete = timeSinceStarted / this.options.fadeDurationMs

            this.filterGainMultiplier = percentageComplete >= 1.0 ? this.gainLerp.targetValue : lerp(this.gainLerp.startValue, this.gainLerp.targetValue, percentageComplete)

            if (percentageComplete >= 1.0)
                clearInterval(this.gainLerp.interval)
        }, gainLerpIntervalMs)

        if (this.filterConnected)
            return

        this.gain.disconnect(this.manager.context.destination)
        this.gain.connect(this.filter)
        this.filter.connect(this.manager.context.destination)

        this.filterConnected = true
    }

    disconnectFilter() {
        if (!this.filterConnected)
            return

        clearInterval(this.filterLerp.interval)
        clearInterval(this.gainLerp.interval)

        this.filter.disconnect(this.manager.context.destination)
        this.gain.disconnect(this.filter)
        this.gain.connect(this.manager.context.destination)
        this.filter.gain.value = -40.0

        this.filterConnected = false
        this.filterGainMultiplier = 1.0
    }
}

class MediaManager {
    constructor(plate) {
        this.plate = plate
        this.playing = false

        this.syncedData = {
            playing: false,
            stopped: true,
            videoToggle: true,
            time: 0,
            volume: 0.0,
            url: null,
            temp: null
        }

        this.speakers = {}

        this.volume = 0.0
        this.applyLowPassFilter = true

        this.context = new AudioContext()
        this.node = this.context.createGain()
        this.listener = this.context.listener

        this.timeDelta = 0.05

        this.controllers = {
            dummy: new DummyController(this, true)
        }

        this.controller = this.controllers.dummy

        setInterval(() => this.controllerPlayingInfo(this.controller), playingInfoUpdateIntervalMs)

        fetch(`https://${resourceName}/managerReady`, {
            method: 'POST',
            body: JSON.stringify({
                plate: this.plate
            })
        }).catch(error => {})

        document.title = ' '
    }

    showSpinner() {
        document.getElementById('spinner').style = 'display: block'
    }

    hideSpinner() {
        document.getElementById('spinner').style = 'display: none'
    }

    controllerPlayingInfo(controller) {
        if (controller.key === this.controller.key && this.plate)
            fetch(`https://${resourceName}/controllerPlayingInfo`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate,
                    time: controller.time(),
                    duration: controller.duration,
                    playing: controller.playing
                })
            }).catch(error => {})
    }

    controllerHooked(controller) {
        if (controller.media)
            controller.media.connect(this.node)
    }

    controllerSeeked(controller) {
        if (controller.key === this.controller.key)
            fetch(`https://${resourceName}/controllerSeeked`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate,
                    controller: controller.key
                })
            }).catch(error => {})
    }

    controllerError(controller, error) {
        if (controller.key === this.controller.key) {
            this.hideSpinner()

            fetch(`https://${resourceName}/controllerError`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate,
                    controller: controller.key,
                    error
                })
            }).catch(error => {})
        }
    }

    controllerEnded(controller) {
        if (controller.key === this.controller.key) {
            this.hideSpinner()

            fetch(`https://${resourceName}/controllerEnded`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate,
                    controller: controller.key
                })
            }).catch(error => {})
        }
    }

    controllerResync(controller) {
        if (controller.key === this.controller.key)
            fetch(`https://${resourceName}/controllerResync`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate,
                    controller: controller.key
                })
            }).catch(error => {})
    }

    update(data) {
        for (let index = 0; index < data.speakers.length; index++)
            if (this.speakers[data.speakers[index].id])
                this.speakers[data.speakers[index].id].update(data.speakers[index])

        this.listener.upX.setValueAtTime(Math.round(data.listener.up[0]), this.context.currentTime + this.timeDelta)
        this.listener.upY.setValueAtTime(Math.round(data.listener.up[1]), this.context.currentTime + this.timeDelta)
        this.listener.upZ.setValueAtTime(Math.round(data.listener.up[2]), this.context.currentTime + this.timeDelta)

        this.listener.forwardX.setValueAtTime(Math.round(data.listener.forward[0]), this.context.currentTime + this.timeDelta)
        this.listener.forwardY.setValueAtTime(Math.round(data.listener.forward[1]), this.context.currentTime + this.timeDelta)
        this.listener.forwardZ.setValueAtTime(Math.round(data.listener.forward[2]), this.context.currentTime + this.timeDelta)

        this.listener.positionX.setValueAtTime(Math.round(data.listener.position[0]), this.context.currentTime + this.timeDelta)
        this.listener.positionY.setValueAtTime(Math.round(data.listener.position[1]), this.context.currentTime + this.timeDelta)
        this.listener.positionZ.setValueAtTime(Math.round(data.listener.position[2]), this.context.currentTime + this.timeDelta)

        this.applyLowPassFilter = data.applyLowPassFilter
        this.insideVehicle = data.insideVehicle
    }

    addSpeaker(id, options) {
        this.speakers[id] = new Speaker(id, options, this)
    }

    sync(data) {
        this.plate = data.plate

        this.set(data.url !== this.syncedData.url || data.temp.force, data.playing, data.url).then(() => {
            if (this.plate !== data.plate)
                return

            if ((data.stopped !== this.syncedData.stopped || data.temp.force) && data.stopped)
                this.stop()
            else if (data.playing !== this.syncedData.playing || data.temp.force) {
                this.play(true)

                if (data.playing)
                    this.play()
                else
                    this.pause()
            }

            if (data.volume !== this.syncedData.volume || data.temp.force)
                this.setVolume(data.volume)

            if (data.temp.seek || data.temp.force)
                this.seek(data.temp.force && data.duration ? (data.time + 1 > data.duration ? data.time : (data.time + 1)) : data.time)

            if (data.videoToggle !== this.syncedData.videoToggle || data.temp.force)
                if (data.videoToggle || typeof(data.videoToggle) === 'undefined')
                    this.show()
                else
                    this.hide()

            fetch(`https://${resourceName}/synced`, {
                method: 'POST',
                body: JSON.stringify({
                    plate: this.plate
                })
            }).catch(error => {})
        })
    }

    adjust(time) {
        if (this.controller.playing && Math.abs(Math.round(this.controller.time()) - Math.round(time)) >= 3)
            this.seek(time)
    }

    play(muted = false) {
        this.syncedData.playing = true
        this.syncedData.stopped = false
        this.controller.play(muted)
    }

    pause() {
        this.syncedData.playing = false
        this.controller.pause()
    }

    stop() {
        this.syncedData.playing = false
        this.syncedData.stopped = true
        this.syncedData.time = 0
        this.controller.stop()
    }

    seek(time) {
        this.syncedData.time = time
        this.controller.seek(time)
    }

    setVolume(volume) {
        this.syncedData.volume = volume
        this.volume = volume
    }

    show() {
        this.syncedData.videoToggle = true
        this.controller.show()
    }
    
    hide() {
        this.syncedData.videoToggle = false
        this.controller.hide()
    }

    set(state, playing, source) {
        return new Promise(async (resolve, reject) => {
            this.syncedData.url = source

            if ((!source) && state) {
                this.controller.set(null)
                resolve()
                return
            }

            let data = {
                key: 'dummy',
                source
            }

            urlCheckElement.value = source

            if (urlCheckElement.validity.valid) {
                const ytVideoId = source.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i)
                const twitchChannel = source.match(/^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/([A-z0-9_]+)($|\?)/i)
                const twitchVideo = source.match(/^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/videos\/([0-9]+)($|\?)/i)
                const twitchClip = source.match(/(?:(?:^(?:https?:\/\/)?clips\.twitch\.tv\/([A-z0-9_-]+)(?:$|\?))|(?:^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/(?:[A-z0-9_-]+)\/clip\/([A-z0-9_-]+)($|\?)))/)

                if (ytVideoId && ytVideoId[1])
                    data = {
                        key: 'youtube',
                        source: ytVideoId[1]
                    }
                else if (twitchChannel && twitchChannel[1])
                    data = {
                        key: 'twitch',
                        source: `channel:${twitchChannel[1]}`
                    }
                else if (twitchVideo && twitchVideo[1])
                    data = {
                        key: 'twitch',
                        source: `video:${twitchVideo[1]}`
                    }
                else if (twitchClip && (twitchClip[1] || twitchClip[2]))
                    data = {
                        key: 'frame',
                        source: `${source}&parent=${location.hostname}`
                    }
                else
                    data = {
                        key: 'frame',
                        source
                    }
            }

            if (this.controller.key === data.key) {
                this.controller.set(data.source)
                resolve()
            } else {
                if (state)
                    this.controller.set(null)
            
                const cb = (dummy = false) => {
                    const oldControllerKey = this.controller.key

                    if (dummy)
                        this.controller = this.controllers.dummy
                    else
                        this.controller = this.controllers[data.key]
                    
                    if (state || oldControllerKey !== this.controller.key)
                        this.controller.set(data.source)
    
                    resolve()
                }

                if (!this.controllers[data.key])
                    if (playing)
                        switch (data.key) {
                            case 'youtube':
                                this.controllers[data.key] = new YouTubeController(this, cb)
                                break

                            case 'twitch':
                                this.controllers[data.key] = new TwitchController(this, cb)
                                break
                            
                            case 'frame':
                                this.controllers[data.key] = new FrameController(this, cb)
                                break
                        }
                    else
                        cb(true)
                else
                    cb()
            }

            this.controllerPlayingInfo(this.controller)
        })
    }

    setIdleWallpaperUrl(url) {
        document.getElementById('idle').style = `background-image:url('${url}')`
    }
}

window.addEventListener('message', event => {
    switch (event.data.type) {
        case 'cs-ves:create':
            if (activeInstance)
                return

            activeInstance = new MediaManager(event.data.plate)

            break

        case 'cs-ves:update':
            if ((!activeInstance) || event.data.plate !== activeInstance.plate)
                return

            activeInstance.update({
                applyLowPassFilter: event.data.applyLowPassFilter,
                insideVehicle: event.data.insideVehicle,
                listener: event.data.listener,
                speakers: event.data.speakers
            })

            break

        case 'cs-ves:addSpeaker':
            if ((!activeInstance) || event.data.plate !== activeInstance.plate)
                return

            activeInstance.addSpeaker(event.data.speakerId, {
                refDistance: event.data.refDistance,
                maxDistance: event.data.maxDistance,
                rolloffFactor: event.data.rolloffFactor,
                coneInnerAngle: event.data.coneInnerAngle,
                coneOuterAngle: event.data.coneOuterAngle,
                coneOuterGain: event.data.coneOuterGain,
                fadeDurationMs: event.data.fadeDurationMs,
                volumeMultiplier: event.data.volumeMultiplier,
                lowPassGainReductionPercent: event.data.lowPassGainReductionPercent
            })

            break

        case 'cs-ves:setIdleWallpaperUrl':
            if ((!activeInstance) || event.data.plate !== activeInstance.plate)
                return

            activeInstance.setIdleWallpaperUrl(event.data.url)

            break

        case 'cs-ves:sync':
            if ((!activeInstance) || event.data.plate !== activeInstance.plate)
                return

            activeInstance.sync({
                plate: event.data.plate,
                playing: event.data.playing,
                stopped: event.data.stopped,
                time: event.data.time,
                volume: event.data.volume,
                url: event.data.url,
                temp: event.data.temp,
                videoToggle: event.data.videoToggle
            })

            break

        case 'cs-ves:adjust':
            if ((!activeInstance) || event.data.plate !== activeInstance.plate)
                return

            activeInstance.adjust(event.data.time)

            break
    }
})

urlCheckElement.setAttribute('type', 'url')

fetch(`https://${resourceName}/browserReady`, {
    method: 'POST',
    body: JSON.stringify({
        plate: keyPlate
    })
}).catch(error => {})
