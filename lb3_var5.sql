-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Квт 04 2023 р., 16:27
-- Версія сервера: 5.7.39
-- Версія PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `lb3_var5`
--

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE `category` (
  `ID_Category` int(8) NOT NULL,
  `c_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`ID_Category`, `c_name`) VALUES
(1, 'Videocard'),
(2, 'CPU'),
(3, 'Display'),
(4, 'Memory'),
(5, 'Keyboard');

-- --------------------------------------------------------

--
-- Структура таблиці `items`
--

CREATE TABLE `items` (
  `ID_Items` int(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `price` int(16) NOT NULL,
  `quantity` int(16) NOT NULL,
  `quality` int(16) NOT NULL,
  `FID_Vendor` int(16) NOT NULL,
  `FID_Category` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `items`
--

INSERT INTO `items` (`ID_Items`, `name`, `price`, `quantity`, `quality`, `FID_Vendor`, `FID_Category`) VALUES
(1, 'Монитор 22\"', 1500, 15, 5, 1, 3),
(2, 'Монитор 17\"', 1200, 20, 4, 3, 3),
(3, 'GeForce 660M', 2000, 12, 4, 4, 1),
(4, 'Radeon R9', 2500, 7, 5, 5, 1),
(5, 'Core i7', 3000, 10, 5, 4, 2),
(6, 'FX-6300', 2700, 15, 4, 5, 2),
(7, 'RAM 8GB', 1500, 11, 5, 2, 4),
(8, 'RAM 4GB', 1000, 15, 4, 3, 4),
(9, 'APEX PRO TKL', 269, 11, 4, 6, 5),
(10, 'APEX 9 MINI', 130, 65, 4, 6, 5),
(11, 'Intel® Arc™ A770', 5000, 5, 5, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `vendors`
--

CREATE TABLE `vendors` (
  `ID_Vendors` int(8) NOT NULL,
  `v_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `vendors`
--

INSERT INTO `vendors` (`ID_Vendors`, `v_name`) VALUES
(1, 'LG'),
(2, 'ASUS'),
(3, 'Samsung'),
(4, 'Intel'),
(5, 'AMD'),
(6, 'SteelSeries');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_Category`);

--
-- Індекси таблиці `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID_Items`),
  ADD KEY `FID_Vendor` (`FID_Vendor`),
  ADD KEY `FID_Category` (`FID_Category`);

--
-- Індекси таблиці `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`ID_Vendors`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`FID_Vendor`) REFERENCES `vendors` (`ID_Vendors`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`FID_Category`) REFERENCES `category` (`ID_Category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;