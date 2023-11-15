let Locales = [];
let inQueue = null;
let contractData = [];
let display = false;
let started = false;
let intervalIDs = [];

const CountdownTimer = (index, element) => {
    const countDownDate = element.expire;
    let Timer = setInterval(() => {
        if (document.getElementById(`timer${index}`) === null) {
            clearInterval(Timer)
        } else {
            let now = new Date(Date.now()).getTime();
            let distance = countDownDate - now;
            let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let seconds = Math.floor((distance % (1000 * 60)) / 1000);

            let colour = "lightgreen"
            if (hours === 0) { colour = "red" }

            document.getElementById(`timer${index}`).innerHTML = Locales.ui_expires_in + ": " + (hours + "h " + minutes + "m " + seconds + "s ").fontcolor(colour);

            if (element.state === 'started') {
                document.getElementById(`start-contract${index}`).disabled = true;
                document.getElementById(`transfer-contract${index}`).disabled = true;
                document.getElementById(`decline-contract${index}`).innerHTML = Locales.ui_cancel_contract;
                document.getElementById(`timer${index}`).innerHTML = Locales.ui_expires_in + ": " + Locales.ui_started.fontcolor("orange")
                clearInterval(Timer)
            } else if (distance < 0) {
                document.getElementById(`timer${index}`).innerHTML = Locales.ui_expires_in + ": " + Locales.ui_expired.fontcolor("red")
                document.getElementById(`start-contract${index}`).disabled = true;
                document.getElementById(`transfer-contract${index}`).disabled = true;
                document.getElementById(`decline-contract${index}`).disabled = true;
                $.post(`https://${GetParentResourceName()}/NUI:DeleteContract`, JSON.stringify({ 'contract': element.id }));
                clearInterval(Timer);
            } else if (started === true) {
                document.getElementById(`start-contract${index}`).disabled = true;
            } else if (display === false) {
                clearInterval(Timer);
            }
        }
    }, 50);

    intervalIDs[index] = Timer;
}

const CloseButton = () => {
    $.post(`https://${GetParentResourceName()}/NUI:Close`, JSON.stringify({}));
    display = false;
    document.getElementById("html").style.display = 'none';
    document.getElementById('insufficient-money').innerHTML = '';
    document.getElementById('transfer-container').innerHTML = '';
    document.getElementById('transfer-contract-container').innerHTML = '';
    document.getElementById('accepted-container').innerHTML = '';
}

const NormalDropOff = (id, index) => {
    $.post(`https://${GetParentResourceName()}/NUI:NormalDropOff`, JSON.stringify({ 'index': id }), function(data) {
        if (data.result) {
            document.getElementById(`timer${index}`).innerHTML = Locales.ui_expires_in + ": " + Locales.ui_started.fontcolor("orange")
            document.getElementById(`transfer-contract${index}`).disabled = true;
            document.getElementById('accepted-container').innerHTML = '';

            for (let i = 0; i < contractData.length; i++) {
                document.getElementById(`start-contract${i}`).disabled = true;
            }

            started === true;

            clearInterval(intervalIDs[index]);
        } else {
            let Div = document.getElementById('insufficient-money');
            Div.innerHTML += `
            <div class="popup">
                <button onclick={Cancel()} class="popup-button"></button>
                <p class="popuptext">${data.response}</p>
            </div>`

            document.getElementById('accepted-container').innerHTML = '';
        }
    });
}

const VinScratch = (id, index) => {
    $.post(`https://${GetParentResourceName()}/NUI:VINScratch`, JSON.stringify({ 'index': id }), function(data) {
        if (data.result) {
            document.getElementById(`timer${index}`).innerHTML = Locales.ui_expires_in + ": " + Locales.ui_started.fontcolor("orange")
            document.getElementById(`transfer-contract${index}`).disabled = true;
            document.getElementById('accepted-container').innerHTML = '';
    
            for (let i = 0; i < contractData.length; i++) {
                document.getElementById(`start-contract${i}`).disabled = true;
            }
    
            started === true;

            clearInterval(intervalIDs[index]);
        } else {
            let Div = document.getElementById('insufficient-money');
            Div.innerHTML += `
            <div class="popup">
                <button onclick={Cancel()} class="popup-button"></button>
                <p class="popuptext">${data.response}</p>
            </div>`

            document.getElementById('accepted-container').innerHTML = '';
        }
    });
}

const Contract = (id, index, vinPrice) => {
    document.getElementById('transfer-container').innerHTML = '';
    document.getElementById('transfer-contract-container').innerHTML = '';
    document.getElementById('insufficient-money').innerHTML = '';
    let Div = document.getElementById('accepted-container');
    Div.innerHTML = '';

    return (
        Div.innerHTML +=
        `<div class="accepted-contract-container" id="accepted-contract-container">
        <button onclick={RanOutOfFunctionNames()} class="accepted-contract-closeButton"></button>
        <div class="accepted-contract-title-flex">
            <h4 class="accepted-contract-title">${Locales.ui_select_type}</h4>
        </div>
        
        <p class="accepted-contract-text">${Locales.ui_vin_additional} ${vinPrice} ${Locales.ui_moneyType} ${Locales.ui_to_claim_ownership}</p>
        <div class="accepted-contract-optionButton-flex">
            <button class="accepted-contract-optionButton" onclick={VinScratch(${id},${index})}>${Locales.ui_vinscratch}</button>
            <button class="accepted-contract-optionButton" onclick={NormalDropOff(${id},${index})}>${Locales.ui_dropoff}</button>
        </div>`
    )
}

const Cancel = () => {
    document.getElementById('transfer-container').innerHTML = '';
    document.getElementById('transfer-contract-container').innerHTML = '';
    document.getElementById('insufficient-money').innerHTML = '';
}

const RanOutOfFunctionNames = () => {
    document.getElementById('accepted-contract-container').innerHTML = ''
    document.getElementById('accepted-container').innerHTML = '';
}

const Continue = (contractId) => {
    let input = document.getElementById("inputfieldid").value
    $.post(`https://${GetParentResourceName()}/NUI:TransferContract`, JSON.stringify({
        targetId: input,
        contract: contractId
    }), function(result) {
        if (result) {
            document.getElementById('transfer-container').innerHTML = '';
            let elem = document.getElementById(`decline-id${contractId}`);
            elem.remove()
        } else {
            let Div = document.getElementById('insufficient-money');
            Div.innerHTML += `
            <div class="popup">
                <button onclick={Cancel()} class="popup-button"></button>
                <p class="popuptext">${Locales.ui_cannot_transfer}</p>
            </div>`
        }
    });
}

const TransferContract = (contract) => {
    document.getElementById('insufficient-money').innerHTML = '';
    document.getElementById('accepted-container').innerHTML = '';
    let Div = document.getElementById('transfer-container');
    Div.innerHTML = '';

    return (
        Div.innerHTML +=
        `<div class="transfer-contract-container">
        <h4 class="transfer-contract-title">${Locales.ui_transfer_contract}:</h4>
        <input class="transfer-contract-inputfield" type="number" id="inputfieldid" placeholder="${Locales.ui_enter_serverid}" min="1">
        <div class="transfer-contract-optionButton-flex">
            <button class="transfer-contract-optionButton-continue" onclick={Continue(${contract})}>${Locales.ui_continue}</button>
            <button class="transfer-contract-optionButton-cancel" onclick={Cancel()}>${Locales.ui_cancel}</button>
        </div>
    </div>`
    )
}

const ToggleQueue = () => {
    inQueue = !inQueue

    if (inQueue === true) {
        $.post(`https://${GetParentResourceName()}/NUI:ToggleQueue`, JSON.stringify({})); 
    } else { 
        $.post(`https://${GetParentResourceName()}/NUI:ToggleQueue`, JSON.stringify({}));
    }

    SetQueueButton()
}

const SetQueueButton = () => {
    if (inQueue === true) {
        document.getElementById("ToggleQueue").innerHTML = Locales.ui_leavequeue;
    } else {
        document.getElementById("ToggleQueue").innerHTML = Locales.ui_joinqueue;
    }
}

const RemoveFunction = (id) => {
    let elem = document.getElementById(`decline-id${id}`);
    elem.remove()
    $.post(`https://${GetParentResourceName()}/NUI:DeleteContract`, JSON.stringify({ 'contract': id }));
    document.getElementById('transfer-contract-container').innerHTML = '';
}

const DeclineContract = (id) => {
    document.getElementById('insufficient-money').innerHTML = '';
    document.getElementById('accepted-container').innerHTML = '';
    let Div = document.getElementById('transfer-contract-container');
    Div.innerHTML +=
        `<div class="transfer-contract-container">
        <h4 class="transfer-contract-title">${Locales.ui_confirm_cancel}</h4>
        <div class="transfer-contract-optionButton-flex">
            <button class="transfer-contract-optionButton-continue" onclick={RemoveFunction(${id})}>${Locales.ui_continue}</button>
            <button class="transfer-contract-optionButton-cancel" onclick={Cancel()}>${Locales.ui_cancel}</button>
        </div>
    </div>`
}

const SetProgressBar = (rank, nextrank, pct) => {
    document.getElementById("current-rank").innerHTML = rank;
    document.getElementById("next-rank").innerHTML = nextrank;
    document.getElementById("progress-bar-width").style.width = `${pct}%`;
}

window.onload = ('message', (event) => {
    $.post(`https://${GetParentResourceName()}/NUI:Init`, JSON.stringify({}), function(result) {
        for (const k in result) { Locales[k] = result[k]; }

        document.getElementById('header-text-content').innerHTML = Locales.ui_header;
        document.getElementById('my-contracts-button').innerHTML = Locales.ui_myContracts;
    });

    window.addEventListener("message", (event) => {
        let data = event.data;

        inQueue = data.inqueue;
        contractData = data.contracts;
        started = data.started;

        SetQueueButton();
        SetProgressBar(data.rank, data.nextrank, data.pct);

        if (data.display === true) {
            document.getElementById("html").style.display = '';
            display = true;
        } else {
            document.getElementById("html").style.display = 'none';
            display = false;
        }

        let counter = 0;
        let contractDiv = document.getElementById('containers');
        contractDiv.innerHTML = '';

        if (contractData.length === 0) { return };

        contractData.forEach(element => {
            CountdownTimer(counter, element);
                return (
                    contractDiv.innerHTML +=
                    `<div class="contract-cards margin-cards" id="decline-id${element.id}">
                    <div class="contract-rank">
                        <div class="contract-rank-text">${element.tierlabel.toUpperCase()}</div>
                    </div>
                    <div class="contract-details">
                        <ul class="contract-details-text">
                            <p>${Locales.ui_car}: ${element.vehlabel}</p>
                            <p>${Locales.ui_plate}: ${element.plate}</p>
                            <p>${Locales.ui_buyin}: ${element.price} ${Locales.ui_moneyType}</p>
                            <p id="timer${counter}">${Locales.ui_expires_in}: </p>
                        </ul>
                    </div>
                    <div class="contract-buttons-flex">
                        <button id="start-contract${counter}" onclick={Contract(${element.id},${counter},${element.vinPrice})} class="contract-buttons">${Locales.ui_start_contract}</button>
                        <button id="transfer-contract${counter}" onclick={TransferContract(${element.id})} class="contract-buttons">${Locales.ui_transfer_contract}</button>
                        <button id="decline-contract${counter++}" onclick={DeclineContract(${element.id})} class="contract-buttons">${Locales.ui_decline_contract}</button>
                    </div>
                </div>`
                )
        });
    })
})

// Escape to close
window.addEventListener("keydown", function() {
    if (event.keyCode === 27) {
        CloseButton()
    }
})
