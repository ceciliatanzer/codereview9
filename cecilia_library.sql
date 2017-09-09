-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Sep 2017 um 20:32
-- Server-Version: 10.1.26-MariaDB
-- PHP-Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cecilia_library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `titel` varchar(60) DEFAULT NULL,
  `author` varchar(60) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photoLink` varchar(200) DEFAULT NULL,
  `genre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`ISBN`, `titel`, `author`, `status`, `description`, `photoLink`, `genre`) VALUES
(1234567891, 'Lord of the rings', '	J. R. R. Tolkien', 'available', '', 'https://upload.wikimedia.org/wikipedia/en/e/e9/First_Single_Volume_Edition_of_The_Lord_of_the_Rings.gif', 'fantasy'),
(1234567892, 'Angels & Demons', 'Dan Brown', 'available', NULL, 'https://upload.wikimedia.org/wikipedia/en/5/5f/AngelsAndDemons.jpg', ' mystery-thriller novel'),
(1234567893, 'Harry Potter and the Prisoner of Azkaban', 'J. K. Rowling', 'not available', NULL, 'https://upload.wikimedia.org/wikipedia/en/a/a0/Harry_Potter_and_the_Prisoner_of_Azkaban.jpg', '	Fantasy'),
(1234567894, 'Interview with the Vampire', 'Anne Rice', 'not available', NULL, 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e8/InterviewWithTheVampire.jpg/330px-InterviewWithTheVampire.jpg', 'debut gothic horror and vampire novel '),
(1234567895, 'Notes from Underground', 'Fyodor Dostoyevsky', 'available', NULL, 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Notes_from_underground_cover.jpg', 'existentialist novels');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `library`
--

CREATE TABLE `library` (
  `libraryId` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `library`
--

INSERT INTO `library` (`libraryId`, `ISBN`, `userId`) VALUES
(1, 1234567893, 3),
(2, 1234567894, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `userEmail` varchar(150) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `photolink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`userId`, `firstName`, `lastName`, `userEmail`, `userPass`, `photolink`) VALUES
(1, 'Maria', 'Musterfrau', 'maria@musterfrau.at', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://nodowry.com/images/profile-pic-dummy.jpg'),
(2, 'philip', 'muller', 'philip@gmx.at', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://www.motormasters.info/wp-content/uploads/2015/02/dummy-profile-pic-male1.jpg'),
(3, 'Clemens', 'Weiss', 'clemens_78@yahoo.com', 'd320b98f7aaba156a6b3ba75930155db5bbb65233d7cb554299dc22b4a9b737e', 'http://www.motormasters.info/wp-content/uploads/2015/02/dummy-profile-pic-male1.jpg');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indizes für die Tabelle `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`libraryId`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `userId` (`userId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `library`
--
ALTER TABLE `library`
  MODIFY `libraryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
