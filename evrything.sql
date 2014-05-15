-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 15 Mai 2014 à 11:11
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `evrything`
--
CREATE DATABASE IF NOT EXISTS `evrything` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `evrything`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taille` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publication` tinyint(1) NOT NULL,
  `nbCommentaire` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD8737FAA76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `date`, `titre`, `taille`, `image`, `contenu`, `publication`, `nbCommentaire`, `user_id`) VALUES
(1, '2014-05-08 10:11:00', 'Coucou les enfants!!!!', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 5, 1),
(2, '2014-02-04 20:05:21', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(3, '2014-02-04 20:11:27', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(4, '2014-02-04 20:13:37', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(5, '2014-02-04 20:15:25', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(6, '2014-02-04 20:45:03', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(7, '2014-02-07 16:45:31', 'actualités', 'grand', 'bundles/evrythingblog/images/wei2013.jpg', 'C''était vraiment super et on s''est bien amusé.', 1, 0, 1),
(8, '2014-02-07 16:55:55', 'actualités', 'petitG', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 0, 1),
(9, '2014-02-07 16:56:30', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 0, 1),
(11, '2014-02-13 15:19:45', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 0, 1),
(12, '2014-02-14 08:39:07', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 0, 1),
(13, '2014-04-10 15:04:45', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 2, 1),
(14, '2014-05-08 10:12:13', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 2, 1),
(15, '2014-05-08 10:13:26', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 2, 1),
(19, '2014-05-10 18:37:43', 'actualités', 'petitD', 'bundles/evrythingblog/images/wei2013.jpg', 'swaaaaaaaaaaaggggggggggg!!!!!!', 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `article_id` int(11) NOT NULL,
  `evenement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E16CE76B7294869C` (`article_id`),
  KEY `IDX_E16CE76BFD02F13` (`evenement_id`),
  KEY `IDX_E16CE76BA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `dossier` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_211FE820A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `corp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `participe` tinyint(1) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_89D7EABD60BB6FE6` (`auteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL,
  `droit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `mail`, `login`, `pwd`, `telephone`, `droit`) VALUES
(1, 'Bodilis', 'Damien', 'damien.bodilis@gmail.com', 'damienbodilis', 'EvryThing,BDE91', 670285080, 2);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_CD8737FAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_E16CE76B7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_E16CE76BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E16CE76BFD02F13` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_211FE820A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_89D7EABD60BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
