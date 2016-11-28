-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 22, 2016 at 01:52 PM
-- Server version: 5.5.53-0+deb8u1
-- PHP Version: 5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecole`
--

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
`IdClasse` int(11) NOT NULL,
  `Libelle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eleve`
--

CREATE TABLE IF NOT EXISTS `eleve` (
`NumEleve` int(11) NOT NULL,
  `PrenomEleve` varchar(25) NOT NULL,
  `NomEleve` varchar(25) NOT NULL,
  `DateNaissance` date NOT NULL,
  `Sexe` enum('Masculin','Feminin','','') NOT NULL,
  `IdClasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
`Code` int(11) NOT NULL,
  `Libelle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
`NumNote` int(11) NOT NULL,
  `ValeurNote` float NOT NULL,
  `Date` date NOT NULL,
  `IdMatiere` int(11) NOT NULL,
  `IdEleve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE IF NOT EXISTS `professeur` (
`NumProf` int(11) NOT NULL,
  `NomProf` varchar(25) NOT NULL,
  `PrenomProf` varchar(25) NOT NULL,
  `AdresseProf` varchar(25) NOT NULL,
  `DepartementProf` int(11) NOT NULL,
  `DateEntreeProf` date NOT NULL,
  `NumeroTelProf` varchar(25) NOT NULL,
  `AgeProf` int(4) DEFAULT NULL,
  `Classe` int(11) NOT NULL,
  `DateNaissanceProf` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `responsable`
--

CREATE TABLE IF NOT EXISTS `responsable` (
`NumResponsable` int(11) NOT NULL,
  `NomResponsable` varchar(25) NOT NULL,
  `PrenomResponsable` varchar(25) NOT NULL,
  `TelResponsable` varchar(25) NOT NULL,
  `NumEleve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
 ADD PRIMARY KEY (`IdClasse`);

--
-- Indexes for table `eleve`
--
ALTER TABLE `eleve`
 ADD PRIMARY KEY (`NumEleve`), ADD KEY `fk_IdClasse` (`IdClasse`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
 ADD PRIMARY KEY (`NumNote`), ADD KEY `fk_IdMatiere` (`IdMatiere`), ADD KEY `fk_IdEleve` (`IdEleve`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
 ADD PRIMARY KEY (`NumProf`), ADD KEY `fk_Classe` (`Classe`);

--
-- Indexes for table `responsable`
--
ALTER TABLE `responsable`
 ADD PRIMARY KEY (`NumResponsable`), ADD KEY `fk_NumEleve` (`NumEleve`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
MODIFY `IdClasse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eleve`
--
ALTER TABLE `eleve`
MODIFY `NumEleve` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
MODIFY `Code` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
MODIFY `NumNote` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
MODIFY `NumProf` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `responsable`
--
ALTER TABLE `responsable`
MODIFY `NumResponsable` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `eleve`
--
ALTER TABLE `eleve`
ADD CONSTRAINT `fk_IdClasse` FOREIGN KEY (`IdClasse`) REFERENCES `classe` (`IdClasse`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
ADD CONSTRAINT `fk_IdEleve` FOREIGN KEY (`IdEleve`) REFERENCES `eleve` (`NumEleve`),
ADD CONSTRAINT `fk_IdMatiere` FOREIGN KEY (`IdMatiere`) REFERENCES `matiere` (`Code`);

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
ADD CONSTRAINT `fk_Classe` FOREIGN KEY (`Classe`) REFERENCES `classe` (`IdClasse`);

--
-- Constraints for table `responsable`
--
ALTER TABLE `responsable`
ADD CONSTRAINT `fk_NumEleve` FOREIGN KEY (`NumEleve`) REFERENCES `eleve` (`NumEleve`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
