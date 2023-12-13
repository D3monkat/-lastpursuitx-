local CandidateWinnerWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local PollsOpenWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local CandidateStartedWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local CompanyRegisterdWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local CompanyGrantGivenWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local AppointmentRequestWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local AppointmentApproveWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local MayorTaxChangeWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local TerminateVotingWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local NewLawWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local LawAgainstWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local LawPassedWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"
local LawRemovedWebhook = "https://discord.com/api/webhooks/1007775161472253982/fao_Py3whihwBBLFTVRwkoQz0alA7bkCT66t0izdwKCMxo1qSLKA2v6qhwXcJPh0OS8s"

webhookMsg = {
    ['CandidateWinner'] = {
        ['title'] = "%s",
        ['message'] = "*The votes have been counted and the winner of the election is...* \n\n **Name:** ```%s```"
    }, 
    ['PollsOpen'] = {
        ['title'] = "%s",
        ['message'] = "```The polls are now open, if you would like to make a vote please visit the city hall.```"
    },
    ['CandidateStarted'] = {
        ['title'] = "%s",
        ['message'] = "```This election process has just started, If you believe you are the right person to run as a candidate for this role please visit the city hall to put in an candidate application.```"
    },
    ['CompanyRegisterd'] = {
      ['title'] = "Company Registered",
      ['message'] = "**Company Name:** ```%s``` \n\n **Owners Name:** ```%s``` \n\n **Mayor's Name:** ```%s``` \n\n **Date & Time Of Registration:** ```%s```"
    },
    ['CompanyGrantGiven'] = {
      ['title'] = "Company Name: %s",
      ['message'] = "**Grant Reason:** ```%s``` \n\n **Grant Amount:** ```%s%s``` \n\n **Date & Time:** ```%s``` \n\n **Owners Name:** ```%s``` \n\n **Mayor's Name:** ```%s```"
    },
    ['AppointmentRequest'] = {
      ['title'] = "Appointment Request",
      ['message'] = "**Name:** ```%s``` \n\n **Reason:** ```%s``` \n\n **Date & Time Of Request:** ```%s```"
    },
    ['AppointmentApprove'] = {
      ['title'] = "Appointment Approve",
      ['message'] = "**Name:** ```%s``` \n\n **Mayor's Name:** ```%s``` \n\n **Reason:** ```%s``` \n\n **Appointment Date & Time:** ```%s```"
    },
    ['MayorTaxChange'] = {
      ['title'] = "Company Tax Change",
      ['message'] = "**Company Name:** ```%s``` \n\n **Old Tax Amount:** ```%s%s``` \n\n **New Tax Amount:** ```%s%s``` \n\n **Owners Name:** ```%s``` \n\n **Mayor's Name:** ```%s```"
    },
    ['TerminateVoting'] = {
      ['title'] = "%s",
      ['message'] = "```The government have terminated the voting.```"
    },
    ['NewLaw'] = {
      ['title'] = "%s",
      ['message'] = "**Name Of Law:** ```%s``` \n\n **Law Description:** ```%s``` \n\n **Date Made:** ```%s```"
    },
    ['LawAgainst'] = {
      ['title'] = "%s Law",
      ['message'] = "```%s law has been deleted from the db, as it didn't have enough votes for a pass```"
    },
    ['LawPassed'] = {
      ['title'] = "%s Passed",
      ['message'] = "**Name Of Law:** ```%s``` \n\n **Law Description:** ```%s``` \n\n **Votes:** ```%s/%s```"
    },
    ['LawRemoved'] = {
      ['title'] = "%s Removed",
      ['message'] = "**Player:** ```%s``` \n\n **Message:** ```%s has been removed from the passed laws, this has now been permanently deleted from the database.```"
    }
}

sendLogsDiscord = function(title, message, webhook)
    local Discord_url = nil
	local embed = {
		{
			["color"] = 3085967,
			["title"] = "**".. title .."**",
			["description"] = message
		}
	}
    if webhook == "CandidateWinnerWebhook" then
      Discord_url = CandidateWinnerWebhook
    elseif webhook == "PollsOpenWebhook" then
      Discord_url = PollsOpenWebhook
    elseif webhook == "CandidateStartedWebhook" then
      Discord_url = CandidateStartedWebhook 
    elseif webhook == "CompanyRegisterdWebhook" then
      Discord_url = CompanyRegisterdWebhook
    elseif webhook == "CompanyGrantGivenWebhook" then
      Discord_url = CompanyGrantGivenWebhook  
    elseif webhook == "AppointmentRequestWebhook" then
      Discord_url = AppointmentRequestWebhook
    elseif webhook == "AppointmentApproveWebhook" then
      Discord_url = AppointmentApproveWebhook
    elseif webhook == "MayorTaxChangeWebhook" then
      Discord_url = MayorTaxChangeWebhook
    elseif webhook == "TerminateVotingWebhook" then
      Discord_url = TerminateVotingWebhook
    elseif webhook == "NewLawWebhook" then
      Discord_url = NewLawWebhook
    elseif webhook == "LawAgainstWebhook" then
      Discord_url = LawAgainstWebhook   
    elseif webhook == "LawPassedWebhook" then
      Discord_url = LawPassedWebhook
    elseif webhook == "LawRemovedWebhook" then
      Discord_url = LawRemovedWebhook         
    end
    PerformHttpRequest(Discord_url, function(err, text, headers) end, 'POST', json.encode({username = title, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

customphonefunction = function(data)
  local identifier = data.id
  local sender = data.sender
  local subject = data.subject
  local message = data.mail
  local image = data.image
  local button = data.button
  local notify = data.notifymsg

  -- Put custom event here.

end