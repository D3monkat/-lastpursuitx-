Config = {}

Config.Framework = "qbCore"

Config.Notification = {
    useCustom = false,
    customNotify = function(text, textType, length)
        --- Your custom notification code
    end,

    styling = {
        group = false,
        position = "right",
        progress = true
    },

    variants = {
        info = {
            classes = 'info',
            icon = 'fa-solid fa-circle-info'
        },
        success = {
            classes = 'success',
            icon = 'fa-solid fa-circle-check'
        },
        warning = {
            classes = 'warning',
            icon = 'fa-solid fa-triangle-exclamation'
        },
        error = {
            classes = 'error',
            icon = 'fa-solid fa-circle-xmark'
        }
    }
}

