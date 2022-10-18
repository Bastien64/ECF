-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 26 sep. 2022 à 09:18
-- Version du serveur : 8.0.30-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecf`
--

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

CREATE TABLE `boutique` (
  `id` int NOT NULL,
  `ville` int NOT NULL,
  `adresseboutique` varchar(200) NOT NULL,
  `mailresponsable` varchar(250) NOT NULL,
  `envoyeremail` int NOT NULL,
  `fleurspeciale` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`id`, `ville`, `adresseboutique`, `mailresponsable`, `envoyeremail`, `fleurspeciale`) VALUES
(36, 35, '03 rue de Framboise', 'robert@gmail.com', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `envoyerdesemails`
--

CREATE TABLE `envoyerdesemails` (
  `id` int NOT NULL,
  `typededroit` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `envoyerdesemails`
--

INSERT INTO `envoyerdesemails` (`id`, `typededroit`, `description`) VALUES
(1, 'Classique', 'L\'utilisateur peut envoyer 500 emails'),
(2, 'Prenium', 'L\'utilisateur peut envoyer 2000 emails.');

-- --------------------------------------------------------

--
-- Structure de la table `fleurspecial`
--

CREATE TABLE `fleurspecial` (
  `id` int NOT NULL,
  `typededroit` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fleurspecial`
--

INSERT INTO `fleurspecial` (`id`, `typededroit`, `description`) VALUES
(1, 'Toutes fleurs', 'La boutique peut avoir toutes les fleurs disponibles.'),
(2, 'Fleur d\'importation', 'Les fleurs d\'importation sont interdites');

-- --------------------------------------------------------

--
-- Structure de la table `franchise`
--

CREATE TABLE `franchise` (
  `id` int NOT NULL,
  `ville` varchar(100) NOT NULL,
  `statut` text NOT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mdp` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `franchise`
--

INSERT INTO `franchise` (`id`, `ville`, `statut`, `email`, `mdp`) VALUES
(35, 'Lyon', 'Close', 'adminrobert@gmail.com', '$2y$10$nSqDBmtHLC6R/lbHQEXDnORGKH7TdoZMJwDUo/Hm.cLpsz0lPdvla');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `nom_utilisateur` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`nom_utilisateur`, `mot_de_passe`) VALUES
('admin', 'qwerty');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boutique_ibfk_1` (`envoyeremail`),
  ADD KEY `boutique_ibfk_2` (`fleurspeciale`),
  ADD KEY `boutique_ibfk_3` (`ville`);

--
-- Index pour la table `envoyerdesemails`
--
ALTER TABLE `envoyerdesemails`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fleurspecial`
--
ALTER TABLE `fleurspecial`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `franchise`
--
ALTER TABLE `franchise`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boutique`
--
ALTER TABLE `boutique`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `envoyerdesemails`
--
ALTER TABLE `envoyerdesemails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `fleurspecial`
--
ALTER TABLE `fleurspecial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `franchise`
--
ALTER TABLE `franchise`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD CONSTRAINT `boutique_ibfk_1` FOREIGN KEY (`envoyeremail`) REFERENCES `envoyerdesemails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boutique_ibfk_2` FOREIGN KEY (`fleurspeciale`) REFERENCES `fleurspecial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boutique_ibfk_3` FOREIGN KEY (`ville`) REFERENCES `franchise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
