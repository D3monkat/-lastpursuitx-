CREATE TABLE IF NOT EXISTS `allowlist_requests` (
	`identifier` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	`request_id` INT(11) NOT NULL,
	`date` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `identifier` (`identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
