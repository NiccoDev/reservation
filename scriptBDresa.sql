SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `reservation` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `reservation`;

DROP TABLE IF EXISTS `chambres`;
CREATE TABLE IF NOT EXISTS `chambres` (
  `chbre_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `couchage` smallint(6) NOT NULL,
  `tarif` decimal(10,2) NOT NULL,
  PRIMARY KEY (`chbre_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `chambres` (`chbre_id`, `hotel_id`, `couchage`, `tarif`) VALUES
(2, 3, 3, '91.00'),
(3, 1, 2, '144.00'),
(4, 1, 3, '102.00'),
(5, 3, 4, '67.00'),
(6, 1, 3, '127.00'),
(7, 2, 3, '127.00'),
(8, 3, 5, '150.00'),
(9, 1, 6, '53.00'),
(10, 3, 1, '54.00'),
(11, 2, 3, '57.00'),
(12, 3, 3, '65.00'),
(13, 1, 5, '92.00'),
(14, 1, 5, '72.00'),
(15, 3, 1, '63.00'),
(16, 3, 3, '127.00'),
(17, 2, 5, '58.00'),
(18, 3, 3, '73.00'),
(19, 2, 1, '118.00'),
(20, 1, 3, '140.00'),
(21, 2, 2, '147.00'),
(22, 1, 1, '112.00'),
(23, 3, 4, '92.00'),
(24, 1, 6, '75.00'),
(25, 3, 5, '50.00'),
(26, 2, 3, '68.00'),
(27, 3, 6, '97.00'),
(28, 1, 3, '83.00'),
(29, 3, 4, '144.00'),
(30, 1, 6, '130.00'),
(31, 3, 1, '128.00');

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chbr_id` int(11) NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chbr_id` (`chbr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code_postal` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `hotel` (`hotel_id`, `nom`, `adresse`, `code_postal`, `ville`) VALUES
(1, 'Hôtel du Nord', '4 rue de Dunkerque', '75010', 'PARIS'),
(2, 'Hôtel du Sud', '4 rue d\'Aix en Provence', '75010', 'PARIS'),
(3, 'Hôtel de l\'Ouest', '4 rue du Roc St André', '75010', 'PARIS');


ALTER TABLE `chambres`
  ADD CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`chbr_id`) REFERENCES `chambres` (`chbre_id`);
