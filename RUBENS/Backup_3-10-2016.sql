-- MySQL dump 10.13  Distrib 5.6.25, for Win32 (x86)
--
-- Host: localhost    Database: superprecios
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fec_reg` date DEFAULT NULL,
  `Estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `correo` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `nit` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `Estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  `fec_reg` date DEFAULT NULL,
  `lim_cred` double DEFAULT NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE KEY `nit_UNIQUE` (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `numdoc` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `proveedor_idproveedor` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `idtipopago` int(11) NOT NULL,
  `nserie` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `fechapago` date DEFAULT NULL,
  PRIMARY KEY (`idcompra`,`idtipopago`,`usuario_idusuario`,`proveedor_idproveedor`),
  KEY `fk_compra_proveedor1` (`proveedor_idproveedor`),
  KEY `fk_compra_tipopago1_idx` (`idtipopago`),
  KEY `fk_compra_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`proveedor_idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_tipopago1` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleinteres`
--

DROP TABLE IF EXISTS `detalleinteres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleinteres` (
  `iddetint` int(11) NOT NULL AUTO_INCREMENT,
  `salida_idsalida` int(11) NOT NULL,
  `fechadel` date DEFAULT NULL,
  `fechaal` date DEFAULT NULL,
  `montointeres` float NOT NULL,
  `saldoactual` float NOT NULL,
  `interesactual` float NOT NULL,
  `nsaldointeres` float NOT NULL,
  `fecharegistro` date DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`iddetint`,`salida_idsalida`,`usuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleinteres`
--

LOCK TABLES `detalleinteres` WRITE;
/*!40000 ALTER TABLE `detalleinteres` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleinteres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesalida`
--

DROP TABLE IF EXISTS `detallesalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallesalida` (
  `iddetallesalida` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `precio` float NOT NULL,
  `salida_idsalida` int(11) NOT NULL,
  `lote_idlote` int(11) NOT NULL,
  `devolucion` float DEFAULT '0',
  PRIMARY KEY (`iddetallesalida`,`salida_idsalida`,`lote_idlote`),
  KEY `fk_detallesalida_salida1` (`salida_idsalida`),
  KEY `fk_detallesalida_lote1` (`lote_idlote`),
  CONSTRAINT `fk_detallesalida_lote1` FOREIGN KEY (`lote_idlote`) REFERENCES `lote` (`idlote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallesalida_salida1` FOREIGN KEY (`salida_idsalida`) REFERENCES `salida` (`idsalida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesalida`
--

LOCK TABLES `detallesalida` WRITE;
/*!40000 ALTER TABLE `detallesalida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoluciones` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `idlote` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `devolucion` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `entradasalida` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `nombre` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('REPUESTOS RUBEN´S','KM 183 CANTON PUCA SECTOR I','7771-4531','SAN SEBASTIAN, RETALHULEU');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechaint`
--

DROP TABLE IF EXISTS `fechaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechaint`
--

LOCK TABLES `fechaint` WRITE;
/*!40000 ALTER TABLE `fechaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idlote` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `stock` float NOT NULL,
  `estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  `Fecha` date NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `tipoentrada` varchar(8) CHARACTER SET latin1 NOT NULL,
  `compra_idcompra` int(11) NOT NULL,
  `devolucion` float DEFAULT NULL,
  PRIMARY KEY (`idlote`,`producto_idproducto`,`compra_idcompra`),
  KEY `fk_lote_producto` (`producto_idproducto`),
  KEY `fk_lote_compra1_idx` (`compra_idcompra`),
  CONSTRAINT `fk_lote_compra1` FOREIGN KEY (`compra_idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lote_producto` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `fec_reg` date DEFAULT NULL,
  `Estado` char(1) CHARACTER SET utf8 DEFAULT 'T',
  PRIMARY KEY (`idmarca`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilusu`
--

DROP TABLE IF EXISTS `perfilusu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfilusu` (
  `idperfilusu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) NOT NULL,
  `estado` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'T',
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idperfilusu`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilusu`
--

LOCK TABLES `perfilusu` WRITE;
/*!40000 ALTER TABLE `perfilusu` DISABLE KEYS */;
INSERT INTO `perfilusu` VALUES (234,0,'T',13),(235,1,'T',13),(236,2,'T',13),(237,3,'T',13),(238,4,'T',13),(239,5,'T',13),(240,6,'T',13),(241,7,'T',13),(242,8,'T',13),(243,9,'T',13),(244,10,'T',13),(245,11,'T',13),(246,12,'T',13),(247,13,'T',13),(248,14,'T',13),(249,15,'T',13),(250,16,'T',13),(251,17,'T',13),(252,18,'T',13),(253,19,'T',13),(254,20,'T',13),(255,21,'T',13),(256,22,'T',13);
/*!40000 ALTER TABLE `perfilusu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `comprometido` int(11) DEFAULT '0',
  `Descripcion` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `PrecioCompra` float DEFAULT NULL,
  `Precioventa` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Categoria_idCategoria` int(11) NOT NULL,
  `Estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  `pivote` float DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `idunidad` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `preciocredito` float DEFAULT NULL,
  `preciodistribuidor` float DEFAULT NULL,
  `precioespecial` float DEFAULT NULL,
  PRIMARY KEY (`idproducto`,`Categoria_idCategoria`,`idunidad`,`idmarca`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_producto_Categoria1` (`Categoria_idCategoria`),
  KEY `fk_producto_unidad1_idx` (`idunidad`),
  KEY `fk_producto_marca1_idx` (`idmarca`),
  CONSTRAINT `fk_producto_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_marca1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_unidad1` FOREIGN KEY (`idunidad`) REFERENCES `unidad` (`idunidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `correo` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `nitp` varchar(16) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `Estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  `fec_reg` date DEFAULT NULL,
  `contacto` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida` (
  `idsalida` int(11) NOT NULL AUTO_INCREMENT,
  `salida` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'T',
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `clientes_idclientes` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `numdoc` int(12) DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `tipopago_idtipopago` int(11) NOT NULL,
  `fechapago` date DEFAULT NULL,
  `interesactual` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`idsalida`,`clientes_idclientes`,`usuario_idusuario`,`tipopago_idtipopago`),
  KEY `fk_salida_clientes1` (`clientes_idclientes`),
  KEY `fk_salida_usuario1` (`usuario_idusuario`),
  KEY `fk_salida_tipopago1_idx` (`tipopago_idtipopago`),
  CONSTRAINT `fk_salida_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salida_tipopago1` FOREIGN KEY (`tipopago_idtipopago`) REFERENCES `tipopago` (`idtipopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salida_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopago` (
  `idtipopago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `dias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopago`
--

LOCK TABLES `tipopago` WRITE;
/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
INSERT INTO `tipopago` VALUES (1,'CONTADO',0),(2,'CREDITO 15 DIAS',15),(3,'CREDITO 30 DIAS',30),(4,'CREDITO 60 DIAS',60),(5,'CREDITO 90 DIAS',90),(6,'CREDITO 120 DIAS',120),(7,'CREDITO 150 DIAS',150);
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `fec_reg` date DEFAULT NULL,
  `Estado` char(1) CHARACTER SET utf8 DEFAULT 'T',
  PRIMARY KEY (`idunidad`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Apellido` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `nombreusuario` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `contrasenia` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 DEFAULT 'T',
  `puesto` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `nombreusuario_UNIQUE` (`nombreusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (13,'Administrador','','admin1','admin1','2016-10-02','T','Administrador');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xcobrarclientes`
--

DROP TABLE IF EXISTS `xcobrarclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xcobrarclientes` (
  `idxcobrarclientes` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `monto` float NOT NULL,
  `tipopago` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salida_idsalida` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `observacion` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `nsaldoventa` float NOT NULL DEFAULT '0',
  `nsaldototal` float NOT NULL DEFAULT '0',
  `saldointeres` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`idxcobrarclientes`,`salida_idsalida`,`usuario_idusuario`),
  KEY `fk_xcobrarclientes_salida1_idx` (`salida_idsalida`),
  KEY `fk_xcobrarclientes_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_xcobrarclientes_salida1` FOREIGN KEY (`salida_idsalida`) REFERENCES `salida` (`idsalida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_xcobrarclientes_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xcobrarclientes`
--

LOCK TABLES `xcobrarclientes` WRITE;
/*!40000 ALTER TABLE `xcobrarclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `xcobrarclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xpagardetalle`
--

DROP TABLE IF EXISTS `xpagardetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xpagardetalle` (
  `idxpagardetalle` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `monto` float NOT NULL,
  `compra_idcompra` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `observacion` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`idxpagardetalle`,`compra_idcompra`,`usuario_idusuario`),
  KEY `fk_xpagardetalle_compra1_idx` (`compra_idcompra`),
  KEY `fk_xpagardetalle_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_xpagardetalle_compra1` FOREIGN KEY (`compra_idcompra`) REFERENCES `compra` (`idcompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_xpagardetalle_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xpagardetalle`
--

LOCK TABLES `xpagardetalle` WRITE;
/*!40000 ALTER TABLE `xpagardetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `xpagardetalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-03 22:49:35
