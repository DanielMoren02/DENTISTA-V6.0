-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para clinica
CREATE DATABASE IF NOT EXISTS `clinica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clinica`;

-- Volcando estructura para tabla clinica.cita
CREATE TABLE IF NOT EXISTS `cita` (
  `idcita` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `otro_` varchar(45) DEFAULT NULL,
  `estatus` enum('activo','inactivo') NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `servicio_idservicio` int(11) NOT NULL,
  `horario_idhorario` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcita`,`servicio_idservicio`,`horario_idhorario`),
  KEY `fk_cita_servicio_idx` (`servicio_idservicio`),
  KEY `fk_cita_horario1_idx` (`horario_idhorario`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `fk_cita_horario1` FOREIGN KEY (`horario_idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_servicio` FOREIGN KEY (`servicio_idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.cita: ~0 rows (aproximadamente)
INSERT INTO `cita` (`idcita`, `descripcion_`, `fecha`, `otro_`, `estatus`, `usuario_id`, `servicio_idservicio`, `horario_idhorario`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 'Mal aliento', NULL, NULL, 'activo', 3, 1, 2, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `inicio_mañana` time NOT NULL DEFAULT '00:00:00',
  `fin_mañana` time NOT NULL,
  `inicio_tarde` time NOT NULL DEFAULT '00:00:00',
  `fin_tarde` time NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.horario: ~8 rows (aproximadamente)
INSERT INTO `horario` (`idhorario`, `dia`, `estatus`, `inicio_mañana`, `fin_mañana`, `inicio_tarde`, `fin_tarde`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 0, '0', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(2, 1, '0', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(3, 2, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(4, 3, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(5, 4, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(6, 5, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(7, 6, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, '2023-03-23 16:38:38', NULL),
	(8, 7, '1', '08:00:00', '08:00:00', '16:00:00', '16:00:00', NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `costo` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.servicio: ~2 rows (aproximadamente)
INSERT INTO `servicio` (`idservicio`, `nombre_`, `descripcion`, `costo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Limpieza', 'Limpieza bucal para prevencion de caries', 500, NULL, NULL, NULL),
	(2, 'Corona', 'Remplazo de dientes', 1200, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.users
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estatus` enum('0','1') DEFAULT NULL,
  `rol` enum('1','2','3') DEFAULT NULL,
  `terminos` enum('0','1') DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idusers`,`usuario_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `celular_UNIQUE` (`celular`),
  KEY `fk_users_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_users_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`idusers`, `email`, `celular`, `password`, `estatus`, `rol`, `terminos`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'daniel@gmail.com', '9191061467', 'danipro6000', NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(2, 'danielmorenoperez42@gmail.com', '0878787878', 'jjhkhj', NULL, NULL, NULL, 2, NULL, NULL, NULL),
	(5, 'danielmorenoperez421@gmail.com', '9191809276', 'contra', NULL, NULL, NULL, 3, NULL, '2023-03-09 22:54:09', '2023-03-09 22:54:09');

-- Volcando estructura para tabla clinica.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_` varchar(100) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `genero` enum('Hombre','Mujer') NOT NULL,
  `sangre` enum('A+','B+','AB+','O+','A-','B-','AB-','O-') NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `rfc` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `padecimiento` varchar(255) DEFAULT NULL,
  `estado` enum('Agualientes','Baja California','Baja California Sur','Campeche','Chiapas','Chihuahua','Coahuila','Colima','Cuidad de Mexico','Durango','Estado de Mexico','Guanajuato','Guerreo','Hidalgo','Jalisco','Michoacan','Morelos','Nayarit','Nuevo Leon','Oaxaca','Puebla','Queretaro','Quintana Roo','San Luis Potosi','Sinaloa','Sonora','Tabo','Tamaulipas','Tlaxcala','Veracruz','Yucatan','Zacatecas') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.usuario: ~3 rows (aproximadamente)
INSERT INTO `usuario` (`id`, `nombre_`, `apellidos`, `direccion`, `genero`, `sangre`, `telefono`, `fecha_nacimiento`, `rfc`, `curp`, `padecimiento`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Daniel', 'Moreno', 'Ocosingo', 'Hombre', 'A+', '915446465', '2002-02-12', 'dasd', 'asdasd', NULL, 'Chiapas', NULL, '2023-03-09 00:04:10', '2023-03-09 00:04:10'),
	(2, 'jkjjkjkjkjkl', 'tftftftghtf', 'hjgghgg', 'Hombre', 'A+', '098765432', '2023-08-09', 'ggfgffgfgfgfgh', 'gygvjjhkj77gygy', 'ggfghfhgf', 'Baja California Sur', NULL, '2023-03-09 22:55:28', '2023-03-09 22:55:28'),
	(3, 'Miguel', 'Ruiz', 'barrio sauzal', 'Hombre', 'O+', '9186256190', '2002-07-12', 'MOPD021127PPP', 'COAS020802HCSRNLA2', 'Hipertension', 'Chiapas', NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.usuario_has_cita
CREATE TABLE IF NOT EXISTS `usuario_has_cita` (
  `usuario_id` int(11) NOT NULL,
  `cita_idcita` int(11) NOT NULL,
  `cita_servicio_idservicio` int(11) NOT NULL,
  `diagnostico` varchar(255) NOT NULL,
  `tratamiento` varchar(255) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `archivos` blob DEFAULT NULL,
  PRIMARY KEY (`usuario_id`,`cita_idcita`,`cita_servicio_idservicio`),
  KEY `fk_usuario_has_cita_cita1_idx` (`cita_idcita`,`cita_servicio_idservicio`),
  KEY `fk_usuario_has_cita_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuario_has_cita_cita1` FOREIGN KEY (`cita_idcita`, `cita_servicio_idservicio`) REFERENCES `cita` (`idcita`, `servicio_idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cita_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.usuario_has_cita: ~1 rows (aproximadamente)
INSERT INTO `usuario_has_cita` (`usuario_id`, `cita_idcita`, `cita_servicio_idservicio`, `diagnostico`, `tratamiento`, `observaciones`, `archivos`) VALUES
	(3, 5, 1, 'Presentaba mucho sarro en la shuta', 'Enjuage bucal oral b gingivitis', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
