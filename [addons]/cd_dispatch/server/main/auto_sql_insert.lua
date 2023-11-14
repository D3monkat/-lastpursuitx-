if Config.AutoInsertSQL then

    function InsertSQL()
        print('^5----------------------------^0')
        print('^5Automatically Inserting SQL.^0')
        print('^5----------------------------^0')
        DatabaseQuery('CREATE TABLE IF NOT EXISTS `cd_dispatch` (`identifier` VARCHAR(50) NULL DEFAULT NULL, `callsign` VARCHAR(100) NULL DEFAULT NULL);')
        print('^5--------------------------^0')
        print('^5SQL Inserted Successfully.^0')
        print('^5--------------------------^0')
    end

end