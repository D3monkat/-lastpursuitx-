QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
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

	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Officer', payment = 75 },
			['2'] = { name = 'Sergeant', payment = 100 },
			['3'] = { name = 'Lieutenant', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, payment = 150 },
		},
	},
	
    bcso = {
        label = 'Blaine County Sheriffs Office',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            -- ['0'] = { name = 'Cadet', payment = 200 },
            -- ['1'] = { name = 'Deputy', payment = 450 },
            -- ['2'] = { name = 'Senior Deputy', payment = 500 },
            -- ['3'] = { name = 'Corporal', payment = 575 },
            -- ['4'] = { name = 'Sergeant', payment = 650 },
            -- ['5'] = { name = 'Lieutenant', payment = 725 },
            -- ['6'] = { name = 'Captain', payment = 800, isboss = true, bankAuth = false },
            -- ['7'] = { name = 'Major', payment = 875, isboss = true, bankAuth = true },
	        -- ['8'] = { name = 'Chief Deputy', payment = 950, isboss = true, bankAuth = true },
  	        -- ['9'] = { name = 'UnderSheriff', payment = 1025, isboss = true, bankAuth = true },
            -- ['10'] = { name = 'Sheriff', payment = 1100, isboss = true, bankAuth = true },
			['0'] = { name = 'Cadet', payment = 240 }, -- Base payment
['1'] = { name = 'Deputy', payment = math.floor(240 * 1.07) }, -- Increase by 7%
['2'] = { name = 'Senior Deputy', payment = math.floor(240 * (1.07 ^ 2)) }, -- Increase by 7% compounded
['3'] = { name = 'Corporal', payment = math.floor(240 * (1.07 ^ 3)) },
['4'] = { name = 'Sergeant', payment = math.floor(240 * (1.07 ^ 4)) },
['5'] = { name = 'Lieutenant', payment = math.floor(240 * (1.07 ^ 5)) },
['6'] = { name = 'Captain', payment = math.floor(240 * (1.07 ^ 6)), isboss = true, bankAuth = false },
['7'] = { name = 'Major', payment = math.floor(240 * (1.07 ^ 7)), isboss = true, bankAuth = true },
['8'] = { name = 'Chief Deputy', payment = math.floor(240 * (1.07 ^ 8)), isboss = true, bankAuth = true },
['9'] = { name = 'UnderSheriff', payment = math.floor(240 * (1.07 ^ 9)), isboss = true, bankAuth = true },
['10'] = { name = 'Sheriff', payment = math.floor(240 * (1.07 ^ 10)), isboss = true, bankAuth = true },

            
        },
    },

	sast = {
		label = 'SAST',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Cadet', payment = 240 }, -- $30/hour
			['1'] = { name = 'Probationary Trooper', payment = 280 }, -- $35/hour
			['2'] = { name = 'Trooper', payment = 320 }, -- $40/hour
			['3'] = { name = 'Trooper II', payment = 360 }, -- $45/hour
			['4'] = { name = 'Trooper III', payment = 400 }, -- $50/hour
			['5'] = { name = 'Senior Trooper', payment = 440 }, -- $55/hour
			['6'] = { name = 'Corporal', payment = 480 }, -- $60/hour
			['7'] = { name = 'Senior Corporal', payment = 520 }, -- $65/hour
			['8'] = { name = 'Sergeant', payment = 560 }, -- $70/hour
			['9'] = { name = 'Staff Sergeant', payment = 600 }, -- $75/hour
			['10'] = { name = 'First Sergeant', payment = 640 }, -- $80/hour
			['11'] = { name = 'Sergeant First Class', payment = 680 }, -- $85/hour
			['12'] = { name = 'Master Sergeant', payment = 720 }, -- $90/hour
			['13'] = { name = 'Command Sergeant', payment = 760 }, -- $95/hour
			['14'] = { name = 'Second Lieutenant', payment = 800 }, -- $100/hour
			['15'] = { name = 'Lieutenant', payment = 840 }, -- $105/hour
			['16'] = { name = 'Major', payment = 880 }, -- $110/hour
			['17'] = { name = 'Lieutenant Colonel', payment = 920 }, -- $115/hour
			['18'] = { name = 'Colonel', payment = 960 }, -- $120/hour
			['19'] = { name = 'Deputy Commissioner', isboss = true, bankAuth = true, payment = 1000 }, -- $125/hour
			['20'] = { name = 'Asst. Commissioner', isboss = true, bankAuth = true, payment = 1040 }, -- $130/hour
			['21'] = { name = 'Commissioner', isboss = true, bankAuth = true, payment = 1080 }, -- $135/hour
			
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
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

	catcafe = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
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
		label = "Horny's",
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
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
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Paramedic', payment = 75 },
			['2'] = { name = 'Doctor', payment = 100 },
			['3'] = { name = 'Surgeon', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, payment = 150 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
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
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
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
	mechanic2 = {
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
	mechanic3 = {
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
		label = 'Beeker\'s Garage',
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
		label = 'Benny\'s Original Motor Works',
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
