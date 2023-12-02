$(function () {

    $("#boardingpassengers").hide();
    $("#disembarkpassengers").hide();

    function display(bool) {
        if (bool) {
            $("#pilot").show();
        } else {
            $("#pilot").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "show") {
            if (item.status == true) {
                $("#pilot").fadeIn();
                display(true)
            } else {
                $("#pilot").fadeOut("slow");
                display(false)
            }
        }
        
        if (item.type === "showboardingpassengers") {
            if (item.status == true) {
                $("#boardingpassengers").fadeIn();
            } else {
                $("#boardingpassengers").fadeOut("slow");
            }
        }

        if (item.type === "showdisembarkpassengers") {
            if (item.status == true) {
                $("#disembarkpassengers").fadeIn();
            } else {
                $("#disembarkpassengers").fadeOut("slow");
            }
        }
    })
    
    window.addEventListener('message', function (event) {
        try {
            switch(event.data.action) {
                case 'chooselegalflight':
                    if (event.data.value != null) chooselegalflight.innerHTML = event.data.value;
                break;

                case 'flightsnumber':
                    if (event.data.value != null) flightsnumber.innerHTML = event.data.value;
                break;

                case 'levelwhat':
                    if (event.data.value != null) levelwhat.innerHTML = event.data.value;
                break;
                
                case 'textv2':
                    if (event.data.value != null) textv2.innerHTML = event.data.value;
                break;

                case 'textv3':
                    if (event.data.value != null) textv3.innerHTML = event.data.value;
                break;

                case 'progg':
                    if (event.data.value != null) $('#progg .progressBar').val(event.data.value);
                break;
            }
    } catch(err) {}
    });
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $("#pilot").hide();
            $.post('https://id_pilotjob/close', JSON.stringify({}));
            return
        }
    };

    $("#chooselegalflight").click(function () {
        $.post('https://id_pilotjob/legalroute', JSON.stringify({}));
        return
    })

    $("#chooseillegalflight").click(function () {
        $.post('https://id_pilotjob/illegalroute', JSON.stringify({}));
        return
    })
})