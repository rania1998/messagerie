-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 18 nov. 2021 à 18:22
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `messagerie-db`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_datetime` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FKh4c7lvsc298whoyd4w9ta25cr` (`post_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`comment_id`, `created_datetime`, `text`, `post_id`, `user_id`) VALUES
(2, '2021-11-08 01:00:02', 'Test comment', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approved` bit(1) NOT NULL,
  `request_datetime` varchar(255) NOT NULL,
  `from_user` bigint(20) NOT NULL,
  `to_user` bigint(20) NOT NULL,
  `bloqued` bit(1) NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `FK19ctftj1yif2ege7dh3pibao2` (`from_user`),
  KEY `FK2ww58q5w3modyspsmutrx1gti` (`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `friend_requests`
--

INSERT INTO `friend_requests` (`request_id`, `approved`, `request_datetime`, `from_user`, `to_user`, `bloqued`) VALUES
(1, b'0', '2021-02-02 12:00:00', 2, 1, b'0'),
(7, b'0', '2021-11-11 21:56:10', 1, 3, b'0'),
(8, b'0', '2021-11-13 16:38:23', 1, 10, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `photo_url`) VALUES
(2, 'Hello Group', 'https://cdn3.vectorstock.com/i/1000x1000/24/27/people-group-avatar-character-vector-12392427.jpg'),
(3, 'Hello Group', 'https://cdn3.vectorstock.com/i/1000x1000/24/27/people-group-avatar-character-vector-12392427.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
CREATE TABLE IF NOT EXISTS `group_users` (
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `FK6syyopfepdpec1ihe2v5klehr` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `group_users`
--

INSERT INTO `group_users` (`group_id`, `user_id`) VALUES
(3, 1),
(2, 2),
(3, 2),
(3, 3),
(3, 4),
(2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_datetime` varchar(255) NOT NULL,
  `emotion` enum('Happy','In_Love','Lucky','Sad','Grateful','Crazy','Cool','Relax','Tired','Proud') DEFAULT NULL,
  `visibility` enum('Public','Private') NOT NULL DEFAULT 'Public',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`post_id`, `content`, `created_datetime`, `emotion`, `visibility`, `user_id`) VALUES
(6, 'Bien :) ', '2021-11-08 00:33:14', NULL, 'Public', 1),
(7, 'kkkk', '2021-11-08 04:25:39', NULL, 'Public', 1),
(8, 'hahaha !', '2021-11-13 21:05:14', 'Crazy', 'Public', 2);

-- --------------------------------------------------------

--
-- Structure de la table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
CREATE TABLE IF NOT EXISTS `reactions` (
  `reaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reaction_type` enum('Like','Love','Haha','Wow','Sad','Angry') NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reaction_id`),
  KEY `FKh8b4h9wybhu8tc5w11e8t3krc` (`post_id`),
  KEY `FKqmewaibcp5bxtlqxc2cawhuln` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reactions`
--

INSERT INTO `reactions` (`reaction_id`, `reaction_type`, `post_id`, `user_id`) VALUES
(2, 'Like', 6, 1),
(3, 'Like', 6, 6),
(4, 'Love', 6, 3),
(7, 'Love', 7, 1),
(8, 'Haha', 7, 8);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `login`, `password`, `photo_url`) VALUES
(1, 'Fahmi BEN SALAH', 'Fahmi', 'Fahmi', 'https://media.istockphoto.com/vectors/faces-avatars-icons-user-avatar-customer-service-icon-business-avatar-vector-id1126551708'),
(2, 'Ibtissem ALOUI', 'Ibtissem', 'Ibtissem', 'https://assets.tokko.io/864c7ba5-a065-4c97-9d03-fae9fc5ef20e/products/images/d3a7e84c-1897-45b9-b659-71333652ba62'),
(3, 'Nourhene ALOUI', 'Nourhene', 'Nourhene', 'https://avatarfiles.alphacoders.com/146/thumb-1920-146420.jpg'),
(4, 'Amani BEN SALAH', 'Amani', 'Amani', 'https://t3.ftcdn.net/jpg/02/45/34/90/360_F_245349044_TMxmWxPpnSzeuauvvQnuFe03ueXgS57m.jpg'),
(5, 'Anderson Brown', 'Anderson', 'Brown', 'https://i.pinimg.com/736x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg'),
(6, 'Clark Cooper', 'Clark ', 'Cooper', 'https://i.pinimg.com/736x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg'),
(7, 'Evans Garcia', 'Evans', 'Garcia', 'https://i.pinimg.com/736x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg'),
(8, 'Lauren Michelle', 'Lauren', 'Michelle', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqmn8-9Vb7FEOLeMEvW6DoLoRyMBP8joLEbg&usqp=CAU'),
(9, 'Elizabeth Lauren', 'Elizabeth', 'Lauren', 'https://img.favpng.com/9/11/11/female-youtube-in-my-frame-of-mind-png-favpng-Wpe5ge4QB7Wm1vJ6jG5zr1man.jpg'),
(10, 'Olivia Mia', 'Olivia', 'Mia', 'https://img.favpng.com/9/11/11/female-youtube-in-my-frame-of-mind-png-favpng-Wpe5ge4QB7Wm1vJ6jG5zr1man.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user_relationships`
--

DROP TABLE IF EXISTS `user_relationships`;
CREATE TABLE IF NOT EXISTS `user_relationships` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation_datetime` datetime NOT NULL,
  `relation_type` enum('Pending','Friends','Block') NOT NULL,
  `from_user` bigint(20) NOT NULL,
  `to_user` bigint(20) NOT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `FK3wgcgvweps8cg0mg47vw8lunl` (`from_user`),
  KEY `FKkpcmffk31uxi04tnwgrgbty8w` (`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_relationships`
--

INSERT INTO `user_relationships` (`relation_id`, `relation_datetime`, `relation_type`, `from_user`, `to_user`) VALUES
(4, '2021-11-25 00:00:00', 'Friends', 2, 4),
(5, '2021-11-13 17:05:08', 'Pending', 1, 7),
(6, '2021-11-13 17:05:46', 'Pending', 1, 9),
(7, '2021-11-20 00:00:00', 'Friends', 1, 10),
(9, '2021-11-14 17:57:30', 'Friends', 1, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKh4c7lvsc298whoyd4w9ta25cr` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Contraintes pour la table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `FK19ctftj1yif2ege7dh3pibao2` FOREIGN KEY (`from_user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK2ww58q5w3modyspsmutrx1gti` FOREIGN KEY (`to_user`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `group_users`
--
ALTER TABLE `group_users`
  ADD CONSTRAINT `FK1tqlbnvol79qrsa1i4rmjfsi6` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  ADD CONSTRAINT `FK6syyopfepdpec1ihe2v5klehr` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `FKh8b4h9wybhu8tc5w11e8t3krc` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `FKqmewaibcp5bxtlqxc2cawhuln` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `user_relationships`
--
ALTER TABLE `user_relationships`
  ADD CONSTRAINT `FK3wgcgvweps8cg0mg47vw8lunl` FOREIGN KEY (`from_user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKkpcmffk31uxi04tnwgrgbty8w` FOREIGN KEY (`to_user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
