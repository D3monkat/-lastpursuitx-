CREATE TABLE IF NOT EXISTS `players_external_informations` (
	`identifier` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`player_name` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`identifiers` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`discord_data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`steam_data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
