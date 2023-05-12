-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2023 a las 00:51:32
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adminlte`
--
CREATE DATABASE IF NOT EXISTS `adminlte` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `adminlte`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spCrearProducto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCrearProducto` (IN `_ESTADO` TINYINT(1), IN `_NOMBRE` VARCHAR(200), IN `_CANTIDAD` INT(100), IN `_PRECIO` DECIMAL(10,2), IN `_FOTO` BLOB, IN `_DESCRIPCION` VARCHAR(100))  BEGIN
    INSERT INTO categoria (estado, descripcion)
    VALUES (_ESTADO,_DESCRIPCION);

    INSERT INTO producto (nombre, precio ,cantidad, foto)
    VALUES ( _NOMBRE, _CANTIDAD, _PRECIO, _FOTO);
END$$

DROP PROCEDURE IF EXISTS `spCreateUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateUsers` (IN `_NAME` VARCHAR(50))  BEGIN
INSERT INTO users ( NAME ) VALUES (_NAME);
END$$

DROP PROCEDURE IF EXISTS `spFindAllUsers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllUsers` ()  BEGIN
	SELECT ID, NAME FROM users;
END$$

DROP PROCEDURE IF EXISTS `spUpdateUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateUser` (IN `_ID` INT(8), IN `_NAME` VARCHAR(50))  BEGIN
	UPDATE users SET NAME =_NAME WHERE ID = _ID;
    
END$$

DROP PROCEDURE IF EXISTS `spVerProductos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spVerProductos` ()  BEGIN

SELECT categoria.COD_CATE, categoria.descripcion, producto.nombre, producto.COD_PROD
FROM categoria 
INNER JOIN producto
ON producto.COD_PROD = categoria.COD_CATE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `COD_CATE` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`COD_CATE`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`COD_CATE`, `descripcion`, `estado`) VALUES
(1, 'TV', 1),
(2, 'Smartphone', 1),
(3, 'Portatil', 1),
(4, 'Mobil', 1),
(8, 'SmartWach', 1),
(9, 'Smartphone', 1),
(10, 'Mobil', 1),
(11, 'PC de sobremesa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `COD_PROD` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,6) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `foto` blob DEFAULT NULL,
  `COD_CATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PROD`),
  KEY `COD_CATE` (`COD_CATE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`COD_PROD`, `nombre`, `precio`, `cantidad`, `foto`, `COD_CATE`) VALUES
(1, 'Samsung', '20.000000', 29, 0x7864, NULL),
(2, 'Realme 9 ', '90.000000', 29, 0x7864, NULL),
(3, 'HP', '20.000000', 3, 0x7864, NULL),
(4, 'Lenovo', '29.000000', 1, 0x7864, NULL),
(5, 'LG', '20.000000', 20, 0x7864, NULL),
(6, 'Motorola', '29.000000', 30, 0x7864, NULL),
(7, 'HTC', '3.000000', 29, 0x7864, NULL),
(8, 'DELL', '10.000000', 29, 0x7864, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID`, `NAME`) VALUES
(1, 'Gamila'),
(2, 'Wara'),
(3, 'Santaigo'),
(4, 'Sebastian');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`COD_CATE`) REFERENCES `categoria` (`COD_CATE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
