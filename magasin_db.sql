-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2026 at 12:20 PM
-- Server version: 8.0.44
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magasin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `limite_credit` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `prenom`, `nom`, `tel`, `adresse`, `limite_credit`, `created_at`) VALUES
(2, 2, 'lahcen', 'fff', '066666', 'casablanca', 1000.00, '2026-05-05 16:18:19'),
(3, 3, 'test', 'test', '22222222222', 'fes', 2000.00, '2026-05-06 00:57:54'),
(5, 4, 'client1', 'client1', '06666666666', 'casablanca', 2000.00, '2026-05-13 16:21:41'),
(6, 6, 'amine', 'aroub', '0687620988', 'casablanca', 1000.00, '2026-05-15 09:05:11'),
(7, 6, 'youssef', 'younessi', '0662889615', 'Rabat', 2000.00, '2026-05-15 09:06:25'),
(8, 6, 'khalid', 'ziyad', '0679154289', 'casablanca', 2000.00, '2026-05-15 09:07:23');

-- --------------------------------------------------------

--
-- Table structure for table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `nom` varchar(150) NOT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `user_id`, `nom`, `ville`, `tel`, `email`, `notes`, `created_at`) VALUES
(1, 2, 'four1', 'Rabat', '0488888888888', 'fr@gmail.com', 'tes ehehc echechec ecechceyueic w w oow w  wueiee ', '2026-05-06 00:41:49'),
(2, 4, 'fourn1', 'Casablanca', '0666666666', 'fourn1@gmail.com', 'test', '2026-05-13 16:23:05'),
(3, 6, 'societe de lait', 'Casablanca', '0500152893', 'societeLait@gmail.com', NULL, '2026-05-15 09:12:52'),
(4, 6, 'Cosumar', 'Rabat', '0520165312', 'cosumar@gmail.com', NULL, '2026-05-15 09:18:53'),
(5, 6, 'Sidi Ali', 'Tanger', '0506598222', 'SidiAli@gmail.com', NULL, '2026-05-15 09:22:56'),
(6, 6, 'Itkane', 'Casablanca', '0564897215', 'itkane@gmail.com', NULL, '2026-05-15 09:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `lignes_vente`
--

CREATE TABLE `lignes_vente` (
  `id` int UNSIGNED NOT NULL,
  `vente_id` int UNSIGNED NOT NULL,
  `produit_id` int UNSIGNED NOT NULL,
  `quantite` int UNSIGNED NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `sous_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lignes_vente`
--

INSERT INTO `lignes_vente` (`id`, `vente_id`, `produit_id`, `quantite`, `prix_unitaire`, `sous_total`) VALUES
(1, 1, 1, 1, 20.00, 20.00),
(3, 3, 2, 5, 200.00, 1000.00),
(4, 4, 2, 1, 200.00, 200.00),
(5, 5, 2, 2, 200.00, 400.00),
(6, 6, 2, 1, 200.00, 200.00),
(7, 7, 5, 11, 5.00, 55.00),
(8, 8, 4, 10, 10.00, 100.00),
(9, 8, 5, 2, 5.00, 10.00),
(10, 9, 3, 1, 5.00, 5.00),
(11, 10, 4, 13, 10.00, 130.00),
(12, 10, 3, 10, 5.00, 50.00),
(13, 11, 6, 6, 100.00, 600.00);

-- --------------------------------------------------------

--
-- Table structure for table `livraisons`
--

CREATE TABLE `livraisons` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `fournisseur_id` int UNSIGNED NOT NULL,
  `produit_id` int UNSIGNED NOT NULL,
  `date_livraison` date NOT NULL,
  `quantite` int UNSIGNED NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `montant_paye` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `echeance` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `livraisons`
--

INSERT INTO `livraisons` (`id`, `user_id`, `fournisseur_id`, `produit_id`, `date_livraison`, `quantite`, `prix_unitaire`, `total`, `montant_paye`, `credit`, `echeance`, `created_at`) VALUES
(1, 2, 1, 1, '2026-05-07', 1, 10.00, 10.00, 10.00, 0.00, NULL, '2026-05-07 01:26:14'),
(3, 2, 1, 1, '2026-05-09', 1, 20.00, 20.00, 10.00, 10.00, '2026-05-19', '2026-05-09 18:15:53'),
(4, 4, 2, 2, '2026-05-13', 8, 200.00, 1600.00, 1000.00, 600.00, '2026-05-25', '2026-05-13 16:30:57'),
(5, 4, 2, 2, '2026-05-13', 2, 200.00, 400.00, 400.00, 0.00, '2026-05-23', '2026-05-13 19:59:37'),
(6, 6, 4, 4, '2026-05-15', 100, 10.00, 1000.00, 500.00, 500.00, '2026-05-18', '2026-05-15 09:29:09'),
(7, 6, 3, 3, '2026-05-15', 20, 5.00, 100.00, 100.00, 0.00, NULL, '2026-05-15 09:31:39'),
(8, 6, 6, 6, '2026-05-15', 20, 100.00, 2000.00, 1000.00, 1000.00, '2026-05-10', '2026-05-15 09:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `fournisseur_id` int UNSIGNED DEFAULT NULL,
  `nom` varchar(150) NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `seuil_alerte` int DEFAULT '0',
  `unite` varchar(30) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `user_id`, `fournisseur_id`, `nom`, `prix_unitaire`, `stock`, `seuil_alerte`, `unite`, `description`, `created_at`) VALUES
(1, 2, 1, '3sal', 20.00, 11, 3, 'Kg', 'heheheh', '2026-05-06 00:52:23'),
(2, 4, 2, 'produit1', 200.00, 11, 3, 'Kg', 'hehhhhhh', '2026-05-13 16:24:05'),
(3, 6, 3, 'Lait', 5.00, 29, 5, 'Bouteille', NULL, '2026-05-15 09:16:02'),
(4, 6, 4, 'sucre', 10.00, 177, 20, 'Pièce', NULL, '2026-05-15 09:20:35'),
(5, 6, 5, 'Eau minrale 1L', 5.00, 17, 20, 'Bouteille', NULL, '2026-05-15 09:24:35'),
(6, 6, 6, 'Farine (25kg)', 100.00, 44, 10, 'Sac', NULL, '2026-05-15 09:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shop_name` varchar(150) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `prenom`, `nom`, `email`, `password`, `shop_name`, `city`, `created_at`) VALUES
(2, 'lahcen2', 'ttt', 'lahc@gmail.com', '$2b$10$XO2C2MIVeOE/6aiq.WE7i.JTsEIVqWvATFGQd2oEblm70hqbx2odq', 'maasin2', 'Kenitra', '2026-05-05 12:22:57'),
(3, 'lahcen3', 'houu', 'lahcen3@gmail.com', '$2b$10$jNyw.9tx.JnwXPpI/QUTMOXd1sQ//Ki5MPWQiVzEO08pFC5AwGPte', 'magasin_lh', 'Meknès', '2026-05-06 00:57:04'),
(4, 'houban', 'houban01', 'houban@gmail.com', '$2b$10$6Kk/ZJJu/r1uo0tYr4RyG.evGcN22.0T3IfqxwSc4JFFwWyvsY3mO', 'testtest', 'Casablanca', '2026-05-13 16:19:11'),
(5, 'test', 'test', 'smail@gmail.com', '$2b$10$RZRNpb5gBiEPcIlb5Nzd7uhyWlFAq/tSm01rsJQjajIIVKXe3iPfG', 'magasin', 'Oujda', '2026-05-13 17:01:29'),
(6, 'lahcen', 'houban', 'lahcen@gmail.com', '$2b$10$rtyQTkRLP52fxuKcRg3Jgu1rM8HkT5hjhU1mthRXVYD02bMN6Z74O', 'magasin casa', 'Casablanca', '2026-05-15 08:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `ventes`
--

CREATE TABLE `ventes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED DEFAULT NULL,
  `date_vente` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `montant_paye` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `mode_paiement` enum('comptant','partiel','credit') NOT NULL,
  `echeance` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventes`
--

INSERT INTO `ventes` (`id`, `user_id`, `client_id`, `date_vente`, `total`, `montant_paye`, `credit`, `mode_paiement`, `echeance`, `created_at`) VALUES
(1, 2, 2, '2026-05-07', 20.00, 10.00, 10.00, 'partiel', '2026-05-10', '2026-05-07 00:05:13'),
(3, 4, 5, '2026-05-13', 1000.00, 1000.00, 0.00, 'partiel', '2026-05-19', '2026-05-13 17:06:58'),
(4, 4, NULL, '2026-05-13', 200.00, 200.00, 0.00, 'partiel', '2026-05-26', '2026-05-13 17:22:44'),
(5, 4, 5, '2026-05-14', 400.00, 400.00, 0.00, 'credit', '2026-05-26', '2026-05-14 22:38:05'),
(6, 4, 5, '2026-05-14', 200.00, 20.00, 180.00, 'partiel', '2026-05-13', '2026-05-14 23:09:15'),
(7, 6, 8, '2026-05-15', 55.00, 30.00, 25.00, 'partiel', '2026-05-16', '2026-05-15 09:33:51'),
(8, 6, 8, '2026-05-15', 110.00, 47.00, 63.00, 'partiel', '2026-05-10', '2026-05-15 09:38:33'),
(9, 6, 7, '2026-05-15', 5.00, 5.00, 0.00, 'comptant', NULL, '2026-05-15 09:39:35'),
(10, 6, 6, '2026-05-15', 180.00, 180.00, 0.00, 'credit', '2026-05-13', '2026-05-15 09:40:57'),
(11, 6, 7, '2026-05-15', 600.00, 500.00, 100.00, 'partiel', '2026-05-26', '2026-05-15 09:51:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lignes_vente`
--
ALTER TABLE `lignes_vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vente_id` (`vente_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Indexes for table `livraisons`
--
ALTER TABLE `livraisons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lignes_vente`
--
ALTER TABLE `lignes_vente`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `livraisons`
--
ALTER TABLE `livraisons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD CONSTRAINT `fournisseurs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lignes_vente`
--
ALTER TABLE `lignes_vente`
  ADD CONSTRAINT `lignes_vente_ibfk_1` FOREIGN KEY (`vente_id`) REFERENCES `ventes` (`id`),
  ADD CONSTRAINT `lignes_vente_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Constraints for table `livraisons`
--
ALTER TABLE `livraisons`
  ADD CONSTRAINT `livraisons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `livraisons_ibfk_2` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`),
  ADD CONSTRAINT `livraisons_ibfk_3` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`);

--
-- Constraints for table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
