$("#ui").hide();
$("#applyUI").hide();
$("#laws-container").hide();
$("#laws-container-management").hide();
$("#voting-container-management").hide();
$("#laws-container-passed").hide();

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const localeFileURL = 'language.json'; 



let Language = {};


ChooseLanguage = (lang, cb) => {
  fetchAndDecodeJSON(localeFileURL)
    .then(localeData => {
      const locales = localeData[lang];
      Language = locales;
      if (cb){
        cb();
      }
      
    })
    .catch(error => {
      console.error('Error decoding JSON:', error);
    });
}

function fetchAndDecodeJSON(url) {
  return fetch(url)
    .then(response => {
      if (!response.ok) {
        throw new Error(`Network response was not ok: ${response.status}`);
      }
      return response.json();
    });
}


document.addEventListener("DOMContentLoaded", () => {
   $.post(`http://ap-government/getLanguage`, JSON.stringify({}), function(lang){
      ChooseLanguage(lang, function(){

      }) 
    })
});



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var candidates = [];

const RECORDS_PER_PAGE = 4;
var currentPage = 1;
var chosenCandidateName = "";
var chosenCandidateID = 0;

var UsingLawVoting = false;
var IsManagementMayor = false;
var isPassedLaws = false;
var laws = [];

var UsingVotingManagement = false;
var dbCandidates = [];
var dbSettings = [];
var configVoting = [];
var pollInfo = [];

addEventListener("message", async function (event) {
  var eventData = event.data;

  if (eventData.type == "show") {
    await getCandidatesData();
    showUI();
  } else if (eventData.type == "showCandidatesApp") {
    $("#applyUI").show();
  } else if (eventData.type == "close") {
    closeUI();
  } else if (eventData.type == "openLawVoting") {
    laws = eventData.laws;
    generateLawUI();
    UsingLawVoting = true;
  } else if (eventData.type == "openLawVotingManagement") {
    laws = eventData.laws;
    $("#laws-container-management").show();
    managementUI('laws-container-management');
    IsManagementMayor = true;
  } else if (eventData.type == "refreshLaws") {
    laws = [];
    laws = eventData.laws;
  } else if (eventData.type == "openManagementGov") {
    dbCandidates = eventData.candidates;
    dbSettings = eventData.settings;
    configVoting = eventData.configVoting;
    pollInfo = eventData.pollInfo;
    UsingVotingManagement = true;
    $("#voting-container-management").show();
    RefreshSettings();
  } else if (eventData.type == "refreshManagement") {
    dbCandidates = [];
    dbSettings = [];
    configVoting = [];
    pollInfo = [];
    dbCandidates = eventData.candidates;
    dbSettings = eventData.settings;
    configVoting = eventData.configVoting;
    pollInfo = eventData.pollInfo;
  } else if (eventData.type == "passedLaws") {
    isPassedLaws = true;
    $("#laws-container-passed").show();
    if (eventData.staff == true) {
      passedLaws(true, eventData.laws);
    } else {
      passedLaws(false, eventData.laws);
    }
  }
});

async function getCandidatesData() {
  await $.post(
    `https://${GetParentResourceName()}/getCandidate`,
    JSON.stringify({}),
    function (candidatesInfo) {
      candidatesInfo.forEach((candidateInfo) => {
        candidates.push({
          citizen: candidateInfo.identifier,
          name: candidateInfo.name,
          age: candidateInfo.age,
          shortDescription: candidateInfo.shortDescription,
          whyDoYouWantToBeACandidate: candidateInfo.whyDoYouWantToBeACandidate,
          WhatYoullBringToTheCity: candidateInfo.WhatYoullBringToTheCity,
        });
      });
    }
  );
}

async function refreshVotingSettings() {
  await $.post(
    `https://${GetParentResourceName()}/refreshVotingSettings`,
    JSON.stringify({}),
    function (information) {
      dbCandidates = information.candidates;
      dbSettings = information.settings;
      configVoting = information.configVoting;
      pollInfo = information.pollInfo;
    }
  );
}

function changePage(page) {
  const nextBtn = document.getElementById("nextBtn");
  const prevBtn = document.getElementById("prevBtn");
  const candidatesDiv = document.getElementById("candidates");

  prevBtn.style.display = "none";
  nextBtn.style.display = "none";

  if (page < 1) page = 1;
  if (page > numPages()) page = numPages();

  candidatesDiv.innerHTML = "";

  for (
    var i = (page - 1) * RECORDS_PER_PAGE;
    i < page * RECORDS_PER_PAGE && i < candidates.length;
    i++
  ) {
    candidatesDiv.innerHTML += `
        <div class="drop-shadow-lg flex flex-row mb-3 justify-between items-center w-[522px] h-min bg-[#9ba9e0]/80 rounded-lg font-semibold">
            <div class="m-2">
                <h1>${candidates[i].name}, <span>${candidates[i].age}</span></h1>
                <p class="mt-2 w-96">${truncateDescription(candidates[i].shortDescription, 20)}</p>
            </div>
            <div class="mr-3">
                <a href="javascript:openCandidatePage(${i})" id="viewBtn" class="inline-flex items-center py-2 px-4 text-sm font-medium text-white bg-blue-500 border border-solid border-slate-800 rounded-lg border border-gray-300 hover:bg-blue-700">
                    ${Language.VotingUI.ViewCandidate}
                    <svg aria-hidden="true" class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
            </div>
        </div>
    `;
  }

  if (candidates.length <= 4) {
    prevBtn.style.display = "none";
    nextBtn.style.display = "none";
  } else {
    if (page > 1 && page < numPages()) {
      prevBtn.style.display = "flex";
      nextBtn.style.display = "flex";
    } else if (page === 1) {
      prevBtn.style.display = "none";
      nextBtn.style.display = "flex";
    } else if (page === numPages()) {
      prevBtn.style.display = "flex";
      nextBtn.style.display = "none";
    }
  }
}

function truncateDescription(description, wordLimit) {
  const words = description.split(' ');
  if (words.length > wordLimit) {
    return words.slice(0, wordLimit).join(' ') + '...';
  } else {
    return description;
  }
}

function numPages() {
  return Math.ceil(candidates.length / RECORDS_PER_PAGE);
}

function prevPage() {
  if (currentPage > 1) {
    currentPage--;
    changePage(currentPage);
  }
}

function nextPage() {
  if (currentPage < numPages()) {
    currentPage++;
    changePage(currentPage);
  }
}

function getSelectItem() {
  chosenCandidateName = candidates[chosenCandidateID].name;

  document.getElementById("candidatePage").style.display = "none";
  document.getElementById("pageBtnsGroup").style.display = "none";

  document.getElementById("beforeSubmittingText").style.display = "block";
  document.getElementById("submitBtnsGroup").style.display = "flex";

  document.getElementById("yourVote").style.display = "block";

  document.getElementById(
    "yourVote"
  ).innerText = Language.VotingUI.YourVote.replace("{candidate}", chosenCandidateName);
}

function openCandidatePage(id) {
  document.getElementById("candidates").style.display = "none";
  document.getElementById("candidatesBtnsGroup").style.display = "none";

  chosenCandidateID = id;

  const {
    name,
    age,
    shortDescription,
    whyDoYouWantToBeACandidate,
    WhatYoullBringToTheCity,
  } = candidates[id];

  const header = document.getElementById("pageHeader");
  const paragraph = document.getElementById("pageP");

  header.innerHTML = `${name}, <span>${age}</span><br />${shortDescription}`;
  paragraph.innerHTML = `
    ${Language.VotingUI.Question1}
    <span class="text-[grey]"><br>${whyDoYouWantToBeACandidate}</span><br />
    ${Language.VotingUI.Question2}
    <span class="text-[grey]"><br>${WhatYoullBringToTheCity}</span>
    `;

  document.getElementById("candidatePage").style.display = "block";
  document.getElementById("pageBtnsGroup").style.display = "flex";
}

function goBackFromSubmit() {
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";

  document.getElementById("candidatePage").style.display = "none";
  document.getElementById("pageBtnsGroup").style.display = "none";

  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";

  document.getElementById("yourVote").style.display = "none";

  changePage(1);
  currentPage = 1;
}

function goBackFromCandidatePage() {
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";

  changePage(1);
  currentPage = 1;

  document.getElementById("pageBtnsGroup").style.display = "none";
  document.getElementById("candidatePage").style.display = "none";
}

function submit() {
  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";

  document.getElementById("afterSubmittingText").classList.remove("hidden");
  document.getElementById("afterSubmittingText").classList.add("flex");

  const { name } = candidates[chosenCandidateID];
  const { citizen } = candidates[chosenCandidateID];

  document.getElementById("yourVote").innerText = Language.VotingUI.SubmitVote.replace("{name}", name);

  if (chosenCandidateName !== "") {
    $.post(`https://${GetParentResourceName()}/voteForSomeone`, JSON.stringify({ citizen }));

    setTimeout(function () {
      closeUI();
    }, 5000);
  } else {
    $.post(`https://${GetParentResourceName()}/error`);
  }

  setTimeout(function () {
    closeUI();
  }, 5000);
}

function closeUI() {
  candidates = [];

  currentPage = 1;
  chosenCandidateName = "";
  chosenCandidateID = 0;

  $.post(`https://${GetParentResourceName()}/close`);

  $("#ui").hide();

  resetUI();
}

function resetUI() {
  document.getElementById("afterSubmittingText").classList.remove("flex");
  document.getElementById("afterSubmittingText").classList.add("hidden");
  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";
  document.getElementById("pageBtnsGroup").style.display = "none";
  document.getElementById("candidatePage").style.display = "none";
}

document.onkeyup = function (event) {
  const charCode = event.key;
  if (charCode == "Escape") {
    closeUI();
    closeCandidateAppUI();
    $("#ui").hide();
    if (IsManagementMayor == true) {
      return closeManagement();
    } else if (UsingLawVoting == true) {
      laws = [];
      LawDataLog = [];
      UsingLawVoting = false;
      $("#laws-container").hide();
      var Table = document.getElementById("laws-container");
      Table.innerHTML = "";
    } else if (UsingVotingManagement == true) {
      UsingVotingManagement = false;
      ResetSettingsContainer();
      ResetCandidateContainer();
      ResetApplicationContainer();
      dbCandidates = [];
      dbSettings = [];
      configVoting = [];
      divIDs = [];
      candidateIDs = [];
      applicationIDs = [];
      pollInfo = [];
      $("#voting-container-management").hide();
    } else if (isPassedLaws == true) {
      ResetPassedLawsContainer();
      isPassedLaws = false;
      passedLawsIDs = [];
      $("#laws-container-passed").hide();
    }
  }
};

function showUI() {
  $("#ui").show();
  changePage(1);
}

function clearInputs() {
  $("#firstQ").val("");
  $("#secondQ").val("");
  $("#thirdQ").val("");
}

$("#clearBtn").click(function () {
  return clearInputs();
});

$("#submitAppBtn").click(function () {

  let q1El = $("#firstQ");
  let q2El = $("#secondQ");
  let q3El = $("#thirdQ");

  let q1Label = $("#q1Label");
  let q2Label = $("#q2Label");
  let q3Label = $("#q3Label");

  let q1Val = $.trim(q1El.val());
  let q2Val = $.trim(q2El.val());
  let q3Val = $.trim(q3El.val());

  let q1Len = getWordCount(q1Val);
  let q2Len = getWordCount(q2Val);
  let q3Len = getWordCount(q3Val);

  if (q1Len > 200 || 20 > q1Len) {
    q1El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q1Label.addClass("text-red-900");

    return q1El.val("");
  } else {
    q1El.addClass("bg-green-50 border border-green-500 text-green-900");
    q1Label.addClass("text-green-700");
  }

  if (q2Len > 500 || 30 > q2Len) {
    q2El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q2Label.addClass("text-red-900");

    return q2El.val("");
  } else {
    q2El.addClass("bg-green-50 border border-green-500 text-green-900");
    q2Label.addClass("text-green-700");
  }

  if (q3Len > 500 || 30 > q3Len) {
    q3El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q3Label.addClass("text-red-900");

    return q3El.val("");
  } else {
    q3El.addClass("bg-green-50 border border-green-500 text-green-900");
    q3Label.addClass("text-green-700");
  }

  returnApplicationData(q1Val, q2Val, q3Val);

  closeCandidateAppUI();
});

function returnApplicationData(q1, q2, q3) {
  return $.post(
    `https://${GetParentResourceName()}/submitCandidateApplication`,
    JSON.stringify({ q1, q2, q3 })
  );
}

function getWordCount(str) {
  return str.split(" ").length;
}

function closeCandidateAppUI() {
  $.post(`https://${GetParentResourceName()}/close`);

  $("#applyUI").hide();
}

var LawDataLog = [];

function vote(lawId, law, type) {
  const selectedLaw = laws.find((law) => law.id === lawId);
  if (selectedLaw && type == 'fors') {
    selectedLaw.fors++;
  } else if (selectedLaw && type == 'against') {
    selectedLaw.against++;
  }

  if (selectedLaw) {
    updateVoteCount(lawId, selectedLaw);
    removeVoteButton(lawId);
    storeVoteData(law, type);
  }
}

function updateVoteCount(lawId, vote) {
  const voteCountElement = document.querySelector(`#vote-count-${lawId}`);
  if (voteCountElement) {
    voteCountElement.textContent = Language.LawVotingUI.AmountOfVotes
      .replace("{for}", vote.fors)
      .replace("{against}", vote.against);
  }
}

function removeVoteButton(lawId) {
  const voteForButton = document.querySelector(`#vote-button-for-${lawId}`);
  if (voteForButton) {
    voteForButton.remove();
  }
  const voteAgainstButton = document.querySelector(`#vote-button-against-${lawId}`);
  if (voteAgainstButton) {
    voteAgainstButton.remove();
  }
}

function storeVoteData(law, type) {
  if (law != null) {
    law.type = type;
    $.post(`https://${GetParentResourceName()}/updateLawVoting`, JSON.stringify({ law }));
  }
}

function createTimer(time) {
  const timerElement = document.createElement('div');
  timerElement.textContent = Language.LawVotingUI.EndDate.replace("{time}", time);
  return timerElement;
}

var passedLawsIDs = [];

function passedLaws(isStaff, laws) {
  passedLawsIDs.forEach((lawids) => {
    const passedLawUIDiv = document.querySelector(`#passedLawsUI-${lawids}`);
    if (passedLawUIDiv) {
      passedLawUIDiv.remove();
    }
  });

  const lawsRefreshDiv = document.querySelector(`#lawsRefresh`);
  if (lawsRefreshDiv) {
    lawsRefreshDiv.remove();
  }

  const mainContainer = document.getElementById('laws-container-passed');

  const containerDiv = document.createElement('div');
  containerDiv.classList.add('overflow-y-auto', 'scrollbar');
  containerDiv.style.maxHeight = '470px';

  if (laws.length >= 1) {
    let isElseExecuted = false;
    laws.forEach((law) => {
      if (law.state === 1) {
        passedLawsIDs.push(law.id);

        const lawContainer = document.createElement('div');
        lawContainer.setAttribute('id', `passedLawsUI-${law.id}`);
        lawContainer.classList.add('bg-[#9ba9e0]/80', 'rounded', 'p-4', 'm-2');

        const lawTitle = document.createElement('h2');
        lawTitle.classList.add('text-lg', 'font-bold', 'mb-2', 'cursor-pointer');
        lawTitle.textContent = law.name;

        const lawDetailsContainer = document.createElement('div');
        lawDetailsContainer.classList.add('hide'); // Initially hide the details

        const lawDescription = document.createElement('p');
        lawDescription.classList.add('text-gray-800', 'mb-2');
        lawDescription.textContent = law.description;

        const voteCountElement = document.createElement('span');
        voteCountElement.classList.add('font-bold', 'text-gray-800', 'mr-2');
        voteCountElement.textContent = Language.LawVotingUI.AmountOfVotes
          .replace("{for}", law.fors)
          .replace("{against}", law.against);

        lawDetailsContainer.appendChild(lawDescription);
        lawDetailsContainer.appendChild(voteCountElement);

        if (isStaff) {
          const deleteButton = document.createElement('button');
          deleteButton.innerHTML = 'X';
          deleteButton.classList.add('m-2', 'bg-red-500', 'text-white', 'rounded', 'py-1', 'px-2');
          deleteButton.style.border = "none";
          deleteButton.addEventListener('click', (event) => {
            lawContainer.remove();
            $.post(`https://${GetParentResourceName()}/removePassedLaw`, JSON.stringify({ law }));
          });

          lawTitle.appendChild(deleteButton);
        }

        lawTitle.addEventListener('click', () => {
          lawDetailsContainer.classList.toggle('hide');
        });

        lawContainer.appendChild(lawTitle);
        lawContainer.appendChild(lawDetailsContainer);
        containerDiv.appendChild(lawContainer);
      } else {
        if (!isElseExecuted) {
          const allCandidatesInactive = laws.every((data) => data.state !== 1);
          if (allCandidatesInactive) {
            const settingsContainer = createSettingsContainer(`lawsRefresh`);
            const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoPassedLaws);
            settingsContainer.appendChild(Title);
            mainContainer.appendChild(settingsContainer);
            isElseExecuted = true;
          }
        }
      }
    });
  } else {
    const allCandidatesInactive = laws.every((data) => data.state !== 1);
    if (allCandidatesInactive) {
      const settingsContainer = createSettingsContainer(`lawsRefresh`);
      const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoPassedLaws);
      settingsContainer.appendChild(Title);
      mainContainer.appendChild(settingsContainer);
    }
  }

  mainContainer.appendChild(containerDiv);
}


function generateLawUI() {
  $("#laws-container").show();

  const lawsContainer = document.getElementById('laws-container');
  lawsContainer.classList.add('hidden', 'w-[600px]', 'h-[534px]', 'bg-[#25262B]/90', 'drop-shadow-lg', 'rounded-lg', 'divide-y', 'overflow-y-auto', 'scrollbar');

  const headerDiv = document.createElement('div');
  headerDiv.classList.add('flex', 'flex-row', 'justify-between', 'items-center', 'm-5', 'text-white', 'font-bold');

  const headerText = document.createElement('h1');
  headerText.classList.add('w-64', 'h-11', 'text-2xl');
  headerText.textContent = Language.LawVotingUI.LawVotingHeader;

  headerDiv.appendChild(headerText);
  lawsContainer.appendChild(headerDiv);

  const containerDiv = document.createElement('div');
  containerDiv.classList.add('overflow-y-auto', 'scrollbar');
  containerDiv.style.maxHeight = '450px';

  if (laws.length >= 1) {
    let isElseExecuted = false;
    laws.forEach((law) => {
      if (law.state === 0) {
        const lawContainer = document.createElement('div');
        lawContainer.classList.add('bg-[#9ba9e0]/80', 'rounded', 'p-4', 'm-2');

        const lawTitle = document.createElement('h2');
        lawTitle.classList.add('text-lg', 'font-bold', 'mb-2');
        lawTitle.textContent = law.name;

        const lawDescription = document.createElement('p');
        lawDescription.classList.add('text-gray-800', 'mb-2');
        lawDescription.textContent = law.description;

        const voteCountElement = document.createElement('span');
        voteCountElement.classList.add('font-bold', 'text-gray-800', 'mr-2');
        voteCountElement.setAttribute('id', `vote-count-${law.id}`);

        const voteForButton = document.createElement('button');
        voteForButton.classList.add('bg-green-500', 'text-white', 'py-2', 'px-4', 'rounded');
        voteForButton.setAttribute('id', `vote-button-for-${law.id}`);
        voteForButton.textContent = '\u{2713}';
        voteForButton.addEventListener('click', () => vote(law.id, law, 'fors'));

        const voteAgainstButton = document.createElement('button');
        voteAgainstButton.classList.add('bg-red-500', 'text-white', 'py-2', 'px-4', 'rounded');
        voteAgainstButton.setAttribute('id', `vote-button-against-${law.id}`);
        voteAgainstButton.textContent = '\u{58}';
        voteAgainstButton.addEventListener('click', () => vote(law.id, law, 'against'));

        const timerElement = createTimer(law.date);

        lawContainer.appendChild(lawTitle);
        lawContainer.appendChild(lawDescription);

        if (law.storage) {
          voteCountElement.textContent = Language.LawVotingUI.AmountOfVotes
            .replace("{for}", law.fors)
            .replace("{against}", law.against);
          lawContainer.appendChild(voteCountElement);
        } else {
          lawContainer.appendChild(voteForButton);
          voteCountElement.textContent = '';
          lawContainer.appendChild(voteCountElement);
          lawContainer.appendChild(voteAgainstButton);
        }

        lawContainer.appendChild(timerElement);

        containerDiv.appendChild(lawContainer)
        lawsContainer.appendChild(containerDiv);
      } else {
        if (!isElseExecuted) {
          const allCandidatesInactive = laws.every((data) => data.state !== 0);
          if (allCandidatesInactive) {
            const settingsContainer = createSettingsContainer(`lawsRefresh`);
            const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoVotingLaws);
            settingsContainer.appendChild(Title);
            lawsContainer.appendChild(settingsContainer);
            isElseExecuted = true;
          }
        }
      }
    });
  } else {
    const allCandidatesInactive = laws.every((data) => data.state !== 0);
    if (allCandidatesInactive) {
      const settingsContainer = createSettingsContainer(`lawsRefresh`);
      const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoVotingLaws);
      settingsContainer.appendChild(Title);
      lawsContainer.appendChild(settingsContainer);
    }
  }
}

var divIDs = [];
var candidateIDs = [];
var applicationIDs = [];

function managementUI(id) {
  ChangeButtonLaw('view-laws');

  divIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#managementUI-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });

  const createLawDiv = document.querySelector(`#createLaw`);
  if (createLawDiv) {
    createLawDiv.remove();
  }

  const lawsRefreshDiv = document.querySelector(`#lawsRefresh`);
  if (lawsRefreshDiv) {
    lawsRefreshDiv.remove();
  }

  $.post(`https://${GetParentResourceName()}/refreshVotingLaws`);

  const mainContainer = document.getElementById(id);

  const containerDiv = document.createElement('div');
  containerDiv.classList.add('overflow-y-auto', 'scrollbar');
  containerDiv.style.maxHeight = '470px';

  if (laws.length >= 1) {
    let isElseExecuted = false;
    laws.forEach((law) => {
      if (law.state === 0) {

        divIDs.push(law.id);

        const lawContainer = document.createElement('div');
        lawContainer.setAttribute('id', `managementUI-${law.id}`);
        lawContainer.classList.add('bg-[#9ba9e0]/80', 'rounded', 'p-4', 'm-2');

        const lawTitle = document.createElement('h2');
        lawTitle.classList.add('text-lg', 'font-bold', 'mb-2');
        lawTitle.textContent = law.name;

        const lawDescription = document.createElement('p');
        lawDescription.classList.add('text-gray-800', 'mb-2');
        lawDescription.textContent = law.description;

        const voteCountElement = document.createElement('span');
        voteCountElement.classList.add('font-bold', 'text-gray-800', 'mr-2');
        voteCountElement.setAttribute('id', `vote-count-${law.id}`);
        voteCountElement.textContent = Language.LawVotingUI.AmountOfVotes
          .replace("{for}", law.fors)
          .replace("{against}", law.against);

        const timerElement = createTimer(law.date);

        lawContainer.appendChild(lawTitle);
        lawContainer.appendChild(lawDescription);
        lawContainer.appendChild(voteCountElement);
        lawContainer.appendChild(timerElement);
        containerDiv.appendChild(lawContainer)
        mainContainer.appendChild(containerDiv);
      } else {
        if (!isElseExecuted) {
          const allCandidatesInactive = laws.every((data) => data.state !== 0);
          if (allCandidatesInactive) {
            const settingsContainer = createSettingsContainer(`lawsRefresh`);
            const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoActiveLaws);
            settingsContainer.appendChild(Title);
            mainContainer.appendChild(settingsContainer);
            isElseExecuted = true;
          }
        }
      }
    });
  } else {
    const allCandidatesInactive = laws.every((data) => data.state !== 0);
    if (allCandidatesInactive) {
      const settingsContainer = createSettingsContainer(`lawsRefresh`);
      const Title = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.LawVotingUI.NoActiveLaws);
      settingsContainer.appendChild(Title);
      mainContainer.appendChild(settingsContainer);
    }
  }
}

function ChangeButtonLaw(container) {
  if (container == "create-law") {
    const showLaws = document.getElementById('active-button');
    showLaws.classList.remove('text-blue-700');
    showLaws.classList.add('text-white');
    const createLaws = document.getElementById('law-button');
    createLaws.classList.add('text-blue-700');
  } else if (container == "view-laws") {
    const createLaws = document.getElementById('law-button');
    createLaws.classList.remove('text-blue-700');
    createLaws.classList.add('text-white');
    const showLaws = document.getElementById('active-button');
    showLaws.classList.add('text-blue-700');
  } else if (container == "close") {
    const createLaws = document.getElementById('law-button');
    createLaws.classList.remove('text-blue-700');
    createLaws.classList.add('text-white');
    const showLaws = document.getElementById('active-button');
    showLaws.classList.remove('text-blue-700');
    showLaws.classList.add('text-white');
  }
}

function createLaw(id) {
  ChangeButtonLaw('create-law');

  const createLawDiv = document.querySelector(`#createLaw`);
  if (createLawDiv) {
    createLawDiv.remove();
  }

  divIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#managementUI-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });

  const lawsRefreshDiv = document.querySelector(`#lawsRefresh`);
  if (lawsRefreshDiv) {
    lawsRefreshDiv.remove();
  }

  $.post(`https://${GetParentResourceName()}/refreshVotingLaws`);

  const mainContainer = document.getElementById(id);

  const lawContainer = document.createElement('div');
  lawContainer.setAttribute('id', `createLaw`);
  lawContainer.classList.add('bg-[#9ba9e0]/80', 'rounded', 'p-4', 'm-2');

  const lawNameLabel = document.createElement('label');
  lawNameLabel.textContent = Language.LawVotingUI.LawName;
  lawNameLabel.classList.add('text-white', 'text-lg', 'mb-2');

  const lawNameInput = document.createElement('input');
  lawNameInput.setAttribute('type', 'text');
  lawNameInput.classList.add('w-full', 'py-2', 'px-3', 'rounded', 'border', 'border-gray-300', 'mb-4');

  const lawDescriptionLabel = document.createElement('label');
  lawDescriptionLabel.textContent = Language.LawVotingUI.LawDescription;
  lawDescriptionLabel.classList.add('text-white', 'text-lg', 'mb-2');

  const lawDescriptionTextarea = document.createElement('textarea');
  lawDescriptionTextarea.classList.add('w-full', 'h-40', 'py-2', 'px-3', 'rounded', 'border', 'border-gray-300', 'mb-4', 'resize-none', 'scrollbar');

  const calendarLabel = document.createElement('label');
  calendarLabel.textContent = Language.LawVotingUI.CalendarLabel;
  calendarLabel.classList.add('text-white', 'text-lg', 'mb-2');

  const calendarInput = document.createElement('input');
  calendarInput.setAttribute('type', 'datetime-local');
  calendarInput.classList.add('w-full', 'py-2', 'px-3', 'rounded', 'border', 'border-gray-300', 'mb-4');

  const errorText = document.createElement('p');
  errorText.classList.add('text-red-500', 'mb-2');
  errorText.setAttribute('id', `error-text-old`);
  errorText.textContent = '';

  const submitButton = document.createElement('button');
  submitButton.classList.add('bg-blue-500', 'text-white', 'py-2', 'px-4', 'rounded', 'hover:bg-blue-700');
  submitButton.textContent = Language.LawVotingUI.SubmitButton;

  submitButton.addEventListener('click', () => {
    const lawName = lawNameInput.value;
    const lawDescription = lawDescriptionTextarea.value;
    const selectedDateTime = calendarInput.value;
    const currentTime = new Date();

    if (lawName.trim() === '' || lawDescription.trim() === '' || selectedDateTime === '') {
      const errorTextNew = document.querySelector(`#error-text-old`);
      if (errorTextNew) {
        errorTextNew.textContent = Language.LawVotingUI.ErrorFields;
      }
      return;
    }

    const selectedDate = new Date(selectedDateTime);
    const timeDifference = selectedDate - currentTime;
    const minutesDifference = Math.ceil(timeDifference / (1000 * 60));

    $.post(`https://${GetParentResourceName()}/createNewLaw`, JSON.stringify({ lawName, lawDescription, minutesDifference }));

    createLaw(id);
  });

  lawContainer.appendChild(lawNameLabel);
  lawContainer.appendChild(lawNameInput);
  lawContainer.appendChild(lawDescriptionLabel);
  lawContainer.appendChild(lawDescriptionTextarea);
  lawContainer.appendChild(calendarLabel);
  lawContainer.appendChild(calendarInput);
  lawContainer.appendChild(errorText);
  lawContainer.appendChild(submitButton);
  mainContainer.appendChild(lawContainer);

}

function closeManagement() {
  divIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#managementUI-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });

  const createLawDiv = document.querySelector(`#createLaw`);
  if (createLawDiv) {
    createLawDiv.remove();
  }

  ChangeButtonLaw('close');

  $("#laws-container-management").hide();

  IsManagementMayor = false;
  laws = [];
  LawDataLog = [];
  divIDs = [];

  $.post(`https://${GetParentResourceName()}/returnToLawCreator`);
}

function calculateTime(minutes) {
  var days = Math.floor(minutes / 1440);
  var remainingMinutes = minutes % 1440;
  var hours = Math.floor(remainingMinutes / 60);
  var remainingSeconds = remainingMinutes % 60;
  return Language.CalculateTime
    .replace("{days}", days)
    .replace("{hours}", hours)
    .replace("{minutes}", remainingSeconds);
}

function RefreshSettings() {
  refreshVotingSettings();
  settings();
}

function RefreshCandidates() {
  refreshVotingSettings();
  candidate();
}

function RefreshApplications() {
  refreshVotingSettings();
  applications();
}

function RefreshManagementNew() {
  refreshVotingSettings();
}

function RemoveButtons() {
  const button1 = document.querySelector(`#button-settings`);
  if (button1) {
    button1.remove();
  }
  const button2 = document.querySelector(`#button-candidates`);
  if (button2) {
    button2.remove();
  }
  const button3 = document.querySelector(`#button-applications`);
  if (button3) {
    button3.remove();
  }
}

function denyApplication(data) {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshCandidates()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshManagementNew()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const settingsContainer = createSettingsContainer(`viewApplication-deny`);
  settingsContainer.style.maxHeight = '480px';

  const Title = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], Language.VotingManagementUI.DenyApplication.Title);
  const CandidateName = createParagraph(['text-gray-800', 'mb-2', 'font-bold', 'mr-2'], Language.VotingManagementUI.DenyApplication.Name.replace("{name}", data.name));
  const ReasonLabel = createLabel(['text-gray-800', 'mb-4', 'font-bold'], Language.VotingManagementUI.DenyApplication.Reason);
  const ReasonInput = document.createElement('textarea');
  ReasonInput.className = 'w-full h-40 resize-none border border-gray-300 rounded px-3 py-2 mb-4 scrollbar';
  ReasonInput.setAttribute('wrap', 'soft');

  settingsContainer.appendChild(Title);
  settingsContainer.appendChild(CandidateName);
  settingsContainer.appendChild(ReasonLabel);
  settingsContainer.appendChild(ReasonInput);

  const buttonDiv = document.createElement('div');
  buttonDiv.style.marginTop = '15px';

  const confirmButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.DenyApplication.ConfirmButton, () => {
    const denyValue = ReasonInput.value;
    data.reason = denyValue;
    $.post(`https://${GetParentResourceName()}/denyApplication`, JSON.stringify({ data }));
    dbCandidates.forEach((v, key) => {
      if (v.identifier == data.identifier) {
        dbCandidates[key].state = 2;
      }
    });
    RefreshManagementNew();
    RefreshApplications();
  });
  buttonDiv.appendChild(confirmButton);

  const backButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.DenyApplication.BackButton, () => {
    viewApplication(data);
  });
  buttonDiv.appendChild(backButton);

  settingsContainer.appendChild(buttonDiv);
  mainContainer.appendChild(settingsContainer);
}

function viewApplication(data) {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshCandidates()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshManagementNew()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const settingsContainer = createSettingsContainer(`viewApplication-open`);
  settingsContainer.style.maxHeight = '470px';

  const PlayerName = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], data.name);
  const PlayerAge = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.ViewApplications.Age.replace("{age}", data.age));
  const questionDiv = document.createElement('div');
  questionDiv.classList.add('overflow-y-auto', 'scrollbar');
  questionDiv.style.maxHeight = '320px';
  const QuestionOne = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ViewApplications.ShortDescription);
  const AOne = createParagraph(['text-gray-800', 'mb-2'], `${data.description}`);
  const QuestionTwo = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ViewApplications.Q1);
  const ATwo = createParagraph(['text-gray-800', 'mb-2'], `${data.q1}`);
  const QuestionThree = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ViewApplications.Q2);
  const AThree = createParagraph(['text-gray-800', 'mb-2'], `${data.q2}`);

  settingsContainer.appendChild(PlayerName);
  settingsContainer.appendChild(PlayerAge);
  questionDiv.appendChild(QuestionOne);
  questionDiv.appendChild(AOne);
  questionDiv.appendChild(QuestionTwo);
  questionDiv.appendChild(ATwo);
  questionDiv.appendChild(QuestionThree);
  questionDiv.appendChild(AThree);
  settingsContainer.appendChild(questionDiv);

  const buttonDiv = document.createElement('div');
  buttonDiv.style.marginTop = '15px';

  const approveButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ViewApplications.ApproveButton, () => {
    $.post(`https://${GetParentResourceName()}/approveApplication`, JSON.stringify({ data }));
    dbCandidates.forEach((v, key) => {
      if (v.identifier == data.identifier) {
        dbCandidates[key] = [];
      }
    });
    RefreshManagementNew();
    RefreshApplications();
  });
  buttonDiv.appendChild(approveButton);
  const denyButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ViewApplications.DenyButton, () => {
    denyApplication(data);
  });
  buttonDiv.appendChild(denyButton);
  const backButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ViewApplications.BackButton, () => {
    RefreshApplications();
  });
  buttonDiv.appendChild(backButton);
  settingsContainer.appendChild(buttonDiv);

  mainContainer.appendChild(settingsContainer);

}

function applications() {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshCandidates()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshManagementNew()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  if (dbCandidates.length >= 1) {
    let isElseExecuted = false;
    dbCandidates.forEach((data) => {
      if (data.state === 1) {
        applicationIDs.push(data.id);

        const settingsContainer = createSettingsContainer(`configApplications-${data.id}`);

        const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], data.name);
        const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Applications.Age.replace("{age}", data.age));

        settingsContainer.appendChild(pollTitle);
        settingsContainer.appendChild(jobDescription);

        const buttonDiv = document.createElement('div');
        const approveButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.Applications.ViewAppButton, () => {
          viewApplication(data);
        });
        buttonDiv.appendChild(approveButton);
        settingsContainer.appendChild(buttonDiv);

        mainContainer.appendChild(settingsContainer);
      } else {
        if (!isElseExecuted) {
          const allCandidatesInactive = dbCandidates.every((data) => data.state !== 1);
          if (allCandidatesInactive) {
            const settingsContainer = createSettingsContainer(`applicationsRefresh`);
            const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.VotingManagementUI.Applications.NoApplications);
            settingsContainer.appendChild(pollTitle);
            mainContainer.appendChild(settingsContainer);
            isElseExecuted = true;
          }
        }
      }
    });
  } else {
    const allCandidatesInactive = dbCandidates.every((data) => data.state !== 1);
    if (allCandidatesInactive) {
      const settingsContainer = createSettingsContainer(`applicationsRefresh`);
      const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.VotingManagementUI.Applications.NoApplications);
      settingsContainer.appendChild(pollTitle);
      mainContainer.appendChild(settingsContainer);
    }
  }
}

function warnCandidate(data) {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshManagementNew()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'hover:text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshApplications()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const settingsContainer = createSettingsContainer(`viewCandidate-warn`);
  settingsContainer.style.maxHeight = '480px';

  const Title = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], Language.VotingManagementUI.WarnCandidate.Title);
  const CandidateName = createParagraph(['text-gray-800', 'mb-2', 'font-bold', 'mr-2'], Language.VotingManagementUI.WarnCandidate.Candidate.replace("{name}", data.name));
  const warnDescription = createParagraph(['text-gray-800', 'mb-2', 'mr-2'], Language.VotingManagementUI.WarnCandidate.Description);
  const ReasonLabel = createLabel(['text-gray-800', 'mb-4', 'font-bold'], Language.VotingManagementUI.WarnCandidate.Reason);
  const ReasonInput = document.createElement('textarea');
  ReasonInput.className = 'w-full h-40 resize-none border border-gray-300 rounded px-3 py-2 mb-4 scrollbar';
  ReasonInput.setAttribute('wrap', 'soft');

  settingsContainer.appendChild(Title);
  settingsContainer.appendChild(CandidateName);
  settingsContainer.appendChild(warnDescription);
  settingsContainer.appendChild(ReasonLabel);
  settingsContainer.appendChild(ReasonInput);

  const buttonDiv = document.createElement('div');
  buttonDiv.style.marginTop = '15px';

  const confirmButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.WarnCandidate.ConfirmButton, () => {
    const denyValue = ReasonInput.value;
    data.reason = denyValue;
    $.post(`https://${GetParentResourceName()}/warnCandidate`, JSON.stringify({ data }));
    manageCandidate(data);
  });
  buttonDiv.appendChild(confirmButton);

  const backButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.WarnCandidate.BackButton, () => {
    manageCandidate(data);
  });
  buttonDiv.appendChild(backButton);

  settingsContainer.appendChild(buttonDiv);
  mainContainer.appendChild(settingsContainer);
}

function removeCandidate(data) {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshManagementNew()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'hover:text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshApplications()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const settingsContainer = createSettingsContainer(`viewCandidate-remove`);
  settingsContainer.style.maxHeight = '480px';

  const Title = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], Language.VotingManagementUI.RemoveCandidate.Title);
  const CandidateName = createParagraph(['text-gray-800', 'mb-2', 'font-bold', 'mr-2'], Language.VotingManagementUI.RemoveCandidate.Candidate.replace("{name}", data.name));
  const removeDescription = createParagraph(['text-gray-800', 'mb-2', 'mr-2'], Language.VotingManagementUI.RemoveCandidate.Description);
  const ReasonLabel = createLabel(['text-gray-800', 'mb-4', 'font-bold'], Language.VotingManagementUI.RemoveCandidate.Reason);
  const ReasonInput = document.createElement('textarea');
  ReasonInput.className = 'w-full h-40 resize-none border border-gray-300 rounded px-3 py-2 mb-4 scrollbar';
  ReasonInput.setAttribute('wrap', 'soft');

  settingsContainer.appendChild(Title);
  settingsContainer.appendChild(CandidateName);
  settingsContainer.appendChild(removeDescription);
  settingsContainer.appendChild(ReasonLabel);
  settingsContainer.appendChild(ReasonInput);

  const buttonDiv = document.createElement('div');
  buttonDiv.style.marginTop = '15px';

  const confirmButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.RemoveCandidate.ConfirmButton, () => {
    const denyValue = ReasonInput.value;
    data.reason = denyValue;
    $.post(`https://${GetParentResourceName()}/removeCandidate`, JSON.stringify({ data }));
    dbCandidates.forEach((v, key) => {
      if (v.identifier == data.identifier) {
        dbCandidates[key] = [];
      }
    });
    RefreshManagementNew();
    RefreshCandidates();
  });
  buttonDiv.appendChild(confirmButton);

  const backButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.RemoveCandidate.BackButton, () => {
    manageCandidate(data);
  });
  buttonDiv.appendChild(backButton);

  settingsContainer.appendChild(buttonDiv);
  mainContainer.appendChild(settingsContainer);
}

function manageCandidate(data) {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshManagementNew()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'hover:text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshApplications()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const settingsContainer = createSettingsContainer(`viewCandidate-open`);
  settingsContainer.style.maxHeight = '470px';

  const PlayerName = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], data.name);
  const PlayerAge = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.ManageCandidate.Age.replace("{age}", data.age));
  const questionDiv = document.createElement('div');
  questionDiv.classList.add('overflow-y-auto', 'scrollbar');
  questionDiv.style.maxHeight = '300px';
  const QuestionOne = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ManageCandidate.ShortDescription);
  const AOne = createParagraph(['text-gray-800', 'mb-2'], `${data.description}`);
  const QuestionTwo = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ManageCandidate.Q1);
  const ATwo = createParagraph(['text-gray-800', 'mb-2'], `${data.q1}`);
  const QuestionThree = createLabel(['text-gray-800', 'mb-2', 'font-bold'], Language.VotingManagementUI.ManageCandidate.Q2);
  const AThree = createParagraph(['text-gray-800', 'mb-2'], `${data.q2}`);

  settingsContainer.appendChild(PlayerName);
  settingsContainer.appendChild(PlayerAge);
  questionDiv.appendChild(QuestionOne);
  questionDiv.appendChild(AOne);
  questionDiv.appendChild(QuestionTwo);
  questionDiv.appendChild(ATwo);
  questionDiv.appendChild(QuestionThree);
  questionDiv.appendChild(AThree);
  settingsContainer.appendChild(questionDiv);

  const buttonDiv = document.createElement('div');
  buttonDiv.style.marginTop = '15px';

  const warnButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ManageCandidate.WarnButton, () => {
    warnCandidate(data);
  });
  buttonDiv.appendChild(warnButton);
  const removeButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ManageCandidate.RemoveButton, () => {
    removeCandidate(data);
  });
  buttonDiv.appendChild(removeButton);
  const backButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.ManageCandidate.BackButton, () => {
    RefreshCandidates();
  });
  buttonDiv.appendChild(backButton);
  settingsContainer.appendChild(buttonDiv);

  mainContainer.appendChild(settingsContainer);

}

function candidate() {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshSettings
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshManagementNew()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'hover:text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshApplications()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  const PlayerDiv = document.createElement('div');
  PlayerDiv.setAttribute('id', 'configCandidates-div');
  PlayerDiv.classList.add('overflow-y-auto', 'scrollbar');
  PlayerDiv.style.maxHeight = '480px';

  if (dbCandidates.length >= 1 && dbSettings.votingState >= 1) {
    let isElseExecuted = false;
    dbCandidates.forEach((data) => {
      if (data.state === 3) {
        candidateIDs.push(data.id);

        const settingsContainer = createSettingsContainer(`configCandidates-${data.id}`);

        const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], data.name);
        const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Candidate.Age.replace("{age}", data.age));

        settingsContainer.appendChild(pollTitle);
        settingsContainer.appendChild(jobDescription);

        const buttonDiv = document.createElement('div');
        const manageCandidateButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.Candidate.ManageButton.replace("{name}", data.name), () => {
          manageCandidate(data);
        });
        settingsContainer.appendChild(manageCandidateButton);
        settingsContainer.appendChild(buttonDiv);

        PlayerDiv.appendChild(settingsContainer)

        mainContainer.appendChild(PlayerDiv);
      } else {
        if (!isElseExecuted) {
          const allCandidatesInactive = dbCandidates.every((data) => data.state !== 3);
          if (allCandidatesInactive) {
            const settingsContainer = createSettingsContainer(`applicationsRefresh`);
            const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.VotingManagementUI.Candidate.NoActiveCandidates);
            settingsContainer.appendChild(pollTitle);
            mainContainer.appendChild(settingsContainer);
            isElseExecuted = true;
          }
        }
      }
    });
  } else {
    const allCandidatesInactive = dbCandidates.every((data) => data.state !== 3);
    if (allCandidatesInactive) {
      const settingsContainer = createSettingsContainer(`applicationsRefresh`);
      const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'text-center', 'mb-2'], Language.VotingManagementUI.Candidate.NoActiveCandidates);
      settingsContainer.appendChild(pollTitle);
      mainContainer.appendChild(settingsContainer);
    }
  }
}

function settings() {
  RemoveButtons();
  ResetSettingsContainer();
  ResetCandidateContainer();
  ResetApplicationContainer();

  const mainContainer = document.getElementById('voting-container-management');

  const ButtonContainer = document.getElementById('buttons-menu');

  let button1 = document.getElementById('button-settings');
  if (!button1) {
    button1 = createButton(
      ['border-none', 'text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.SettingTab,
      RefreshManagementNew
    );
    button1.id = 'button-settings';
    ButtonContainer.appendChild(button1);
  }

  let button2 = document.getElementById('button-candidates');
  if (!button2) {
    button2 = createButton(
      ['border-none', 'hover:text-blue-700', 'mr-2'],
      Language.VotingManagementUI.Buttons.CandidateTab,
      () => RefreshCandidates()
    );
    button2.id = 'button-candidates';
    ButtonContainer.appendChild(button2);
  }

  let button3 = document.getElementById('button-applications');
  if (!button3) {
    button3 = createButton(
      ['border-none', 'hover:text-blue-700'],
      Language.VotingManagementUI.Buttons.ApplicationsTab,
      () => RefreshApplications()
    );
    button3.id = 'button-applications';
    ButtonContainer.appendChild(button3);
  }

  ButtonContainer.appendChild(button3);

  if (dbSettings.votingState == 0) {
    const containerDiv = document.createElement('div');
    containerDiv.classList.add('overflow-y-auto', 'scrollbar');
    containerDiv.style.maxHeight = '470px';

    configVoting.forEach((data) => {
      divIDs.push(data.id);

      const settingsContainer = createSettingsContainer(`configVoting-${data.id}`);

      const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], data.poll);
      const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateZero.JobDescription
        .replace("{job}", data.givenJob.label)
        .replace("{grade}", data.givenJob.grade));

      settingsContainer.appendChild(pollTitle);
      settingsContainer.appendChild(jobDescription);

      if (data.applicationJobCheck.enable === true) {
        const pollRestriction = createSpan('font-bold text-gray-800 mr-2', Language.VotingManagementUI.Settings.StateZero.JobRequirement.replace("{job}", data.applicationJobCheck.job));
        settingsContainer.appendChild(pollRestriction);
      }

      const buttonDiv = document.createElement('div');
      const pollButton = createButton(['bg-blue-500', 'hover:bg-blue-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded'], Language.VotingManagementUI.Settings.StateZero.StartPollButton, () => {
        dbSettings.votingType = data.id;
        dbSettings.votingState = 1;
        UpdateVotingState(1, data.id, data);
      });
      buttonDiv.appendChild(pollButton);
      settingsContainer.appendChild(buttonDiv);

      containerDiv.appendChild(settingsContainer)
      mainContainer.appendChild(containerDiv);
    });
  } else if (dbSettings.votingState == 1) {
    const settingsContainer = createSettingsContainer('configVoting-main');

    const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], pollInfo.poll);
    const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateOne.JobDescription
      .replace("{job}", pollInfo.givenJob.label)
      .replace("{grade}", pollInfo.givenJob.grade));

    settingsContainer.appendChild(pollTitle);
    settingsContainer.appendChild(jobDescription);

    if (pollInfo.applicationJobCheck.enable === true) {
      const pollRestriction = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateOne.JobRequirement.replace("{job}", pollInfo.applicationJobCheck.job));
      settingsContainer.appendChild(pollRestriction);
    }

    const allCandidatesInactive = dbCandidates.some((data) => data.state === 3);
    if (allCandidatesInactive) {
      const currentCandidate = createSpan('font-bold text-gray-800 mr-2', Language.VotingManagementUI.Settings.StateOne.CurrentCandidates);
      settingsContainer.appendChild(currentCandidate);
    }

    const PlayerDiv = document.createElement('div');
    PlayerDiv.classList.add('overflow-y-auto', 'scrollbar');
    PlayerDiv.style.maxHeight = '150px';

    dbCandidates.forEach((data) => {
      if (data.state === 3) {
        const CandidateInfo = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateOne.CandidateInfo
          .replace("{name}", data.name)
          .replace("{age}", data.age));
        PlayerDiv.appendChild(CandidateInfo);
      }
    });

    settingsContainer.appendChild(PlayerDiv);

    const buttonDiv = document.createElement('div');
    if (dbCandidates.length >= 2 && dbCandidates.filter((data) => data.state === 3).length >= 2) {
      const calendarLabel = createParagraph(['font-bold', 'text-gray-800', 'mr-2'], Language.VotingManagementUI.Settings.StateOne.DateVotingEnds);
      const calendarInput = createInput('datetime-local', ['w-full', 'py-2', 'px-3', 'rounded', 'border', 'border-gray-300', 'mb-4']);
      const errorText = createParagraph('text-red-500 mb-2', '');
      const pollButton = createButton(['bg-green-500', 'hover:bg-green-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded', 'mr-2'], Language.VotingManagementUI.Settings.StateOne.StartVotingButton, () => {
        const selectedDateTime = calendarInput.value;
        const currentTime = new Date();

        if (selectedDateTime === '') {
          errorText.textContent = Language.VotingManagementUI.Settings.StateOne.SelectDateError;
          return;
        }

        const selectedDate = new Date(selectedDateTime);
        if (selectedDate < currentTime) {
          errorText.textContent = Language.VotingManagementUI.Settings.StateOne.PastDateError;
          return;
        }

        const timeDifference = selectedDate - currentTime;
        const minutesDifference = Math.ceil(timeDifference / (1000 * 60));

        dbSettings.time = minutesDifference;
        dbSettings.endDate = calculateTime(minutesDifference);
        dbSettings.votingState = 2;
        StartVotingPolls(2, pollInfo.id, pollInfo, minutesDifference);
      });

      settingsContainer.appendChild(calendarLabel);
      settingsContainer.appendChild(calendarInput);
      settingsContainer.appendChild(errorText);
      settingsContainer.appendChild(pollButton);
      buttonDiv.appendChild(pollButton);

      const terminateButton = createButton(['bg-red-500', 'hover:bg-red-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded'], Language.VotingManagementUI.Settings.StateOne.TerminateButton, () => {
        $.post(`https://${GetParentResourceName()}/terminateVoting`);
        dbCandidates = [];
        dbSettings = [];
        dbSettings.votingState = 0;
        RefreshManagementNew();
        setTimeout(RefreshSettings, 50);
      });
      buttonDiv.appendChild(terminateButton);
    } else {
      const terminateButton = createButton(['bg-red-500', 'hover:bg-red-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded'], Language.VotingManagementUI.Settings.StateOne.TerminateButton, () => {
        $.post(`https://${GetParentResourceName()}/terminateVoting`);
        dbCandidates = [];
        dbSettings = [];
        dbSettings.votingState = 0;
        RefreshManagementNew();
        setTimeout(RefreshSettings, 50);
      });
      buttonDiv.appendChild(terminateButton);
    }

    settingsContainer.appendChild(buttonDiv);
    mainContainer.appendChild(settingsContainer);
  } else if (dbSettings.votingState == 2) {
    const settingsContainer = createSettingsContainer('configVoting-voting');

    const pollTitle = createHeading('h2', ['text-lg', 'font-bold', 'mb-2'], pollInfo.poll);


    settingsContainer.appendChild(pollTitle);

    if (dbSettings.time >= 1) {
      const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateTwo.TimeUntilFinish.replace("{time}", dbSettings.endDate));
      settingsContainer.appendChild(jobDescription);
    } else {
      const jobDescription = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateTwo.PollFinished);
      settingsContainer.appendChild(jobDescription);
    }

    if (dbCandidates[0]) {
      const currentCandidate = createParagraph('font-bold text-gray-800 mr-2', Language.VotingManagementUI.Settings.StateTwo.CurrentCandidates);
      settingsContainer.appendChild(currentCandidate);
    }

    const PlayerDiv = document.createElement('div');
    PlayerDiv.classList.add('overflow-y-auto', 'scrollbar');
    PlayerDiv.style.maxHeight = '150px';

    dbCandidates.forEach((data) => {
      if (data.state === 3) {
        const CandidateInfo = createParagraph(['text-gray-800', 'mb-2'], Language.VotingManagementUI.Settings.StateTwo.CandidateInfo
          .replace("{name}", data.name)
          .replace("{age}", data.age)
          .replace("{votes}", data.votes));
        PlayerDiv.appendChild(CandidateInfo);
      }
    });

    settingsContainer.appendChild(PlayerDiv);

    const buttonDiv = document.createElement('div');
    buttonDiv.style.marginTop = '10px';

    const manualEndButton = createButton(['bg-red-500', 'hover:bg-red-700', 'focus:outline-none', 'focus:shadow-outline', 'text-white', 'py-2', 'px-4', 'rounded'], Language.VotingManagementUI.Settings.StateTwo.EndVotingButton, () => {
      $.post(`https://${GetParentResourceName()}/endVotingPolls`, JSON.stringify({}));
      dbSettings = [];
      dbSettings.votingState = 0;
      refreshVotingSettings();
      setTimeout(RefreshSettings, 50);
    });
    buttonDiv.appendChild(manualEndButton);
    settingsContainer.appendChild(buttonDiv);

    mainContainer.appendChild(settingsContainer);
  }
}

function createSettingsContainer(id) {
  const settingsContainer = document.createElement('div');
  settingsContainer.setAttribute('id', id);
  settingsContainer.classList.add('bg-[#9ba9e0]/80', 'rounded', 'p-4', 'm-2');
  return settingsContainer;
}

function createHeading(tag, classNames, text) {
  const element = document.createElement(tag);
  classNames.forEach((className) => {
    element.classList.add(className);
  });
  element.textContent = text;
  return element;
}


function createParagraph(classNames, text) {
  const element = document.createElement('p');

  if (Array.isArray(classNames)) {
    classNames.forEach((className) => {
      element.classList.add(className);
    });
  } else if (typeof classNames === 'string') {
    element.classList.add(...classNames.split(' '));
  }

  element.textContent = text;
  return element;
}


function createSpan(classNames, text) {
  const element = document.createElement('span');

  if (Array.isArray(classNames)) {
    classNames.forEach((className) => {
      element.classList.add(className);
    });
  } else if (typeof classNames === 'string') {
    element.classList.add(...classNames.split(' '));
  }

  element.textContent = text;
  return element;
}



function createButton(classNames, text, onClick) {
  const button = document.createElement('button');
  button.classList.add(...classNames);
  button.textContent = text;
  button.addEventListener('click', onClick);
  return button;
}


function createLabel(classNames, text) {
  const label = document.createElement('label');
  classNames.forEach((className) => {
    label.classList.add(className);
  });
  label.textContent = text;
  return label;
}


function createInput(type, classNames) {
  const input = document.createElement('input');
  input.setAttribute('type', type);
  classNames.forEach((className) => {
    input.classList.add(className);
  });
  return input;
}

function ResetSettingsContainer() {
  divIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#configVoting-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });
  const managementUIMain = document.querySelector(`#configVoting-main`);
  if (managementUIMain) {
    managementUIMain.remove();
  }
  const managementUIVoting = document.querySelector(`#configVoting-voting`);
  if (managementUIVoting) {
    managementUIVoting.remove();
  }
}

function ResetPassedLawsContainer() {
  passedLawsIDs.forEach((lawids) => {
    const passedLawUIDiv = document.querySelector(`#passedLawsUI-${lawids}`);
    if (passedLawUIDiv) {
      passedLawUIDiv.remove();
    }
  });
}

function ResetCandidateContainer() {
  const playerDiv = document.querySelector(`#configCandidates-div`);
  if (playerDiv) {
    playerDiv.remove();
  }
  candidateIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#configCandidates-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });
  const viewCandidate = document.querySelector(`#viewCandidate-open`);
  if (viewCandidate) {
    viewCandidate.remove();
  }
  const removeCandidateDiv = document.querySelector(`#viewCandidate-remove`)
  if (removeCandidateDiv) {
    removeCandidateDiv.remove();
  }
  const warnCandidateDiv = document.querySelector(`#viewCandidate-warn`)
  if (warnCandidateDiv) {
    warnCandidateDiv.remove();
  }
}

function ResetApplicationContainer() {
  applicationIDs.forEach((managementids) => {
    const managementUIDiv = document.querySelector(`#configApplications-${managementids}`);
    if (managementUIDiv) {
      managementUIDiv.remove();
    }
  });
  const viewApplicationUI = document.querySelector(`#viewApplication-open`);
  if (viewApplicationUI) {
    viewApplicationUI.remove();
  }
  const noApplicationUI = document.querySelector(`#applicationsRefresh`);
  if (noApplicationUI) {
    noApplicationUI.remove();
  }
  const denyApplicationUI = document.querySelector(`#viewApplication-deny`);
  if (denyApplicationUI) {
    denyApplicationUI.remove();
  }
}

function UpdateVotingState(state, type, config) {
  pollInfo = config;
  $.post(`https://${GetParentResourceName()}/updateVotingState`, JSON.stringify({ state, type }));
  RefreshSettings();
}

function StartVotingPolls(state, type, config, time) {
  dbSettings.time = time;
  dbSettings.endDate = calculateTime(time);
  dbSettings.votingState = 2;
  pollInfo = config;
  $.post(`https://${GetParentResourceName()}/startVotingPolls`, JSON.stringify({ state, type, time }));
  RefreshSettings();
}
