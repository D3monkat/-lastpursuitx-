var tones = new Audio("assets/tones.wav");
tones.volume = 0.5;

const volumeRange = $("#pager-volume");
const volumeDisplay = $("#pager-volume-display");

volumeRange.on("change", () => {
  tones.volume = (Math.floor(volumeRange.val()) / 100);
  volumeDisplay.html(`${volumeRange.val()}%`);
});

const generateUUID = () => {
  return "10000000-1000-4000-8000-100000000000".replace(/[018]/g, (c) =>
    (
      c ^
      (crypto.getRandomValues(new Uint8Array(1))[0] & (15 >> (c / 4)))
    ).toString(16)
  );
};

const createNotificationElement = (from, message, uuid) => {
  const element = $(`<div class="notification ${uuid}" hidden></div>`);
  const contentElement = $(
    `<div class="notification-content"><p class="fromTitle">${from}</p><p class="message">${message}</p></div>`
  );
  const circleElement = $(
    '<div class="notification-circle"><img src="assets/alert.svg"></div>'
  );
  element.append(circleElement).append(contentElement);
  return element;
};

const openPager = (data) => {
  $("#pager-select").empty();
  $("#pager-user").html(
    `${data.playerName} - <span>${data.playerJobGrade.name}</span>`
  );
  $("#pager-user").val(data.playerName);
  data.onlineStaff.forEach(function (player) {
    let option = document.createElement("option");
    option.innerHTML = `${player.fullName}`;
    option.value = player.id;
    $("#pager-select").append(option);
  });
  $(".pager-container").fadeIn();
  $(".pager-container").css("display", "flex");
};

const closePager = () => {
  clearPager();
  fetch(`https://dream-pager/close-pager`, {
    method: "POST",
  });
  $(".pager-container").fadeOut();
};

const incomingPage = (from, message, duration) => {
  let uuid = generateUUID();
  let notificationInstance = createNotificationElement(from, message, uuid);
  notificationInstance.attr("id", uuid);
  $(".notification-container").append(notificationInstance);
  $(`[id=${uuid}]`).fadeIn();
  $(`[id=${uuid}]`).css("display", "flex");
  tones.play();
  setTimeout(() => {
    $(`[id=${uuid}]`).fadeOut(function () {
      $(`[id=${uuid}]`).remove();
    });
  }, duration);
};

window.addEventListener("message", (event) => {
  switch (event.data.type) {
    case "open-pager":
      openPager(event.data.body);
      break;
    case "close-pager":
      closePager();
      break;
    case "incoming-page":
      incomingPage(
        event.data.body.from,
        event.data.body.message,
        event.data.body.duration
      );
      break;
    default:
      break;
  }
});

$(document).ready(function () {
  $(document).keyup(function (e) {
    if (e.key === "Escape" && $(".pager-container").css("display") === "flex") {
      closePager();
    }
  });
});

$(".pager-close").click(function (e) {
  e.preventDefault();
  closePager();
});

function clearPager() {
  $("#pager-message").val("");
  $("#pager-message").removeClass("validator");
}

$(".pager-submit").click(function (e) {
  e.preventDefault();
  const from = $("#pager-user").val();
  const sendTo = $("#pager-select").val();
  const message = $("#pager-message").val();
  if (from != "" && sendTo != "" && message != "") {
    $("#pager-message").removeClass("validator");
    fetch(`https://dream-pager/new-message`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: JSON.stringify({
        to: sendTo,
        from: from,
        sendTo: sendTo,
        message: message,
      }),
    }).then(closePager());
  } else {
    $("#pager-message").addClass("validator");
  }
});
