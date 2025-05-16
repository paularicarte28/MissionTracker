-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.7.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para mission tracker
CREATE DATABASE IF NOT EXISTS `missiontracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `mission tracker`;

-- Volcando estructura para tabla mission tracker.astronaut
CREATE TABLE IF NOT EXISTS `astronaut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `mission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mission_id` (`mission_id`),
  CONSTRAINT `astronaut_ibfk_1` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla mission tracker.astronaut: ~6 rows (aproximadamente)
INSERT INTO `astronaut` (`id`, `name`, `nationality`, `role`, `mission_id`) VALUES
	(1, 'Neil Armstrong', 'United States', 'Commander', 1),
	(2, 'Yuri Gagarin', 'Russia', 'Pilot', NULL),
	(3, 'Sunita Williams', 'United States', 'Mission Specialist', 4),
	(4, 'Charles Bolden', 'United States', 'Program Director', 5),
	(5, 'Christina Koch', 'United States', 'Lunar Surface Commander', 6),
	(6, 'Victor Glover', 'United States', 'Pilot', 6);

-- Volcando estructura para tabla mission tracker.mission
CREATE TABLE IF NOT EXISTS `mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `launch_date` date NOT NULL,
  `objective` text DEFAULT NULL,
  `status` enum('planned','active','completed','cancelled') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla mission tracker.mission: ~6 rows (aproximadamente)
INSERT INTO `mission` (`id`, `name`, `launch_date`, `objective`, `status`) VALUES
	(1, 'Apollo 11', '1969-07-16', 'Moon landing', 'completed'),
	(2, 'Mars Odyssey', '2001-04-07', 'Mars orbital survey', 'completed'),
	(3, 'Voyager 1', '1977-08-05', 'Interstellar exploration', 'active'),
	(4, 'Artemis I', '2022-08-29', 'Lunar test flight', 'completed'),
	(5, 'Constellation Program', '2005-01-14', 'Develop technologies for human missions to Moon and Mars', 'cancelled'),
	(6, 'Artemis III', '2026-09-01', 'First crewed lunar landing mission of the Artemis program', 'planned');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
