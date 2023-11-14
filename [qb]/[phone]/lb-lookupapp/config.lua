Config = {}

Config.Framework = "auto" -- "esx" or "qb"
Config.Locale = "en"

Config.VisibleInformation = {
    -- PERSON
    Job = true,
    JobGrade = true,
    Gender = true,
    Age = true,

    -- VEHICLE
    Model = true,
    Color = true,
    Owner = true,

    -- Both
    PhoneNumber = true,
}

Config.HiddenPersons = {
    -- "identifier"
}

Config.HiddenVehicles = {
    -- "ABC 123",
}

Config.Queries = {
    esx = {
        peopleSelect = [[
            SELECT 
                u.identifier, 
                CONCAT(u.firstname, ' ', u.lastname) AS `name`, 
                u.dateofbirth as dob, 
                u.sex = "m" AS isMale,
                g.label AS jobGrade,
                j.label AS job
            FROM users u
            LEFT JOIN jobs j ON j.name = u.job
            LEFT JOIN job_grades g ON g.job_name = u.job AND g.grade = u.job_grade
        ]],
        peopleCount = "SELECT COUNT(1) FROM users",
        peopleWhere = "WHERE CONCAT(firstname, ' ', lastname) LIKE @query",
        peopleByNumberWhere = "WHERE identifier IN (SELECT `owner` FROM phone_phones WHERE phone_number LIKE @query)",
        vehicles = [[
            SELECT
                v.plate,
                v.vehicle,
                v.`owner` AS identifier,
                CONCAT(u.firstname, ' ', u.lastname) AS `owner`
            FROM 
                owned_vehicles v
            LEFT JOIN
                users u
            ON
                u.identifier = v.`owner`
            WHERE
                v.plate LIKE @query
            AND
                v.`type` = "car"
        ]],
        vehicleCount = "SELECT COUNT(1) FROM owned_vehicles WHERE plate LIKE @query AND `type` = 'car'"
    },
    qb = {
        peopleSelect = [[
            SELECT
                citizenid AS identifier, 
                CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')), ' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) AS `name`,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.birthdate')) AS dob,
                JSON_UNQUOTE(JSON_EXTRACT(job, '$.label')) AS job,
                JSON_UNQUOTE(JSON_EXTRACT(job, '$.grade.name')) AS jobGrade,
                (JSON_EXTRACT(charinfo, '$.gender') = 0) AS isMale
            FROM players
        ]],
        peopleCount = "SELECT COUNT(1) FROM players",
        peopleWhere = "WHERE CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')), ' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) LIKE @query",
        peopleByNumberWhere = "WHERE citizenid IN (SELECT `owner` COLLATE utf8mb4_general_ci FROM phone_phones WHERE phone_number LIKE @query)",
        vehicles = [[
            SELECT 
                v.plate,
                v.mods AS vehicle,
                v.citizenid AS identifier,
                CONCAT(JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.firstname')), ' ', JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.lastname'))) AS `owner`
            FROM
                player_vehicles v
            LEFT JOIN
                players p
            ON
                p.citizenid = v.citizenid
            WHERE
                v.plate LIKE @query
        ]],
        vehicleCount = "SELECT COUNT(1) FROM player_vehicles WHERE plate LIKE @query"
    }
}
