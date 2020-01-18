-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- Used for login/signup
-- ---

DROP TABLE IF EXISTS `user`;
		
CREATE TABLE `user` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `full_name` VARCHAR(120) NULL DEFAULT NULL,
  `email` VARCHAR(120) NULL DEFAULT NULL,
  `password_hash` VARCHAR(128) NULL DEFAULT NULL,
  `last_seen` DATETIME NULL DEFAULT 'datetime.utcnow()',
  PRIMARY KEY (`id`)
) COMMENT 'Used for login/signup';

-- ---
-- Table 'livestream'
-- To record livestream data
-- ---

DROP TABLE IF EXISTS `livestream`;
		
CREATE TABLE `livestream` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `internal_ip` VARCHAR(20) NULL DEFAULT NULL,
  `configuration_type` VARCHAR(10) NULL DEFAULT 'default',
  `configuration_name` VARCHAR(100) NULL DEFAULT NULL,
  `id_user` INTEGER NULL DEFAULT NULL,
  `id_configuration` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'To record livestream data';

-- ---
-- Table 'configuration'
-- Saving all user configurations here
-- ---

DROP TABLE IF EXISTS `configuration`;
		
CREATE TABLE `configuration` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `type` VARCHAR(10) NULL DEFAULT NULL,
  `services` VARCHAR(200) NULL DEFAULT 'motion',
  `livestream_connected` INTEGER NULL DEFAULT NULL,
  `id_user` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Saving all user configurations here';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `livestream` ADD FOREIGN KEY (id_user) REFERENCES `user` (`id`);
ALTER TABLE `livestream` ADD FOREIGN KEY (id_configuration) REFERENCES `configuration` (`id`);
ALTER TABLE `configuration` ADD FOREIGN KEY (id_user) REFERENCES `user` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `livestream` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `configuration` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`id`,`full_name`,`email`,`password_hash`,`last_seen`) VALUES
-- ('','','','','');
-- INSERT INTO `livestream` (`id`,`internal_ip`,`configuration_type`,`configuration_name`,`id_user`,`id_configuration`) VALUES
-- ('','','','','','');
-- INSERT INTO `configuration` (`id`,`name`,`description`,`type`,`services`,`livestream_connected`,`id_user`) VALUES
-- ('','','','','','','');
