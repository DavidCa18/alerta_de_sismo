-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla alertasismosdb.alerta
CREATE TABLE IF NOT EXISTS `alerta` (
  `idAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAlerta` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAlerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.condicion
CREATE TABLE IF NOT EXISTS `condicion` (
  `idCondicion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCondicion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionCondicion` varchar(255) COLLATE utf8_spanish2_ci DEFAULT '0',
  PRIMARY KEY (`idCondicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `idContacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreContacto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `telefonoContacto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `fotoContacto` varchar(255) COLLATE utf8_spanish2_ci DEFAULT '0',
  `idUsuario` int(11) DEFAULT '0',
  `idGrupo` int(11) DEFAULT '0',
  PRIMARY KEY (`idContacto`),
  KEY `idUsuarioC` (`idUsuario`),
  KEY `idGrupoC` (`idGrupo`),
  CONSTRAINT `idGrupoC` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioC` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.emergencia
CREATE TABLE IF NOT EXISTS `emergencia` (
  `idEmergencia` int(11) NOT NULL AUTO_INCREMENT,
  `logitudUsuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `latitudUsuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `altitudUsuario` varchar(100) COLLATE utf8_spanish2_ci DEFAULT '0',
  `fechaEmergencia` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` int(11) DEFAULT NULL,
  `idRango` int(11) DEFAULT NULL,
  `idAlerta` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmergencia`),
  KEY `idAlertaE` (`idAlerta`),
  KEY `idEstadoE` (`idEstado`),
  KEY `idUsuarioE` (`idUsuario`),
  KEY `idRangoE` (`idRango`),
  CONSTRAINT `idAlertaE` FOREIGN KEY (`idAlerta`) REFERENCES `alerta` (`idAlerta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idEstadoE` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idRangoE` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioE` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `idTipoGravedad` int(11) DEFAULT '0',
  PRIMARY KEY (`idEstado`),
  KEY `idTipoGravedadE` (`idTipoGravedad`),
  CONSTRAINT `idTipoGravedadE` FOREIGN KEY (`idTipoGravedad`) REFERENCES `tipogravedad` (`idTipoGravedad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.funcion
CREATE TABLE IF NOT EXISTS `funcion` (
  `idFuncion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFuncion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionFuncion` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idFuncion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGrupo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `descripcionGrupo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT '0',
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.instruccion
CREATE TABLE IF NOT EXISTS `instruccion` (
  `idInstruccion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionInstruccion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `idEstado` int(11) DEFAULT '0',
  PRIMARY KEY (`idInstruccion`),
  KEY `idEstadoI` (`idEstado`),
  CONSTRAINT `idEstadoI` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT '0',
  `idFuncion` int(11) DEFAULT '0',
  PRIMARY KEY (`idPermiso`),
  KEY `IdFuncionP` (`idFuncion`),
  KEY `idUsuarioP` (`idUsuario`),
  CONSTRAINT `IdFuncionP` FOREIGN KEY (`idFuncion`) REFERENCES `funcion` (`idFuncion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioP` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.rango
CREATE TABLE IF NOT EXISTS `rango` (
  `idRango` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numPersonasRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `areaRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `escalaRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `coordenadaXRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `coordenadaYRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `coordenadaZRango` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idRango`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.tipogravedad
CREATE TABLE IF NOT EXISTS `tipogravedad` (
  `idTipoGravedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoGravedad` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `descripcionTipoGravedad` varchar(255) COLLATE utf8_spanish2_ci DEFAULT '0',
  PRIMARY KEY (`idTipoGravedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.tiposangre
CREATE TABLE IF NOT EXISTS `tiposangre` (
  `idTipoSangre` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoSangre` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionTiposSangre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idTipoSangre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaUsuario` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `correoUsuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoUsuario` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNacUsuario` date NOT NULL,
  `generoUsuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionUsuario` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fotoUsuario` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idTipoSangre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idTipoSangreU` (`idTipoSangre`),
  CONSTRAINT `idTipoSangreU` FOREIGN KEY (`idTipoSangre`) REFERENCES `tiposangre` (`idTipoSangre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla alertasismosdb.validacion
CREATE TABLE IF NOT EXISTS `validacion` (
  `idValidacion` int(11) NOT NULL AUTO_INCREMENT,
  `longitudUsuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `latitudUsuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `altitudUsuario` varchar(100) COLLATE utf8_spanish2_ci DEFAULT '0',
  `fechaValidacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` int(11) DEFAULT NULL,
  `idRango` int(11) DEFAULT NULL,
  PRIMARY KEY (`idValidacion`),
  KEY `idUsuarioV` (`idUsuario`),
  KEY `idRangoV` (`idRango`),
  CONSTRAINT `idRangoV` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuarioV` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;