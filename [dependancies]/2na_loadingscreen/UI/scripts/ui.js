let galleryData = [];
let keyboardData = [];
let preferedSong = "https://www.youtube.com/watch?v=X2iIqTVBV2U";

let rpvideoPlayer;

let rpvideoExpanded = false;
let galleryExpanded = false;
let animationOnHold = false;
let colormodeEnabled = false;

let colors = [];

let currentSong = null;
let currentRPVideo = null;
let playerInterval = null;
let sliderSaveTimeout = null;

async function controlRPVideo(expand) {
  if (animationOnHold) return;

  if (expand) {
    if (galleryExpanded) {
      $(".menu-box-hero-photo").trigger("click");
    }

    rpvideoExpanded = true;
    animationOnHold = true;
    $(".rpvideo-box").css("height", "35vh");
    $(".interactive-menu").css("top", "7.5vh");

    $(".rpvideo-box-text").css("display", "none");
    $(".rpvideo-box .menu-box-icon").css("display", "none");

    $(".rpvideo-thumbnail").addClass("rpvideo-thumbnail-expanding");

    setTimeout(() => {
      $(".rpvideo-thumbnail").css("display", "none");
      $("#rpvideoPlayer").removeClass("rpvideo-hidden");

      rpvideoPlayer.playVideo();

      $(".rpvideo-thumbnail").removeClass("rpvideo-thumbnail-expanding");

      animationOnHold = false;
    }, 450);
  } else {
    rpvideoExpanded = false;
    animationOnHold = true;

    $(".rpvideo-thumbnail").removeAttr("style");

    $(".rpvideo-thumbnail").addClass("rpvideo-thumbnail-collapsing");

    $(".rpvideo-box-text").removeAttr("style");
    $(".rpvideo-box .menu-box-icon").removeAttr("style");

    $(".rpvideo-box").removeAttr("style");
    $(".interactive-menu").removeAttr("style");

    $("#rpvideoPlayer").addClass("rpvideo-hidden");

    setTimeout(() => {
      $(".rpvideo-thumbnail").removeClass("rpvideo-thumbnail-collapsing");
      animationOnHold = false;
    }, 650);
  }
}

let tag = document.createElement("script");
tag.src = "https://www.youtube.com/iframe_api";

let firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubeIframeAPIReady() {
  rpvideoPlayer = new YT.Player("rpvideoPlayer", {
    videoId: getVideoId(currentRPVideo) || "K4DyBUG242c",
    width: "0.001",
    height: "0.001",
    playerVars: {
      playsinline: 0,
      color: "white",
      loop: 1,
    },
    events: {
      onReady: onPlayerReady,
      onStateChange: onPlayerStateChange,
    },
  });

  songPlayer = new YT.Player("songPlayer", {
    videoId: currentSong || "J2X5mJ3HDYE",
    width: "0.001",
    height: "0.001",
    playerVars: {
      playsinline: 0,
      color: "white",
      loop: 1,
    },
    events: {
      onReady: onSongPlayerReady,
      onStateChange: onSongPlayerStateChange,
    },
  });
}

function onSongPlayerReady() {
  if (currentSong) {
    songPlayer.loadVideoById(getVideoId(currentSong), 0);
  } else songPlayer.playVideo();
}

function onSongPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING) {
    const title = songPlayer?.getVideoData()?.title;

    $(".music-details-title").text(title);

    playerInterval = setInterval(() => {
      const currentTime = songPlayer.getCurrentTime();
      const songDuration = songPlayer.getDuration();

      const donePlaying = (currentTime / songDuration) * 100;

      $("#music-timepassed").text(
        `${Math.floor(currentTime / 60)}:${(currentTime % 60)?.toFixed(0)}`
      );
      $("#music-timeremaining").text(
        `-${Math.floor(Math.abs(songDuration - currentTime) / 60)}:${(
          Math.abs(songDuration - currentTime) % 60
        )?.toFixed(0)}`
      );

      $(".music-progbar-fill").css("width", `${donePlaying}%`);
    }, 1000);
  } else if (event.data == YT.PlayerState.PAUSED) {
    clearInterval(playerInterval);
    playerInterval = null;
  }
}

function onPlayerReady() {
  $("#rpvideoPlayer").addClass("rpvideo-fullscreen").addClass("rpvideo-hidden");
}
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PAUSED) {
    controlRPVideo(false);
  }
}

function getGalleryImage(id) {
  let targetImage = null;
  for (let i = 0; i < galleryData.length; i++) {
    if (galleryData[i].id == id) targetImage = galleryData[i];
  }
  return targetImage;
}

function getKeyHelp(key) {
  let helpText = null;
  for (let i = 0; i < keyboardData.length; i++) {
    if (keyboardData[i].key == key) {
      helpText = keyboardData[i].helpText;
    }
  }

  return helpText;
}

async function wait(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

$(document).ready(() => {
  $(".menu-box-photo").on("click", async function () {
    if (animationOnHold) return;

    if (rpvideoExpanded) {
      rpvideoPlayer.pauseVideo();
      controlRPVideo(false);
      await wait(700);
    }

    animationOnHold = true;

    const newImgLink = getGalleryImage($(this).attr("data-id")).image;
    const currentHeroImg = $(".menu-box-hero-photo").children("img");

    $(".interactive-menu").css("top", "7.5vh");
    $(".menu-box-hero-photo").css("display", "flex");

    if (currentHeroImg.length > 0) {
      currentHeroImg.attr("src", newImgLink).css("display", "none");

      currentHeroImg.css("display", "unset");

      animationOnHold = false;
    } else {
      $(".menu-box-hero-photo").append(`<img src="${newImgLink}" />`);

      setTimeout(() => {
        animationOnHold = false;
      }, 400);
    }

    galleryExpanded = true;
  });

  $(".menu-box-hero-photo").on("click", function (e) {
    $(".menu-box-hero-photo").children().remove();

    $(".menu-box-hero-photo").css("display", "none");

    $(".interactive-menu").removeAttr("style");

    galleryExpanded = false;
  });

  $(".keyboard-btn").on("click", function (e) {
    if ($(this).attr("not-clickable") !== undefined) return;

    const clickedKey =
      ($(this).text().trim().length == 0 ? null : $(this).text()) ||
      $(this).attr("key-id");

    const helpText =
      getKeyHelp(clickedKey) ||
      "Unfortunately, there isn't any help available.";

    $(".keyboard-menu-help-key").children().remove();
    $(".keyboard-menu-help-key").text("");

    if ($(this).text().trim().length == 0 ? null : $(this).text()) {
      $(".keyboard-menu-help-key").text(clickedKey);
    } else {
      $(this).children().clone().appendTo(".keyboard-menu-help-key");
    }
    $(".keyboard-menu-help-description-text").text(helpText);
  });
});

function toggleMusicBox() {
  const shouldCollapse = $(".music-player-right-part").is(":visible");

  if (shouldCollapse) {
    $(".music-player-right-part").css("display", "none");
    $(".music-player").css({
      width: "unset",
      padding: "1vh",
      "flex-direction": "column",
    });
    $(".music-thumbnail img").css("height", "7vh");
    $(".new-update").css("width", "80%");
    $(".music-mini-progbar").css("display", "unset");

    $(".music-control-toggle").css("transform", "rotate(90deg)");
  } else {
    $(".music-player-right-part").removeAttr("style");
    $(".music-player").removeAttr("style");
    $(".music-thumbnail img").removeAttr("style");
    $(".new-update").removeAttr("style");
    $(".music-mini-progbar").removeAttr("style");

    $(".music-control-toggle").removeAttr("style");
  }
}

function sliderChanged(id, state) {
  switch (id) {
    case "darkmode":
      if (state) $(".container").attr("theme", "dark");
      else $(".container").attr("theme", "white");
      window.localStorage.setItem("darkmode", state);
      break;
    case "colormode":
      colormodeEnabled = state;
      colorInputChange();
      break;
  }
}

function sliderInputClick(e) {
  const isEnabled = $(e.currentTarget).attr("style");

  if (isEnabled) {
    $(e.currentTarget).removeAttr("style");
    sliderChanged($(e.currentTarget).attr("data-id"), false);
  } else {
    $(e.currentTarget).css("justify-content", "flex-end");
    sliderChanged($(e.currentTarget).attr("data-id"), true);
  }
}

function colorInputChange(event) {
  const color1 = `hsl(${$("#primary-color").val() * 3.6},100%,50%)`;
  const color2 = `hsl(${$("#secondary-color").val() * 3.6},100%,50%)`;

  colors = [$("#primary-color").val() * 3.6, $("#secondary-color").val() * 3.6];

  if (colormodeEnabled) {
    $(".theme-color").css(
      "background",
      `radial-gradient(circle at center, ${color1}, ${color2}, transparent 50%)`
    );
    $(".progressbar-filler").css(
      "background",
      `linear-gradient(90deg, ${color1}, ${color2})`
    );
  } else {
    $(".theme-color").removeAttr("style");
    $(".progressbar-filler").css("background", "white");
  }

  window.localStorage.setItem(
    "colormode",
    JSON.stringify({
      enabled: colormodeEnabled,
      colors: colors,
    })
  );
}

function toggleSettingsMenu() {
  if ($(".settings-menu").attr("style")) {
    $(".settings-menu").removeAttr("style");
  } else {
    $(".settings-menu").css("display", "none");
  }
}

function isURLValid(link) {
  let isValid = false;

  try {
    url = new URL(link);

    isValid = true;
  } catch {
    isValid = false;
  }

  return isValid;
}

async function isURLHeadedToAnImage(url) {
  return new Promise((resolve) => {
    $.get(url, function (data, success, dataType) {
      if (success) {
        const rawResponseHeaders = dataType
          ?.getAllResponseHeaders()
          ?.split("\n");
        let responseHeaders = {};

        rawResponseHeaders.forEach((rawResponseHead) => {
          rawResponseHead = rawResponseHead.split(":");
          responseHeaders[rawResponseHead[0]] = rawResponseHead[1]
            ?.replace("\r", "")
            ?.trim();
        });

        if (responseHeaders["content-type"]) {
          if (responseHeaders["content-type"].startsWith("image")) {
            resolve(true);
            return;
          }
        }
      }

      resolve(false);
    });
  });
}

async function changeBackground(shouldSave) {
  const url = $("#input_background").val()?.trim();

  if (isURLValid(url)) {
    const urllHeadedToAnImage = await isURLHeadedToAnImage(url);

    if (urllHeadedToAnImage)
      $(".wallpaper").css("background-image", `url(${url})`);

    if (shouldSave) window.localStorage.setItem("background", url);
  } else {
    if (!url) {
      $(".wallpaper").removeAttr("style");
      if (shouldSave) window.localStorage.removeItem("background");
    }

    $("#input_background").val("");
  }
}

function toggleKeyboardMenu() {
  if ($(".keyboard-menu").attr("style")) {
    $(".keyboard-menu").removeAttr("style");
  } else {
    $(".keyboard-menu").css("display", "none");
  }
}

function toggleMusicState(event) {
  if (playerInterval) {
    songPlayer.pauseVideo();
    $(event.currentTarget).attr("src", "images/icons/play.svg");
  } else {
    songPlayer.playVideo();
    $(event.currentTarget).attr("src", "images/icons/pause.svg");
  }
}

function getVideoId(url) {
  var regExp =
    /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
  var match = url?.match(regExp);
  return match && match[7].length == 11 ? match[7] : false;
}

function changeSong(shouldSave) {
  const song = $("#input_song").val().trim();
  const youtubeRegEx = new RegExp(
    /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|shorts\/|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
  );

  if (youtubeRegEx.test(song)) {
    songPlayer.loadVideoById(getVideoId(song), 0);

    if (shouldSave) window.localStorage.setItem("song", song);
  } else {
    if (!song) {
      songPlayer.loadVideoById("J2X5mJ3HDYE", 0);
      if (shouldSave) window.localStorage.removeItem("song");
    }
  }
}

window.addEventListener("DOMContentLoaded", () => {
  let data = window.nuiHandoverData;

  if (data?.gallery) {
    galleryData = data.gallery;

    for (let i = 0; i < galleryData.length; i++) {
      const image = galleryData[i];

      $(`#thumbnail-${i + 1}`)
        .attr("src", image.thumbnail)
        .attr("data-id", image.id);
    }
  }

  if (data?.update) {
    $("#new_update-title").text(data.update.title);
    $("#new_update-description").text(data.update.description);
  }

  if (data?.keyboard) {
    keyboardData = data?.keyboard;

    for (let i = 0; i < keyboardData.length; i++) {
      const keyData = keyboardData[i];

      $(`.keyboard-btn`).each((_, btn) => {
        if (
          $(btn).text() == keyData.key ||
          $(btn).attr("key-id") == keyData.key
        ) {
          $(btn).css({
            background: "#8f8e8e",
            color: "black",
          });
        }
      });
    }
  }

  if (data?.player) {
    $("#player-id").text(data.player.id);
    $("#player_name").text(data.player.name);
    $(".character-photo").text(data?.player.name.slice(0, 1));
  }

  if (data?.rpvideo) {
    $("#rpvideo-img").text(data.rpvideo.image);
    $("#rpvideo-title").text(data.rpvideo.title);
    $(".rpvideo-box-text-description").text(data?.rpvideo.description);
    currentRPVideo = data.rpvideo.url;
  }

  let darkmode = window.localStorage.getItem("darkmode");
  if (darkmode != undefined && darkmode != null) {
    if (darkmode == "true") {
      $(".container").attr("theme", "dark");
      $("#darkmode-slider").css("justify-content", "flex-end");
    } else {
      $(".container").attr("theme", "white");
      $("#darkmode-slider").removeAttr("style");
    }
  } else {
    window.localStorage.setItem("darkmode", true);
  }

  let colormode = JSON.parse(window.localStorage.getItem("colormode"));
  if (colormode) {
    colormodeEnabled = colormode?.enabled || false;
    colors = colormode?.colors || [0, 0];

    if (colormodeEnabled) {
      $("#colormode-slider").css("justify-content", "flex-end");

      $(".theme-color").css(
        "background",
        `radial-gradient(circle at center, hsl(${colors[0]}, 100%, 50%), hsl(${colors[1]}, 100%, 50%), transparent 50%)`
      );

      $(".progressbar-filler").css(
        "background",
        `linear-gradient(90deg, hsl(${colors[0]}, 100%, 50%), hsl(${colors[1]}, 100%, 50%))`
      );
    } else {
      $("#colormode-slider").removeAttr("style");
      $(".theme-color").removeAttr("style");
      $(".progressbar-filler").css("background", "white");
    }

    $("#primary-color").val(colors[0] / 3.6);
    $("#secondary-color").val(colors[1] / 3.6);
  } else {
    window.localStorage.setItem(
      "colormode",
      JSON.stringify({
        enabled: false,
        colors: [0, 0],
      })
    );
  }

  let background = window.localStorage.getItem("background");
  if (background) {
    $("#input_background").val(background);
    changeBackground(false);
  }

  let song = window.localStorage.getItem("song");
  if (song) {
    $("#input_song").val(song);
    currentSong = song;
  }
});

window.addEventListener("message", function (e) {
  (handlers[e.data.eventName] || function () {})(e.data);
});

const handlers = {
  loadProgress(data) {
    $(".progressbar-filler").css("width", `${data.loadFraction * 100}%`);
  },
};
