function InsertSQL()
    if Config.AutoInsertSQL then
        print('^5----------------------------^0')
        print('^5Automatically Inserting SQL.^0')
        if Config.Framework == 'esx' then
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS in_garage TINYINT(1) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS garage_id VARCHAR(50) NULL DEFAULT "A";')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS garage_type VARCHAR(50) NULL DEFAULT "car";')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS job_personalowned VARCHAR(50) NULL DEFAULT "";')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS property INT(10) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS impound INT(10) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS impound_data LONGTEXT NULL DEFAULT \'\';')
            DatabaseQuery('ALTER TABLE owned_vehicles ADD COLUMN IF NOT EXISTS adv_stats LONGTEXT NULL DEFAULT \'{"plate":"nil","mileage":0.0,"maxhealth":1000.0}\';')
            DatabaseQuery('ALTER TABLE users ADD COLUMN IF NOT EXISTS garage_limit INT(10) NULL DEFAULT 7;')
        elseif Config.Framework == 'qbcore' then
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS in_garage TINYINT(1) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS garage_id VARCHAR(50) NULL DEFAULT "A";')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS garage_type VARCHAR(50) NULL DEFAULT "car";')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS job_personalowned VARCHAR(50) NULL DEFAULT "";')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS property INT(10) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS impound INT(10) NULL DEFAULT 0;')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS impound_data LONGTEXT NULL DEFAULT \'\';')
            DatabaseQuery('ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS adv_stats LONGTEXT NULL DEFAULT \'{"plate":"nil","mileage":0.0,"maxhealth":1000.0}\';')
            DatabaseQuery('ALTER TABLE players ADD COLUMN IF NOT EXISTS garage_limit INT(10) NULL DEFAULT 7;')
        end
        DatabaseQuery('CREATE TABLE IF NOT EXISTS cd_garage_keys (plate VARCHAR(8) NOT NULL, owner_identifier VARCHAR(50) NOT NULL, reciever_identifier VARCHAR(50) NOT NULL, char_name VARCHAR(50) NOT NULL) COLLATE=\'utf8mb4_bin\' ENGINE=InnoDB;')
        DatabaseQuery('CREATE TABLE IF NOT EXISTS cd_garage_privategarage (identifier VARCHAR(50) NOT NULL, data LONGTEXT NOT NULL) COLLATE=\'utf8mb4_bin\' ENGINE=InnoDB;')
        print('^5SQL Inserted Successfully.^0')
        print('^5--------------------------^0')
    end
    local database_name = DatabaseQuery('SELECT database()')[1]['database()']
    local garage_id_column = DatabaseQuery('SELECT column_default FROM information_schema.columns WHERE table_schema = "'..database_name..'" AND (table_name = "'..Config.FrameworkSQLtables.vehicle_table..'" AND column_name = "garage_id");')[1]
    garage_id_column = garage_id_column.column_default or garage_id_column.COLUMN_DEFAULT
    garage_id_column = garage_id_column:gsub("%'", "")
    if garage_id_column ~= Config.Locations[1].Garage_ID then        
        DatabaseQuery('ALTER TABLE '..Config.FrameworkSQLtables.vehicle_table..' ALTER garage_id SET DEFAULT("'..Config.Locations[1].Garage_ID..'");')
        DatabaseQuery('UPDATE '..Config.FrameworkSQLtables.vehicle_table..' SET garage_id="'..Config.Locations[1].Garage_ID..'" WHERE garage_id="'..garage_id_column..'";')
        print(string.format('^5Automatically changing ['..Config.FrameworkSQLtables.vehicle_table..'.garage_id] default_value from ^2[%s]^0 ^5to^0 ^2[%s]^0.', garage_id_column, Config.Locations[1].Garage_ID))
    end
end