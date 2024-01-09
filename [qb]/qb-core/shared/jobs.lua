QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },
    whitewidow = {
		label = 'White Widow',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 50
            },
			['1'] = {
                name = 'Deliveries',
                payment = 75
            },
			['2'] = {
                name = 'Sales',
                payment = 100
            },
			['3'] = {
                name = 'Grower',
                payment = 125
            },
			['4'] = {
                name = 'Assistant Manager',
                payment = 150
            },
			['5'] = {
                name = 'Manager',
				isboss = true,
                payment = 175
            },
			['6'] = {
                name = 'Owner',
				isboss = true,
                payment = 200
            },
        },
	},
    police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['1'] = { name = 'Officer', payment = 235 },
			['2'] = { name = 'Officer 2', payment = 240 },
			['3'] = { name = 'Corporal', payment = 257 },
			['4'] = { name = 'Sergeant', payment = 275 },
			['5'] = { name = 'Detective', payment = 294 },
			['6'] = { name = 'Lead Detective', payment = 315 },
			['7'] = { name = 'Lieutenant', payment = 337 },
			['8'] = { name = 'Captain', payment = 361 },
			['9'] = { name = 'Commander', isboss = true, payment = 386 },
			['10'] = { name = 'Deputy Chief', payment = 413 },
			['11'] = { name = 'Assistant Chief', payment = 442 },
			['12'] = { name = 'Chief Of Police', payment = 473, isboss = true, bankAuth = true },
		},
	},
	bcso = {
        label = 'Blaine County Sheriffs Office',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
			['0'] = { name = 'Cadet', payment = 240 }, -- Base payment
			['1'] = { name = 'Deputy', payment = 257 }, -- Increase by 7%
			['2'] = { name = 'Senior Deputy', payment = 275 }, -- Increase by 7% compounded
			['3'] = { name = 'Corporal', payment = 294 },
			['4'] = { name = 'Sergeant', payment = 315 },
			['5'] = { name = 'Lieutenant', payment = 337 },
			['6'] = { name = 'Captain', payment = 361, isboss = true, bankAuth = false },
			['7'] = { name = 'Major', payment = 386, isboss = true, bankAuth = true },
			['8'] = { name = 'Chief Deputy', payment = 413, isboss = true, bankAuth = true },
			['9'] = { name = 'UnderSheriff', payment = 442, isboss = true, bankAuth = true },
			['10'] = { name = 'Sheriff', payment = 473, isboss = true, bankAuth = true },
        },
    },
    sast = {
		label = 'SAST',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Cadet', payment = 240 }, -- Base payment
			['1'] = { name = 'Probationary Trooper', payment = 257 }, -- Increase by 7%
			['2'] = { name = 'Trooper', payment = 275 }, -- Increase by 7% compounded
			['3'] = { name = 'Trooper II', payment = 294 },
			['4'] = { name = 'Trooper III', payment = 315 },
			['5'] = { name = 'Senior Trooper', payment = 337 },
			['6'] = { name = 'Corporal', payment = 361 },
			['7'] = { name = 'Senior Corporal', payment = 386 },
			['8'] = { name = 'Sergeant', payment = 413 },
			['9'] = { name = 'Staff Sergeant', payment = 442 },
			['10'] = { name = 'First Sergeant', payment = 473 },
			['11'] = { name = 'Sergeant First Class', payment = 506 },
			['12'] = { name = 'Master Sergeant', payment = 541 },
			['13'] = { name = 'Command Sergeant', payment = 579 },
			['14'] = { name = 'Second Lieutenant', payment = 619 },
			['15'] = { name = 'Lieutenant', payment = 662 },
			['16'] = { name = 'Major', payment = 708 },
			['17'] = { name = 'Lieutenant Colonel', payment = 757 },
			['18'] = { name = 'Colonel', payment = 810 },
			['19'] = { name = 'Deputy Commissioner', payment = 867, bankAuth = true },
			['20'] = { name = 'Asst. Commissioner', payment = 928, bankAuth = true },
			['21'] = { name = 'Commissioner', payment = 993, bankAuth = true },	
		},
	},
    beanmachine = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	burgershot = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419, bankAuth = true  },
        },
	},
    catcafeuwu = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 420, bankAuth = true },
        },
	},
	upnatom = {
		label = "Up n Atom",
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	hornys = {
		label = "Hornys",
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 275 },
			['2'] = { name = 'Experienced', payment = 314 },
			['3'] = { name = 'Advanced', payment = 325 },
			['4'] = { name = 'Manager', isboss = true, payment = 350 },
        },
	},
	postop = {
        label = 'PostOp',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 50
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 50
            },
        },
    },
    ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Paramedic', payment = 276 },
			['2'] = { name = 'Doctor', payment = 317 },
			['3'] = { name = 'Surgeon', payment = 365 },
			['4'] = { name = 'Chief', isboss = true, payment = 419, bankAuth = true },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'House Sales', payment = 276 },
			['2'] = { name = 'Business Sales', payment = 317 },
			['3'] = { name = 'Broker', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419, bankAuth = true },
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Driver', payment = 75 },
			['2'] = { name = 'Event Driver', payment = 100 },
			['3'] = { name = 'Sales', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Showroom Sales', payment = 276 },
			['2'] = { name = 'Business Sales', payment = 317 },
			['3'] = { name = 'Finance', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419 },
		},
	},
	shoppdm = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['100'] = { name = 'Showroom Sales', payment = 317 },
		},
	},
	shopkatsmotors = {
		label = 'Vehicle Dealer Kats',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['100'] = { name = 'Showroom Sales', payment = 317 },
		},
	},
	shoptesla = {
		label = 'Electric Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['100'] = { name = 'Showroom Sales', payment = 317 },
		},
	},
	nightclub = {
		label = 'Nightclub',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Renter', payment = 240 },
			['1'] = { name = 'Security', payment = 250 },
			['2'] = { name = 'Owner', payment = 317 },
		},
	},
	casino = {
		label = 'Casino',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['1'] = { name = 'Tables', payment = 240 },
			['2'] = { name = 'Ownera', payment = 250 },
		},
	},
	shoptuner = {
		label = 'Tuner Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['100'] = { name = 'Showroom Sales', payment = 317 },
		},
	},
	redline = {
		label = 'Redline',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419, bankAuth = true },
		},
	},
	tuner = {
		label = 'Tuner Shop',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419, bankAuth = true },
			['5'] = { name = 'Owner', isboss = true, payment = 483, bankAuth = true },
		},
	},
	shopbluelinecustoms = {
		label = 'Blueline Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419, bankAuth = true }, 
			['5'] = { name = 'Owner', isboss = true, payment = 483, bankAuth = true },
			['100'] = { name = 'Owner', isboss = true, payment = 483, bankAuth = true },
		},
	},
	shoplux = {
		label = 'Lux Mech',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 240 },
			['1'] = { name = 'Novice', payment = 276 },
			['2'] = { name = 'Experienced', payment = 317 },
			['3'] = { name = 'Advanced', payment = 365 },
			['4'] = { name = 'Manager', isboss = true, payment = 419 },
			['100'] = { name = 'Sales Manager', payment = 483, bankAuth = true  },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	beeker = {
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	bennys = {
		label = 'Bennys Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
}


            -- Jobs Creator integration (jobs_creator)
            RegisterNetEvent("jobs_creator:injectJobs", function(jobs)
                QBShared.Jobs = jobs
            end)
        