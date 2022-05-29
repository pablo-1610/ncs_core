SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `ncs_inventories` (
  `inventory_identifier` varchar(80) NOT NULL,
  `max_weight` float NOT NULL,
  `allowed_content` text NOT NULL,
  `accounts` text NOT NULL,
  `weapons` text NOT NULL,
  `items` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ncs_players` (
  `player_identifier` varchar(80) NOT NULL,
  `role_identifier` varchar(30) NOT NULL,
  `last_source` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ncs_players_characters` (
  `player_identifier` varchar(80) NOT NULL,
  `identity` text NOT NULL,
  `skin` text NOT NULL,
  `accounts` text NOT NULL,
  `job` text NOT NULL,
  `metadata` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ncs_roles` (
  `role_identifier` varchar(80) NOT NULL,
  `label` varchar(80) NOT NULL,
  `power_index` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ncs_roles_permissions` (
  `role_identifier` varchar(80) NOT NULL,
  `permission` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `ncs_inventories`
  ADD PRIMARY KEY (`inventory_identifier`);

ALTER TABLE `ncs_players`
  ADD PRIMARY KEY (`player_identifier`);

ALTER TABLE `ncs_roles`
  ADD PRIMARY KEY (`role_identifier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;