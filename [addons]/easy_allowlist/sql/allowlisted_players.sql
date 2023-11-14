CREATE TABLE IF NOT EXISTS `allowlisted_players` (
	`identifier` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`date` INT(10) UNSIGNED NOT NULL,
	`last_join` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
