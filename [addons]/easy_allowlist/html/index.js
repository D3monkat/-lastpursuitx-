const resName = GetParentResourceName();

// Utils

// Fetch all the forms we want to apply custom Bootstrap validation styles to
let forms = document.querySelectorAll('.needs-validation')

// Loop over them and prevent submission
Array.prototype.slice.call(forms)
.forEach(function (form) {
	form.addEventListener('submit', function (event) {

	event.preventDefault();

	form.classList.add('was-validated')
	}, false)
})

// Returns date from unix
function getDateFromUnix(unix) {
	let date = new Date(unix * 1000);

	let day = date.getDate();
	let month = date.getMonth() + 1;
	let year = date.getFullYear();

	let hours = date.getHours();
	let minutes = date.getMinutes();

	return `${day}/${month}/${year} ${hours}:${minutes}`;
}

// Gets random HEX color
function getRandomColor() {
	var letters = '0123456789ABCDEF';
	var color = '#';

	for (var i = 0; i < 6; i++) {
		color += letters[Math.floor(Math.random() * 16)];
	}

	return color;
}  

// Language stuff
let TRANSLATIONS = {};
let ENGLISH_TRANSLATIONS = {};

function translateEverything() {
	$("body").find("[data-translation-id], [data-bs-toggle='tooltip']").each(function() {
		let translationId = $(this).data("translationId")

		if( $(this).data("bsToggle") == "tooltip" ) {
			$(this).prop("title", getLocalizedText(translationId));
			$(this).tooltip();
		} else {
			$(this).prop("innerHTML", getLocalizedText(translationId));
		}

	})
}

function refreshTranslations(locale) {
	$.ajax({
		url: `menu_translations/en.json`,
		success: function (translationsJSON) {
			ENGLISH_TRANSLATIONS = JSON.parse(translationsJSON);

			$.ajax({
				url: `menu_translations/${locale}.json`,
				success: function (translationsJSON) {
					TRANSLATIONS = JSON.parse(translationsJSON);
		
					translateEverything();
				}
			});
		}
	});
}

function loadTranslations() {
	$.ajax({
		url: `https://${resName}/getLocale`,
		success: function (locale) {
			refreshTranslations(locale);
		}
	});
} loadTranslations();

function getLocalizedText(text) {
	return TRANSLATIONS[text] || ENGLISH_TRANSLATIONS[text] || text;
}

/*
██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗     ██████╗  █████╗ ████████╗ █████╗ 
██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝    ██║  ██║███████║   ██║   ███████║
██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗    ██║  ██║██╔══██║   ██║   ██╔══██║
██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║    ██████╔╝██║  ██║   ██║   ██║  ██║
╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
*/

let allAllowlistRequests = {};
let allAllowlistedPlayers = {};
let allQueuePriorities = {};

function openPlayerData(identifier, type) {
	switch(type) {
		case "allowlistRequest": 
			var playerData = allAllowlistRequests[identifier].playerData;
			break;

		case "allowlistedPlayer": 
			var playerData = allAllowlistedPlayers[identifier].playerData;
			break;

		case "queuePriority":
			var playerData = allQueuePriorities[identifier].playerData;
			break;
			
		default:
			console.error("Could not open player data for unknown type: " + type);
			return;
	}

	$("#player-data-options").find(".data-option").each(function() {
		let dataOptionDiv = $(this);
		let dataOptionType = dataOptionDiv.data("type");

		dataOptionDiv.toggle(dataOptionType === type);
	})
	
	let playerDataModal = $("#player-data-modal");
	
	playerDataModal.data("identifier", identifier);

	// Fills the player identifiers
	playerDataModal.find(".player-identifiers").empty();

	if(playerData?.identifiers) {
		for(const[type, identifier] of Object.entries(playerData.identifiers)) {
			let licenseDiv = $(`
				<p><span class="fw-bold">${type}</span> - ${identifier}</p>
			`);
	
			playerDataModal.find(".player-identifiers").append(licenseDiv);
		}

		playerDataModal.find(".identifiers-data").show();
	} else {
		playerDataModal.find(".identifiers-data").hide();
	}

	// Steam Data
	if(playerData?.steamData) {
		$("#steam-data-nickname").text(playerData.steamData.name);
		$("#steam-data-steamid").text(playerData.steamData.steamId);
		$("#steam-data-url").text(playerData.steamData.url);

		$("#steam-data-image").attr("src", playerData.steamData.image);

		playerDataModal.find(".steam-data").show();
	} else {
		playerDataModal.find(".steam-data").hide();
	}

	// Discord Data
	if(playerData?.discordData) {
		$("#discord-data-nickname").text(playerData.discordData.name)
		$("#discord-data-discordid").text(playerData.discordData.discordId)
		$("#discord-data-image").attr("src", playerData.discordData.image)

		playerDataModal.find(".discord-data").show();
	} else {
		playerDataModal.find(".discord-data").hide();
	}

	playerDataModal.modal("show");
}

/*
 █████╗ ██╗     ██╗      ██████╗ ██╗    ██╗██╗     ██╗███████╗████████╗    ██████╗ ███████╗ ██████╗ ██╗   ██╗███████╗███████╗████████╗███████╗
██╔══██╗██║     ██║     ██╔═══██╗██║    ██║██║     ██║██╔════╝╚══██╔══╝    ██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝
███████║██║     ██║     ██║   ██║██║ █╗ ██║██║     ██║███████╗   ██║       ██████╔╝█████╗  ██║   ██║██║   ██║█████╗  ███████╗   ██║   ███████╗
██╔══██║██║     ██║     ██║   ██║██║███╗██║██║     ██║╚════██║   ██║       ██╔══██╗██╔══╝  ██║▄▄ ██║██║   ██║██╔══╝  ╚════██║   ██║   ╚════██║
██║  ██║███████╗███████╗╚██████╔╝╚███╔███╔╝███████╗██║███████║   ██║       ██║  ██║███████╗╚██████╔╝╚██████╔╝███████╗███████║   ██║   ███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝╚══════╝   ╚═╝       ╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝
*/
let allowlistRequestsDatatable = $("#allowlist-requests").DataTable({
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let identifier = data[2];

			openPlayerData(identifier, "allowlistRequest")
		})
	},
})

function loadAllAllowlistRequests() {
	allowlistRequestsDatatable.clear();

	$.post(`https://${resName}/getAllAllowlistRequests`, {}, function(allowlistRequests) {
		allAllowlistRequests = allowlistRequests;

		for(const[mainIdentifier, specificData] of Object.entries(allowlistRequests)) {
			allowlistRequestsDatatable.row.add( [specificData.requestId, specificData?.playerData?.playerName || "Unknown", mainIdentifier, getDateFromUnix(specificData.date)] );
		}
	
		allowlistRequestsDatatable.draw();
	})
}

$("#accept-allowlist-btn").click(function() {
	let playerDataModal = $("#player-data-modal");
	
	let identifier = playerDataModal.data("identifier");

	$.post(`https://${resName}/acceptAllowlistRequest`, JSON.stringify({identifier: identifier}), function(isSuccessful) {
		if(isSuccessful) {
			playerDataModal.modal("hide");
			loadAllAllowlistRequests();
			loadAllAllowlistedPlayers();
		}
	});
})

$("#deny-allowlist-btn").click(function() {
	let playerDataModal = $("#player-data-modal");
	
	let identifier = playerDataModal.data("identifier");

	$.post(`https://${resName}/denyAllowlistRequest`, JSON.stringify({identifier: identifier}), function(isSuccessful) {
		if(isSuccessful) {
			playerDataModal.modal("hide");
			loadAllAllowlistRequests();
		}
	});
})

/*
 █████╗ ██╗     ██╗      ██████╗ ██╗    ██╗██╗     ██╗███████╗████████╗███████╗██████╗     ██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗ ███████╗
██╔══██╗██║     ██║     ██╔═══██╗██║    ██║██║     ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝
███████║██║     ██║     ██║   ██║██║ █╗ ██║██║     ██║███████╗   ██║   █████╗  ██║  ██║    ██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝███████╗
██╔══██║██║     ██║     ██║   ██║██║███╗██║██║     ██║╚════██║   ██║   ██╔══╝  ██║  ██║    ██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗╚════██║
██║  ██║███████╗███████╗╚██████╔╝╚███╔███╔╝███████╗██║███████║   ██║   ███████╗██████╔╝    ██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝╚══════╝   ╚═╝   ╚══════╝╚═════╝     ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝
*/
let allowlistedPlayersDatatable = $("#allowlisted-players").DataTable({
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let identifier = data[1];

			openPlayerData(identifier, "allowlistedPlayer")
		})
	},
})

function loadAllAllowlistedPlayers() {
	allowlistedPlayersDatatable.clear();
	
	$.post(`https://${resName}/getAllAllowlistedPlayers`, {}, function(allowlistedPlayers) {
		allAllowlistedPlayers = allowlistedPlayers;

		for(const[mainIdentifier, specificData] of Object.entries(allowlistedPlayers)) {
			allowlistedPlayersDatatable.row.add( [specificData?.playerData?.playerName || "Unknown", mainIdentifier, getDateFromUnix(specificData.date)] );
		}
	
		allowlistedPlayersDatatable.draw();
	})
}

$("#remove-allowlist-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let playerDataModal = $("#player-data-modal");
	
	let identifier = playerDataModal.data("identifier");

	const response = await $.post(`https://${resName}/removeAllowlist`, JSON.stringify({identifier}));

	playerDataModal.modal("hide");
	loadAllAllowlistedPlayers();
	showServerResponse(response);
})

/*
 ██████ ██    ██ ██████  ██████  ███████ ███    ██ ████████      ██████  ██    ██ ███████ ██    ██ ███████ 
██      ██    ██ ██   ██ ██   ██ ██      ████   ██    ██        ██    ██ ██    ██ ██      ██    ██ ██      
██      ██    ██ ██████  ██████  █████   ██ ██  ██    ██        ██    ██ ██    ██ █████   ██    ██ █████   
██      ██    ██ ██   ██ ██   ██ ██      ██  ██ ██    ██        ██ ▄▄ ██ ██    ██ ██      ██    ██ ██      
 ██████  ██████  ██   ██ ██   ██ ███████ ██   ████    ██         ██████   ██████  ███████  ██████  ███████ 
                                                                    ▀▀                                     
*/
var table = $('#current-queue').DataTable({
	"lengthMenu": [10, 20, 40, 100],
	"createdRow": function (row, data, index) {
		$(row).addClass("clickable");

		$(row).click(function() {
			const playerId = data.playerData.playerId;
			const identifier = data.playerData.identifier;
			const currentPriority = data.playerData.priority;
				
			let modal = $("#edit-queue-priority-modal")
		
			modal.data("identifier", identifier);
			modal.data("type", "player-identifier");
			modal.data("temporary", true);
			modal.data("playerId", playerId);

			$("#queue-priority-input").val(currentPriority);
		
			modal.modal("show");
		})
	},
});

async function refreshCurrentQueue() {
	const playersInQueue = await $.post(`https://${resName}/getPlayersInQueue`, {});

	table.clear();

	for (let i = 0; i < playersInQueue.length; i++) {
		const player = playersInQueue[i];
		const rowData = [i + 1, player.priority, player.name];

		rowData.playerData = player;

		table.row.add(rowData);
	}

	table.draw();
}

function sleep() {
	return new Promise(resolve => setTimeout(resolve, 2000));
}

let isRefreshingQueue = false;
$("#current-queue-tab").click(async function() {
	if(isRefreshingQueue) return;
	isRefreshingQueue = true;

	while ( $("#current-queue-tab").hasClass("active") ) {
		await refreshCurrentQueue();

		await sleep();
	}

	isRefreshingQueue = false;
});

/*
 ██████╗ ██╗   ██╗███████╗██╗   ██╗███████╗    ██████╗ ██████╗ ██╗ ██████╗ ██████╗ ██╗████████╗██╗███████╗███████╗
██╔═══██╗██║   ██║██╔════╝██║   ██║██╔════╝    ██╔══██╗██╔══██╗██║██╔═══██╗██╔══██╗██║╚══██╔══╝██║██╔════╝██╔════╝
██║   ██║██║   ██║█████╗  ██║   ██║█████╗      ██████╔╝██████╔╝██║██║   ██║██████╔╝██║   ██║   ██║█████╗  ███████╗
██║▄▄ ██║██║   ██║██╔══╝  ██║   ██║██╔══╝      ██╔═══╝ ██╔══██╗██║██║   ██║██╔══██╗██║   ██║   ██║██╔══╝  ╚════██║
╚██████╔╝╚██████╔╝███████╗╚██████╔╝███████╗    ██║     ██║  ██║██║╚██████╔╝██║  ██║██║   ██║   ██║███████╗███████║
 ╚══▀▀═╝  ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝╚══════╝╚══════╝
*/
let queuePrioritiesDatatable = $("#queue-priorities").DataTable({
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let identifier = data[2];

			openPlayerData(identifier, "queuePriority")
		})
	},
})

function loadAllQueuePriorities() {
	queuePrioritiesDatatable.clear();
	
	$.post(`https://${resName}/getAllQueuePriorities`, {}, function(queuePriorities) {
		allQueuePriorities = {};

		for(const[mainIdentifier, specificData] of Object.entries(queuePriorities.playersQueuePriority)) {
			queuePrioritiesDatatable.row.add( [specificData.priority, specificData?.playerData?.playerName || "Unknown", mainIdentifier, getLocalizedText("player")] );

			allQueuePriorities[mainIdentifier] = specificData;
			allQueuePriorities[mainIdentifier].type = "player-identifier";
		}

		for(const[mainIdentifier, specificData] of Object.entries(queuePriorities.discordRolesPriority)) {
			let roleName = specificData.roleData.name;

			queuePrioritiesDatatable.row.add( [specificData.priority, roleName, mainIdentifier, getLocalizedText("discord_role")] );

			allQueuePriorities[mainIdentifier] = specificData;
			allQueuePriorities[mainIdentifier].type = "discord-role";
		}
	
		queuePrioritiesDatatable.draw();
	})
}

$("#edit-queue-priority-btn").click(function() {
	let playerDataModal = $("#player-data-modal");
	
	let identifier = playerDataModal.data("identifier");

	let type = allQueuePriorities[identifier].type;

	let modal = $("#edit-queue-priority-modal")

	modal.data("identifier", identifier);
	modal.data("type", type);
	modal.data("temporary", false);

	$("#queue-priority-input").val(allQueuePriorities[identifier].priority);

	modal.modal("show");
});

$("#remove-queue-priority-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let playerDataModal = $("#player-data-modal");
	
	let identifier = playerDataModal.data("identifier");

	let type = allQueuePriorities[identifier].type;

	playerDataModal.modal("hide");

	const response = await $.post(`https://${resName}/removeQueuePriority`, JSON.stringify({identifier, type}));
	showServerResponse(response);
	
	loadAllQueuePriorities()
});

async function playersListDialog(cb) {
	// Get players list
	let playersList = await $.get(`https://${resName}/getPlayersList`);

	let modal = $("#players-dialog-modal");

	$("#input-players-search").val("");

	let playerListDiv = $("#players-list")

	playerListDiv.empty();

	for(const playerData of playersList) {
		let playerDiv = $(`
			<li class="list-group-item list-group-item-action clickable"}>${playerData.playerName}</li>
		`);

		playerDiv.click(function() {
			modal.modal("hide");
			cb(playerData.identifier);
		});

		playerListDiv.append(playerDiv);
	}

	modal.modal("show");
}

$("#input-players-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#players-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

async function discordRolesDialog(cb) {
	// Get discord roles list
	let discordRoles = await $.get(`https://${resName}/getAllDiscordRoles`);

	let modal = $("#discord-roles-dialog-modal");

	$("#input-discord-roles-search").val("");

	let discordRolesListDiv = $("#discord-roles-list")

	discordRolesListDiv.empty();

	for(const roleData of discordRoles) {
		let roleDiv = $(`
			<li class="list-group-item list-group-item-action clickable" style="color: #${roleData.color.toString(16)}"}>${roleData.name}</li>
		`);

		roleDiv.click(function() {
			modal.modal("hide");
			cb(roleData.id);
		});

		discordRolesListDiv.append(roleDiv);
	}

	modal.modal("show");
}
$("#input-discord-roles-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#discord-roles-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

$("#new-queue-priority").click(function() {
	let newQueueModal = $("#create-queue-priority-modal");

	newQueueModal.removeClass("was-validated");

	$("input[type=radio][name=queue-priority-type][value=player-identifier]").prop("checked", true).change();
	
	$("#create-queue-priority-discord-role-input").val("");
	$("#create-queue-priority-player-identifier-input").val("");
	$("#create-queue-priority-input").val("");

	newQueueModal.modal("show");
})

$("#new-queue-priority-choose-player-btn").click(function() {
	playersListDialog(identifier => {
		$("#create-queue-priority-player-identifier-input").val(identifier);
	});
})

$("#create-queue-priority-modal").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let type = $("input[type=radio][name=queue-priority-type]:checked").val();

	if(type == "discord-role") {
		var identifier = $("#create-queue-priority-discord-role-input").val();
	} else if(type == "player-identifier") {
		var identifier = $("#create-queue-priority-player-identifier-input").val();
	}

	let priority = parseInt( $("#create-queue-priority-input").val() );

	$("#create-queue-priority-modal").modal("hide");

	const response = await $.post(`https://${resName}/createQueuePriority`, JSON.stringify({identifier: identifier, priority: priority, type: type}));

	loadAllQueuePriorities();

	showServerResponse(response);
})

// Choose discord role for discord role priority
$("#new-queue-priority-choose-discord-role-btn").click(function() {
	discordRolesDialog(roleId => {
		$("#create-queue-priority-discord-role-input").val(roleId);
	});	
});

$("input[type=radio][name=queue-priority-type]").change(function() {
	let val = $(this).val();
	
	$("#create-queue-priority-discord-role-input").prop("disabled", !(val === "discord-role") );
	$("#create-queue-priority-discord-role-input").prop("required", val === "discord-role");
	$("#queue-priority-discord-role-div").toggle(val === "discord-role");
	
	$("#create-queue-priority-player-identifier-input").prop("disabled", !(val === "player-identifier") );
	$("#create-queue-priority-player-identifier-input").prop("required", val === "player-identifier");
	$("#queue-priority-player-identifier-div").toggle(val === "player-identifier");
});

$("#edit-queue-priority-modal").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	const modal = $("#edit-queue-priority-modal");

	const identifier = modal.data("identifier");
	const priority = parseInt( $("#queue-priority-input").val() );
	const type = modal.data("type");
	const temporary = modal.data("temporary");

	modal.modal("hide");

	if(temporary) {
		const targetId = parseInt( modal.data("playerId") )

		var response = await $.post(`https://${resName}/giveTemporaryPriority`, JSON.stringify({targetId, priority}));
		refreshCurrentQueue();
	} else {
		var response = await $.post(`https://${resName}/setQueuePriority`, JSON.stringify({identifier, priority, type}));
		loadAllQueuePriorities();
	}

	showServerResponse(response);
})

// Settings
$("#discord-allowlist-role-choose-btn").click(function() {
	discordRolesDialog(roleID => {
		$("#settings_discordAllowlistRole").val(roleID);
	});
})

function toggleDiscordMainIdentifier(enabled) {
	$("#settings_discordAllowlistRole").prop("disabled", !enabled)
	$("#settings_discordAllowlistRole").prop("required", enabled)

	$("#discord-allowlist-role-choose-btn").prop("disabled", !enabled)
}

function toggleDiscordRolesFeatures() {
	let enabled = $(this).prop("checked");

	$("#settings_discordServerID").prop("disabled", !enabled)
	$("#settings_discordBotToken").prop("disabled", !enabled)
	
	$("#settings_discordServerID").prop("required", enabled)
	$("#settings_discordBotToken").prop("required", enabled)

	$("#settings_mainIdentifier [value=discord]").prop("disabled", !enabled)
}
$("#enable_discord_roles_features").change(toggleDiscordRolesFeatures)

$("#settings_mainIdentifier").change(function() {
	let mainIdentifier = $(this).val();

	toggleDiscordMainIdentifier(mainIdentifier === "discord");
})

// For Discord logs
$("#enable-discord-logs").change(function() {
	let enabled = $(this).prop("checked");

	$("#main-discord-webhook").prop("disabled", !enabled);
	$("#main-discord-webhook").prop("required", enabled);

	$("#discord-specific-webhooks").find(".webhook").each(function() {
		$(this).prop("disabled", !enabled);
	});
})

function getSpecificWebhooks() {
	let webhooks = {};

	$("#discord-specific-webhooks").find(".webhook").each(function() {
		let webhookType = $(this).data("webhookType");
		let webhook = $(this).val();

		webhooks[webhookType] = webhook;
	})

	return webhooks;
}

$("#remove-whitelist-for-inactive-players-checkbox").change(function() {
	const enabled = $(this).prop("checked");

	$("#remove-whitelist-for-inactive-players-days").prop("disabled", !enabled);
	$("#remove-whitelist-for-inactive-players-days").prop("required", enabled);

	if(!enabled) {
		$("#remove-whitelist-for-inactive-players-days").val("");
	}
})

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		
	}

	let sharedSettings = {
		locale: $("#settings_locale").val()
	}

	let serverSettings = {
		mainIdentifier: $("#settings_mainIdentifier").val(),

		discordInvite: $("#settings_discordInvite").val(),

		acePermission: $("#settings_acePermission").val(),

		discordServerID: $("#settings_discordServerID").val(),
		discordAllowlistRole: $("#settings_discordAllowlistRole").val(),
		discordBotToken: $("#settings_discordBotToken").val(),
		serverBanner: $("#settings_serverBanner").val(),

		fastReconnectMinutes: parseInt( $("#fast_reconnect_minutes").val() ),
		fastReconnectPriority: parseInt( $("#fast_reconnect_priority_to_add").val() ),

		enableDiscordRolesFeatures: $("#enable_discord_roles_features").prop("checked"),

		enableAllowlist: $("#enable_allowlist").prop("checked"),

		showSendAllowlistRequestButton: $("#show_allowlist_request_button").prop("checked"),

		minimumMinutesAfterStart: parseInt( $("#minimum_minutes_after_start").val() ),

		// Inactive players
		maxInactiveDays: $(`#remove-whitelist-for-inactive-players-checkbox`).prop("checked") ? parseInt( $("#remove-whitelist-for-inactive-players-days").val() ) : 0,

		// Discord logs
		areDiscordLogsActive: $("#enable-discord-logs").prop("checked"),
		mainDiscordWebhook: $("#main-discord-webhook").val(),

		specificWebhooks: getSpecificWebhooks()
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({clientSettings, sharedSettings, serverSettings}));

	refreshTranslations(sharedSettings.locale);

	showServerResponse(response);
})

function loadSettings(fullConfig) {
	$("#settings_discordInvite").val(fullConfig.discordInvite);
	$("#settings_acePermission").val(fullConfig.acePermission);
	
	$("#settings_serverBanner").val(fullConfig.serverBanner);

	$("#settings_mainIdentifier").val(fullConfig.mainIdentifier);
	$("#settings_discordAllowlistRole").val(fullConfig.discordAllowlistRole);
	toggleDiscordMainIdentifier(fullConfig.mainIdentifier === "discord");

	$("#settings_locale").val(fullConfig.locale);

	$("#fast_reconnect_minutes").val(fullConfig.fastReconnectMinutes);
	$("#fast_reconnect_priority_to_add").val(fullConfig.fastReconnectPriority);

	$("#enable_discord_roles_features").prop("checked", fullConfig.enableDiscordRolesFeatures).change();
	$("#settings_discordServerID").val(fullConfig.discordServerID);
	$("#settings_discordBotToken").val(fullConfig.discordBotToken);

	$("#enable_allowlist").prop("checked", fullConfig.enableAllowlist).change();

	$("#show_allowlist_request_button").prop("checked", fullConfig.showSendAllowlistRequestButton).change();

	// Minutes before connect after start
	$("#minimum_minutes_after_start").val(fullConfig.minimumMinutesAfterStart);

	// Inactive players
	$("#remove-whitelist-for-inactive-players-checkbox").prop("checked", fullConfig.maxInactiveDays > 0).change();
	$("#remove-whitelist-for-inactive-players-days").val(fullConfig.maxInactiveDays);

	// Discord logs
	$("#enable-discord-logs").prop("checked", fullConfig.areDiscordLogsActive).change();

	$("#main-discord-webhook").val(fullConfig.mainDiscordWebhook);

	if(fullConfig.specificWebhooks) {
		for(const[webhookType, webhookUrl] of Object.entries(fullConfig.specificWebhooks)) {
			$("#discord-specific-webhooks").find(`[data-webhook-type="${webhookType}"]`).val(webhookUrl);
		}
	}
}

// Reserved slots
const reservedSlotsDiv = document.getElementById('reserved-slots').getContext('2d');
const reservedSlotsChart = new Chart(reservedSlotsDiv, {
	type: 'doughnut',
});

let currentReservedSlots = [];

function editReservedSlot(slotId) {
	let slotData = currentReservedSlots[slotId];

	let editReservedSlotmodal = $("#edit-reserved-slot-modal");

	$("#edit-reserved-slots-amount").prop("required", slotData.type === "discord-role");
	$("#edit-reserved-slots-amount-div").toggle(slotData.type === "discord-role");

	$("#edit-reserved-slot-confirm-btn").toggle(slotData.type === "discord-role");

	$("#edit-reserved-slots-amount").val(slotData.reservedSlots);

	editReservedSlotmodal.data("slotIdentifier", slotData.identifier);
	
	editReservedSlotmodal.modal("show");
}

// Delete reserved slot
$("#delete-reserved-slot-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let editReservedSlotModal = $("#edit-reserved-slot-modal");
	let slotIdentifier = editReservedSlotModal.data("slotIdentifier");

	const response = await $.post(`https://${resName}/deleteReservedSlot`, JSON.stringify({
		identifier: slotIdentifier,
	}));

	editReservedSlotModal.modal("hide");
	loadAllReservedSlots();
	showServerResponse(response);
})

$("#edit-reserved-slot-modal").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let modal = $("#edit-reserved-slot-modal");

	let slotIdentifier = modal.data("slotIdentifier");
	let reservedSlots = parseInt( $("#edit-reserved-slots-amount").val() );	

	modal.modal("hide");

	const response = await $.post(`https://${resName}/createReservedSlots`, JSON.stringify({
		identifier: slotIdentifier,
		reservedSlots,
		type: "discord-role"
	}));	

	loadAllReservedSlots();
	showServerResponse(response);
})

$("#reserved-slots").click(function(event) {
	const points = reservedSlotsChart.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);

    if (points.length) {
        const firstPoint = points[0];
		
		// Has to be greater than 0 because the first element is used for the free slots
		if(firstPoint.index > 0) {
			editReservedSlot(firstPoint.index);
		}
    }
})

async function getTotalUnreservedSlotsCount() {
	let unreservedSlotsCount = await $.get(`https://${resName}/getTotalUnreservedSlotsCount`);
	return unreservedSlotsCount;
}

function loadAllReservedSlots() {
	$.get(`https://${resName}/getAllReservedSlots`, async function(reservedSlots) {
		let freeSlotsData = {
			reservedSlots: await getTotalUnreservedSlotsCount(),
			type: "discord-role", // Just fake it
			roleData: {
				name: getLocalizedText("free_slots"),
				color: 1234567 // Green
			}
		}

		let reservedSlotsArray = [freeSlotsData];

		for([identifier, slotData] of Object.entries(reservedSlots)) {
			slotData.identifier = identifier;

			reservedSlotsArray.push(slotData);
		}

		currentReservedSlots = reservedSlotsArray;

		reservedSlotsChart.data = {}

		// Fills all the names / identifiers / Discord roles names
		reservedSlotsChart.data.labels = reservedSlotsArray.map(reservedSlot => {
			if(reservedSlot.type === "discord-role"){
				return reservedSlot.roleData.name;
			} else if(reservedSlot.type === "player-identifier") {
				return reservedSlot.playerName
			}
		});

		reservedSlotsChart.data.datasets[0] = {};
		reservedSlotsChart.data.datasets[0].data = [];
		reservedSlotsChart.data.datasets[0].backgroundColor = [];

		// Fills all the slots and the colors
		reservedSlotsArray.forEach(reservedSlotData => {
			reservedSlotsChart.data.datasets[0].data.push(reservedSlotData.reservedSlots);

			let color = reservedSlotData.type === "discord-role" ? `#${reservedSlotData.roleData.color.toString(16)}` : getRandomColor();

			reservedSlotsChart.data.datasets[0].backgroundColor.push( color )
		});

		reservedSlotsChart.update();
	});
}

$("input[type=radio][name=reserved-slots-type]").change(function() {
	let val = $(this).val();

	$("#create-reserved-slots-discord-role-input").prop("disabled", !(val === "discord-role") );
	$("#create-reserved-slots-discord-role-input").prop("required", val === "discord-role");
	$("#discord-role-reserved-slots-amount").prop("disabled", !(val === "discord-role") );
	$("#discord-role-reserved-slots-amount").prop("required", val === "discord-role");
	$("#reserved-slots-discord-role-div").toggle(val === "discord-role");
	
	$("#create-reserved-slots-player-identifier-input").prop("disabled", !(val === "player-identifier") );
	$("#create-reserved-slots-player-identifier-input").prop("required", val === "player-identifier");
	$("#reserved-slots-player-identifier-div").toggle(val === "player-identifier");
});

$("#new-reserved-slots-choose-discord-role-btn").click(function() {
	discordRolesDialog(roleId => {
		$("#create-reserved-slots-discord-role-input").val(roleId);
	})
});

$("#new-reserved-slots-choose-player-btn").click(function() {
	playersListDialog(identifier => {
		$("#create-reserved-slots-player-identifier-input").val(identifier);
	})
})

$("#create-reserved-slots-btn").click(function() {
	let reservedSlotsModal = $("#create-reserved-slots-modal");

	reservedSlotsModal.removeClass("was-validated");

	$("input[type=radio][name=reserved-slots-type][value=player-identifier]").prop("checked", true).change();
	
	$("#create-reserved-slots-discord-role-input").val("");
	$("#create-reserved-slots-player-identifier-input").val("");
	$("#discord-role-reserved-slots-amount").val("");


	reservedSlotsModal.modal("show");
})

// Creates new reserved slots
$("#create-reserved-slots-modal").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let reservedSlotsModal = $("#create-reserved-slots-modal");

	let type = $("input[type=radio][name=reserved-slots-type]:checked").val();

	if(type === "discord-role") {
		var identifier = $("#create-reserved-slots-discord-role-input").val();
	} else if(type === "player-identifier") {
		var identifier = $("#create-reserved-slots-player-identifier-input").val();
	}

	let reservedSlots = parseInt( $("#discord-role-reserved-slots-amount").val() );

	let data = {
		type: type,
		identifier: identifier,
		reservedSlots: reservedSlots
	}

	reservedSlotsModal.modal("hide");

	const response = await $.post(`https://${resName}/createReservedSlots`, JSON.stringify(data));

	loadAllReservedSlots();

	showServerResponse(response);
})

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#easy-allowlist-version").text(version);

	loadAllAllowlistRequests();
	loadAllAllowlistedPlayers();
	loadAllQueuePriorities();
	loadAllReservedSlots();

	loadSettings(fullConfig);

	$("body").css("background-color", "rgba(10, 10, 10, 0.6)");
    $("#easy_allowlist").show();
}

function closeMenu() {
    $("#easy_allowlist").hide();

	$("body").css("background-color", "transparent");
    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	if (action == 'openMenu') {
		openMenu(data.version, data.fullConfig);
	}
})