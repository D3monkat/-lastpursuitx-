Config = {
	FrameworkExport = "qb-core", -- Set this too your core name, only change this if you have a custom version of QBCore. 
	DiscordWebhook = { -- Set the webhooks you want to use to true, add your webhook links to server/webhook.lua file at the top.
	  CandidateWinner = true, 
	  PollsOpen = true, 
	  CandidateStarted = true, 
	  CompanyRegisterd = true, 
	  CompanyGrantGiven = true, 
	  AppointmentRequest = true, 
	  MayorTaxChange = true, 
	  TerminateVoting = true,
	  NewLaw = true,
	  LawAgainst = true,
	  LawPassed = true,
	  LawRemoved = true
	},
	Language = "ENG", -- Set to "ENG" for English & "GER" for German & "FRA" for French.
	Currency = '$', -- Set this to the currency your server uses.
	UsingAPCourt = false, -- Set this to true if your using AP-COURT.
	NotifyWinnerByPhone = true, -- Set true to email player of winning the election
	displayVotingChatNotify = false, -- Set too true to show voting notiforcations in chat false for notify
	AddJobsFromConfig = true, -- Set this to true if you want this script to add the jobs from Config.AddSharedJobs below to your shared jobs in qb-core. 
	VotingSettings = {
	  Staff = {
		enable = true, -- Set this too true if you want the server staff to control voting.
		Command = "votingstaff", -- Set this too what you want the command to be.
		rank = "admin" -- Set this to the staff rank able to control the voting.
	  }, 
	  Job = true -- Set this too true for the CityHall(Government Staff) to control the voting.
	},
	JobManagementScriptName = "qb-management", -- If your management script has compatibility with qb-management then change to the resource name.
	VotingLaws = true, -- Set this to true if you want to use the law voting system.
	Phone = {GKSPhone = false, QBPhone = true, QuasarPhone = false, HighPhone = false, LBPhone = false, Custom = false}, -- Set to the phone you use to true, if you do not have one of these phones then set Custom to true and edit the function in webhooks.lua.
	Interactions = {qbTarget = true, oxTarget = false, qTarget = false, drawText = false}, -- Set the target system to true that you use.
	Banking = {
	  okokbanking = false, -- Set this to true if you own okokbanking and you want the tax to show as a transaction.
	  other = false -- Set to true if you own a differnt banking script and want to add an export, to edit this open functions.lua and edit the banking function.
	},
	ExportNames = {
	  menu = "qb-menu",
	  input = "qb-input"
	},
	Context = {QB = true, OX = false},
	Dialog = {QB = true, OX = false},
	CustomEdits = "" -- Leave this blank, this is for customers that have a custom version of the government script.
}

Config.AddSharedJobs = {
	['cityhall'] = {
        label = 'CityHall',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Government Staff',
				isboss = false,
                payment = 10
            },
			['1'] = {
                name = 'Mayor',
				isboss = true,
                payment = 100
            },
		},
    },
} 

Config.Dirk_BountyHunterV2 = { -- https://www.dirkscripts.com/package/5326364.
  UsingScript = false, 
  Option = {
	OriginOffice = "policeBounties", -- This must correlate to a bountyOffice they have in their bountyoffices.lua from dirk-bountiesv2.
	BountyReason = "Unpaid Tax: "..Config.Currency.."%s", -- This would be the reason which is displayed in the Bounty UI.
	BountyType = "percent", -- Use "percent" for a percentage of the outstanding tax amount or "value" for a config set amount.
	Amount = 0.20, -- If your using "value" set the amount the bounty will start of as like 5000, If using "percent" then set the percentage amount like 0.20 which would be 20% of the outstanding tax amount.
	CompanySafety = true, -- if this is set to true the company will be given a starting buffer on their tax account before it falls into negative again, below set the safety buffer amount. If its set to false there tax account will be set to 0.
	SafetyBufferAmount = 2000, -- This is the amount the company tax account will get given so they don't fall into a negative balance straight away.
    Consequences = {
	  Fine = true, -- The fine amount will be the tax amount that is outstanding, if set to false then set the fine amount below.
	  FineAmount = 0, -- If the above option is set to false then enter an amount the company owner will pay when paying the fine of the bounty.
	  Jail = false, -- Set if you want the company owner to face a jailtime as well as a fine if the tax is outstanding.
	  JailTime = 60, -- Set the jailtime in mintues.
	} 
  }
}

Config.MayorOptions = {
	funds = {
		grants = {enable = true, min = 2000, max = 200000},
		withdrawal = {enable = false, min = 100, max = 200000},
		deposit = {enable = false, min = 1000, max = 100000}
	}
}

Config.GovernmentJobs = {'judge', 'police', 'ambulance', 'cityhall'} -- Set the jobs that are not ownable here.

Config.Tax = {
	MayorControl = {
		enable = true,
		TaxTypes = {
	        ["Income"] = {enable = true, mayorControl = true, label = 'Income', percentageCap = 0.80, percentage = 0.15, AddCityHallFunds = true},		
	        ["Housing"] = {enable = false, mayorControl = false, label = 'Housing', percentageCap = 0.15, percentage = 0.15, AddCityHallFunds = true},
			["Vehicle"] = {enable = false, mayorControl = false, label = 'Vehicle', percentageCap = 0.15, percentage = 0.15, AddCityHallFunds = true},
			["Item"] = {enable = true, mayorControl = true, label = 'Item', percentageCap = 0.80, percentage = 0.15, AddCityHallFunds = true},
		}
	}
}

Config.BusinessTax = {
	enable = true, -- Set this too true to enable the business tax.
	securityVerify = false, -- Set this to true if you want the player to recive a pin to verify registering a business with the mayor.
	tax = {
      mayorControl = {
		changeAmount = true, -- Set this too true if you want the mayor to ajust the business tax per job.
        amounts = {
			min = 2000, -- Min the mayor can ajust business tax.
			max = 20000 -- Max the mayor can ajust business tax.
		}
	  },
	  basicAmount = 2000, -- Basic amount that the business will pay in tax.
	  AddCityHallFunds = true, -- Set to true if you want the tax that busniess pay to go into the cityhall fund.
	  AutoStoreTime = {enable = true, timetaken = 10}, -- This will store the time that the server is up for, which means you can set the time until tax to as many minutes as you would like. 
	  timetaken = 20 -- Time in mintues that the business tax will be taken, Use this if you want business to pay take while the server is live.
	}
}

Config.Voting = {
	[1] = {
		enable = true,
		poll = "Mayor Election",
		givenJob = {name = "mayor", label = "Mayor", grade = 0},
		applicationJobCheck = {enable = false, job = "government", notify = "You need to be in the government in order to be considered as a candidate!"}
	},
	[2] = {
		enable = true,
		poll = "Police Chief Election",
		givenJob = {name = "police", label = "Police Chief", grade = 0},
		applicationJobCheck = {enable = false, job = "police", notify = "You need to be in the police in order to be considered as a candidate!"}
	},
	[3] = {
		enable = true,
		poll = "EMS Chief Election",
		givenJob = {name = "ambulance", label = "Chief Of EMS", grade = 0},
		applicationJobCheck = {enable = false, job = "doctor", notify = "You need to be in the medical department in order to be considered as a candidate!"}
	},
}

Config.Target = { -- QB-TARGET & QTARGET BOTH PRESETUP FOR GABZ CITY HALL.
	['qb-target'] = {
		['votingSystem'] = {
			['votingStaff'] = {
				['active'] = true,
				['ped'] = {
					active = true,
			        ped = {model = "a_m_m_prolhost_01"},
                    coords = vector4(-539.71, -177.15, 38.23, 225.43),
                    minusOne = true,
                    freeze = true,
                    invincible = true,
                    blockevents = true,
				    job = {name = "cityhall", grade = 0}
				}
			},
			['votingPoints'] = {
				['active'] = true,
                ['points'] = {
					{active = true, name = "booth_one", coords = vector3(-534.12, -174.51, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
					{active = true, name = "booth_two", coords = vector3(-533.36, -175.84, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_three", coords = vector3(-532.59, -177.15, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_four", coords = vector3(-541.82, -182.48, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_five", coords = vector3(-542.59, -181.17, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_six", coords = vector3(-543.36, -179.84, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
				}
			}
		},
		['majorOffice'] = {
			['active'] = true,
			['job'] = {name = "cityhall", grade = 1},
			['points'] = {
				{active = true, name = "office_one", coords = vector3(-528.64, -188.97, 43.37), length = 3, width = 1.3, heading = 30, minZ = 43.17, maxZ = 43.67},
			}
		},
		['appointmentsPed'] = {
			['active'] = true,
			['ped'] = {
				active = true,
				ped = {model = "a_m_m_prolhost_01"},
				coords = vector4(-549.9996, -190.8860, 38.2270, 183.8847),
				minusOne = true,
				freeze = true,
				invincible = true,
				blockevents = true
			}
		}
    },
	['ox-target'] = {
		['votingSystem'] = {
			['votingStaff'] = {
				['active'] = true,
				['ped'] = {
					active = true,
			        ped = {model = "a_m_m_prolhost_01"},
                    coords = vector4(-539.71, -177.15, 37.23, 222.43),
				    job = {name = "cityhall"}
				}
			},
			['votingPoints'] = {
				['active'] = true,
                ['points'] = {
					{active = true, name = "booth_one", coords = vector3(-541.85, -182.5, 38.0), size = vector3(0.45, 0.6, 2.95), rotation = 31.25},
					{active = true, name = "booth_two", coords = vector3(-542.65, -181.25, 38.0), size = vector3(0.45, 0.6, 1.2), rotation = 31.25},
			        {active = true, name = "booth_three", coords = vector3(-543.45, -179.9, 38.0), size = vector3(0.45, 0.6, 1.2), rotation = 31.25},
			        {active = true, name = "booth_four", coords = vector3(-534.05, -174.45, 38.0), size = vector3(0.45, 0.6, 1.3), rotation = 31.5},
			        {active = true, name = "booth_five", coords = vector3(-533.3, -175.8, 38.0), size = vector3(0.45, 0.6, 1.35), rotation = 31.5},
			        {active = true, name = "booth_six", coords = vector3(-532.45, -177.05, 38.0), size = vector3(0.45, 0.6, 1.35), rotation = 31.5},
				}
			}
		},
		['majorOffice'] = {
			['active'] = true,
			['job'] = {name = "cityhall"},
			['points'] = {
				{active = true, name = "office_one", coords = vector3(-528.4, -189.05, 43.0), size = vector3(0.45, 2.55, 1.5), rotation = 31.5},
			}
		},
		['appointmentsPed'] = {
			['active'] = true,
			['ped'] = {
				active = true,
				ped = {model = "a_m_m_prolhost_01"},
				coords = vector4(-549.9996, -190.8860, 37.2270, 183.8847)
			}
		}
    },
    ['qtarget'] = {
		['votingSystem'] = {
			['votingStaff'] = {
				['active'] = true,
				['ped'] = {
					active = true,
                    ped = {model = 'a_m_m_prolhost_01', sex = 'male'},
                    coords = {x = -539.71, y = -177.15, z = 38.23, h = 225.43},
				    job = {name = "cityhall", grade = 0}
				}
			},
			['votingPoints'] = {
				['active'] = true,
                ['points'] = {
					{active = true, name = "booth_one", coords = vector3(-534.12, -174.51, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
					{active = true, name = "booth_two", coords = vector3(-533.36, -175.84, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_three", coords = vector3(-532.59, -177.15, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_four", coords = vector3(-541.82, -182.48, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_five", coords = vector3(-542.59, -181.17, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
			        {active = true, name = "booth_six", coords = vector3(-543.36, -179.84, 38.23), length = 1.45, width = 0.6, heading = 30, minZ = 38.23, maxZ = 38.48},
				}
			}
		},
		['majorOffice'] = {
			['active'] = true,
			['job'] = {name = "cityhall", grade = 1},
			['points'] = {
				{active = true, name = "office_one", coords = vector3(-528.64, -188.97, 43.37), length = 3, width = 1.3, heading = 30, minZ = 43.17, maxZ = 43.67, job = {name = "mayor", grade = 0}},
			}
		},
		['appointmentsPed'] = {
			['active'] = true,
			['ped'] = {
				active = true,
                ped = {model = 'a_m_m_prolhost_01', sex = 'male'},
                coords = {x = -549.9996, y = -190.8860, z = 38.2270, h = 183.8847}
			}
		}
    },
	['DrawText'] = { -- Preset for Gabz Townhall
	  ['govpoints'] = {
		-- Voting System for controling voting and applying to be a candidate.
		['voting'] = {
			enable = true, 
			text = '[E] Voting System', 
			pos = {x = -538.39, y = -177.71, z = 38.23, length = 3.8, width = 3, boxName = "votingsystem"}, 
			job = {check = false, name = "cityhall", grade = 0}, 
			trigger = 'ap-government:client:drawtext:voteSystem', isServer = false
		},
		-- Mayor Job options.
		['mayor'] = {
			enable = true, 
			text = '[E] Mayor Options', 
			pos = {x = -528.64, y = -188.97, z = 43.37, length = 2.2, width = 5, boxName = "mayorsettings"}, 
			job = {check = true, name = "cityhall", grade = 1}, 
			trigger = 'ap-government:client:majorOffice', isServer = false
		},
		-- Appointments Ped.
		['appointments'] = {
			enable = true, 
			text = '[E] Mayor Appointments', 
			pos = {x = -549.2592, y = -191.0631, z = 38.2270, length = 3.2, width = 4, boxName = "mayorappointments"}, 
			job = {check = false, name = "N/A", grade = 0}, 
			trigger = 'ap-government:server:appointmentData', isServer = true
		},
	  },
	  ['votingPoints'] = {
		vector3(-542.8071, -179.5148, 38.2270),
		vector3(-541.9949, -180.7852, 38.2270),
		vector3(-541.3036, -182.1816, 38.2270),
		vector3(-533.0984, -177.4846, 38.2270),
		vector3(-533.8582, -176.1762, 38.2270),
		vector3(-534.6843, -174.7355, 38.2270)
	  }
	}
}

Config.PhoneSettings = {
	['MAIL'] = { -- USE THIS FOR GKSPHONE / QUASAR-PHONE / QBPHONE / HIGH-PHONE / ROADPHONE
		['approve_candidate'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the government",
			['sender'] = "Government",
			['subject'] = "Candidate Update",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as you have been accepted as a candidate. <br /><br /> You can now start advertising your candidacy! <br /><br /> Kind Regards,<br /><br /> City Government<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "voting@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		}, 
		['denied_candidate'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the government",
			['sender'] = "Government",
			['subject'] = "Candidate Update",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as your application as a candidate has been denied. <br /><br /> Here is the reason why: %s <br /><br /> Kind Regards,<br /><br /> City Government<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "voting@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['candidate_winner'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the government",
			['sender'] = "Government",
			['subject'] = "Candidate Update",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as you have recived the most votes and are now the new %s. <br /><br /> Amount of votes: %s , Please visit the voting room to get your job.<br /><br /> Kind Regards,<br /><br /> City Government<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "voting@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		}, 
		['candidate_winner_new'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the government",
			['sender'] = "Government",
			['subject'] = "Candidate Update",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as you have recived the most votes and are now the new %s. <br /><br /> Amount of votes: %s , You have now been automatically assigned the job.<br /><br /> Kind Regards,<br /><br /> City Government<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "voting@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		}, 
		['candidate_warn'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the government",
			['sender'] = "Government",
			['subject'] = "Candidate Warning",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as you have been warned for the reason %s. <br /><br /> Regards,<br /><br /> City Government<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "voting@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},   
		['verify_player'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Verify Pin",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as a security check, please provide this pin to the mayor's office. PIN: %s <br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "verify@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},  
		['registerd_company'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Registerd Company",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as your business %s has been registerd on the city database, any questions make an appointment with the mayor's office. <br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "business@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		}, 
		['transfer_company'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Company Transfer",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as your business %s has been transferd to %s, any issues please make an appointment with the mayor's office. <br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "business@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['company_tax_change'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Company Tax Change",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are reciveing this email as your business tax has been changed from "..Config.Currency.."%s to "..Config.Currency.."%s, any issues please make an appointment with the mayor's office. <br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "business@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['message_company_owner'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Business",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> %s <br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "business@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['arrange_appointment'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Appointment",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are receiving this email as you appointment has been scheduled for %s at the cityhall. <br /><br /> please make sure you turn up for your appointment 5 minutes before the scheduled time.<br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "appointments@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['company_grant'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayor's office",
			['sender'] = "Mayor's Office",
			['subject'] = "Business Grant",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are receiving this email as your business has been given a grant of "..Config.Currency.."%s from the City Hall,  <br /><br /> Reason for grant: %s.<br /><br /> Regards,<br /><br /> Mayor's Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "grant@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		},
		['bounty_issued'] = {
			['title'] = "Mail",
			['msg'] = " Email received from the mayors office",
			['sender'] = "Mayors Office",
			['subject'] = "Escalation Of Unpaid Tax",
			['image'] = "/html/static/img/icons/mail.png",
			['mail'] = "Dear %s, <br /><br /> You are receiving this email as you have failed to pay your unpaid company tax of "..Config.Currency.."%s. This has now been escalated to an issue of a bounty, this is now out of the governments control and your tax account has been reset. <br /><br /> Regards,<br /><br /> Mayors Office<br />",
			['button'] = '{"buttonEvent":"ap-voting:client:setTownhallWaypoint","buttonData":"test","buttonname":"Directions To Townhall"}',
			--HIGH PHONE ONLY BELOW 
			['email'] = "grant@gov.com",
			['photo'] = "",
			['photoattachment'] = ""
		}
	}
}