-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2021 a las 20:42:58
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `marketplace`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `idCalificacion` int(11) NOT NULL,
  `calificacion` int(5) NOT NULL,
  `comentario` varchar(80) DEFAULT NULL,
  `fechaCalificacion` varchar(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`idCalificacion`, `calificacion`, `comentario`, `fechaCalificacion`, `idUsuario`, `idTienda`) VALUES
(2, 3, 'muy bien', '25/11/2021', 54, 2),
(4, 4, 'muy buenos productos', '25/11/2021', 54, 2),
(8, 4, 'buena tienda', '25/11/2021', 54, 2),
(11, 4, 'bueno', '29/11/2021', 54, 2),
(12, 5, 'Excelente productos', '29/11/2021', 59, 2),
(19, 4, 'bien', '3/12/2021', 59, 9),
(20, 4, 'buenos productos', '3/12/2021', 54, 2),
(21, 1, 'malo', '3/12/2021', 54, 2),
(22, 4, 'bueno', '8/12/2021', 64, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(35) NOT NULL,
  `descripcionCategoria` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`, `descripcionCategoria`) VALUES
(1, 'Mercado', 'Alimentos para la comida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idDetallePedido`, `cantidad`, `precio`, `idProducto`, `idPedido`) VALUES
(4, 3, '12.60', 4, 3),
(7, 2, '15.60', 17, 4),
(8, 2, '15.60', 17, 5),
(9, 1, '7.80', 17, 6),
(10, 2, '15.60', 17, 7),
(12, 1, '4.20', 4, 8),
(16, 2, '8.40', 4, 9),
(21, 1, '3.50', 11, 10),
(22, 3, '10.50', 11, 11),
(23, 2, '8.40', 4, 11),
(24, 1, '3.60', 5, 11),
(25, 1, '1.89', 7, 11),
(26, 3, '1.89', 7, 12),
(27, 4, '4.20', 4, 12),
(28, 5, '3.60', 5, 13),
(29, 1, '4.20', 4, 13),
(30, 3, '3.50', 11, 13),
(31, 5, '3.60', 5, 14),
(32, 2, '4.20', 4, 14),
(33, 3, '10.50', 11, 14),
(34, 2, '3.78', 7, 14),
(35, 2, '4.20', 4, 15),
(36, 3, '3.60', 5, 15),
(37, 2, '4.20', 4, 16),
(38, 4, '1.89', 7, 16),
(39, 2, '4.20', 4, 17),
(40, 5, '1.89', 7, 17),
(41, 2, '4.20', 4, 18),
(42, 1, '3.60', 5, 18),
(43, 1, '1.89', 7, 18),
(44, 8, '3.50', 11, 18),
(45, 2, '4.20', 4, 19),
(46, 3, '3.50', 11, 19),
(47, 2, '3.50', 11, 20),
(48, 2, '1.89', 7, 20),
(49, 2, '1.89', 7, 21),
(50, 3, '3.50', 11, 21),
(51, 1, '3.60', 5, 22),
(52, 1, '4.20', 4, 22),
(53, 2, '1.89', 7, 22),
(54, 5, '3.50', 11, 22),
(55, 2, '1.89', 7, 23),
(56, 2, '1.89', 7, 24),
(57, 2, '1.89', 7, 25),
(58, 2, '3.50', 11, 26),
(59, 1, '3.60', 5, 26),
(60, 2, '7.00', 4, 27),
(61, 10, '35.00', 11, 27),
(63, 5, '17.50', 11, 28),
(64, 2, '4.98', 22, 29),
(65, 1, '19.50', 23, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `idDistrito` int(11) NOT NULL,
  `nombreDistrito` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`idDistrito`, `nombreDistrito`) VALUES
(1, 'Alto Selva Alegre'),
(2, 'Cayma'),
(3, 'Arequipa'),
(4, 'Characato'),
(5, 'Cerro Colorado'),
(6, 'Chiguata'),
(7, 'Jacobo Hunter'),
(8, 'Jose Luis Bustamante y Rivero'),
(9, 'La Joya'),
(10, 'Mariana Melgar'),
(11, 'Miraflores'),
(12, 'Mollebaya'),
(13, 'Paucarpata'),
(14, 'Pocsi'),
(15, 'Polobaya'),
(16, 'Quequeña'),
(17, 'Sabandia'),
(18, 'Sachaca'),
(19, 'San Juan de Tarucani'),
(20, 'Santa Isabel de Siguas'),
(21, 'Santa Rita de Siguas'),
(22, 'Socabaya'),
(23, 'Tiabaya'),
(24, 'Uchumayo'),
(25, 'Vitor'),
(26, 'Yanahuara'),
(27, 'Yarabamba'),
(28, 'Yura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `idEstadoPedido` int(11) NOT NULL,
  `nombreEstadoPedido` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadopedido`
--

INSERT INTO `estadopedido` (`idEstadoPedido`, `nombreEstadoPedido`) VALUES
(1, 'Preparando Entrega'),
(2, 'Cancelado'),
(3, 'Enviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL,
  `nombrePago` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `nombrePago`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fechaPedido` varchar(50) NOT NULL,
  `totalPrecio` decimal(4,2) DEFAULT NULL,
  `idEstadoPedido` int(11) NOT NULL,
  `idPago` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `direccionPedido` varchar(50) NOT NULL,
  `horaEntrega` time NOT NULL,
  `fechaEntrega` date NOT NULL,
  `idTienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `fechaPedido`, `totalPrecio`, `idEstadoPedido`, `idPago`, `idUsuario`, `direccionPedido`, `horaEntrega`, `fechaEntrega`, `idTienda`) VALUES
(3, '5/10/2021', '11.30', 2, 1, 54, 'AV. marina', '18:29:00', '2021-10-24', 2),
(4, '0000-00-00', '7.80', 1, 1, 54, 'av yura', '20:31:00', '2021-10-23', 9),
(5, '0000-00-00', '15.60', 1, 1, 54, 'AV. marina', '11:08:00', '2021-10-22', 9),
(6, '0000-00-00', '7.80', 1, 1, 54, 'AV. X CALLE. M', '16:37:00', '2021-10-23', 9),
(7, '0000-00-00', '27.60', 1, 1, 54, 'av. k calle g', '17:35:00', '2021-10-22', 9),
(8, '5/11/2021', '13.19', 1, 1, 62, 'av. m calle s', '11:03:00', '2021-10-26', 2),
(9, '5/11/2021', '12.00', 1, 1, 54, 'av. san juan. calle scc', '12:40:00', '2021-11-13', 2),
(10, '5/11/2021', '13.19', 1, 1, 54, 'av. g calle m', '14:30:00', '2021-11-12', 2),
(11, '2/12/2021', '16.69', 1, 1, 54, 'AV. marina', '15:05:00', '2021-12-02', 2),
(12, '3/12/2021', '22.47', 1, 1, 54, 'AV. marina', '12:49:00', '2021-12-03', 2),
(13, '3/12/2021', '32.70', 1, 2, 59, 'av yura', '13:01:00', '2021-12-03', 2),
(14, '3/12/2021', '40.68', 1, 1, 59, 'AV. marina', '13:06:00', '2021-12-03', 2),
(15, '3/12/2021', '19.20', 1, 2, 59, 'AV. marina', '01:16:00', '2021-12-10', 2),
(16, '3/12/2021', '15.96', 1, 1, 59, 'av. x calle zzz', '13:23:00', '2021-12-03', 2),
(17, '3/12/2021', '17.85', 1, 1, 59, 'av yura', '13:28:00', '2021-12-04', 2),
(18, '3/12/2021', '41.89', 1, 1, 59, 'AV. X CALLE. M', '13:32:00', '2021-12-03', 2),
(19, '3/12/2021', '18.90', 1, 1, 54, 'AV. marina', '13:34:00', '2021-12-03', 2),
(20, '3/12/2021', '10.78', 1, 1, 59, 's', '13:36:00', '2021-12-03', 2),
(21, '3/12/2021', '14.28', 3, 1, 59, 'av', '13:39:00', '2021-12-03', 2),
(22, '3/12/2021', '29.08', 1, 1, 59, 'av yura', '13:42:00', '2021-12-03', 2),
(23, '3/12/2021', '3.78', 1, 2, 54, 'AV. marina', '13:47:00', '2021-12-04', 2),
(24, '3/12/2021', '3.78', 1, 1, 59, 'z', '13:49:00', '2021-12-03', 2),
(25, '3/12/2021', '3.78', 1, 2, 59, 'a', '13:52:00', '2021-12-03', 2),
(26, '3/12/2021', '10.60', 1, 1, 59, 'AV. marina', '13:56:00', '2021-12-03', 2),
(27, '3/12/2021', '43.40', 1, 1, 54, 'z', '13:59:00', '2021-12-03', 2),
(28, '3/12/2021', '7.28', 3, 1, 54, 'av x calle m', '17:10:00', '2021-12-03', 2),
(29, '8/12/2021', '82.98', 3, 1, 64, 'av. sddd', '14:36:00', '2021-12-08', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacion`
--

CREATE TABLE `planificacion` (
  `idPlanificacion` int(11) NOT NULL,
  `fechaEntrega` date NOT NULL,
  `horaEntrega` time NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precioProducto` decimal(4,2) NOT NULL,
  `imgProducto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcionProducto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estadoProducto` int(1) DEFAULT NULL,
  `marcaProducto` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `unidadDeMedida` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idCategoria` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precioProducto`, `imgProducto`, `descripcionProducto`, `estadoProducto`, `marcaProducto`, `unidadDeMedida`, `idCategoria`, `idTienda`) VALUES
(3, 'Azucar', '3.50', 'https://plazavea.vteximg.com.br/arquivos/ids/550611-1000-1000/1766.jpg', 'Dentro de los Abarrotes encontramos los Azúcares y Endulzantes , un producto muy', 1, 'BELL\'S', '1Kg', 1, 5),
(4, 'Spaghetti', '4.20', 'https://plazavea.vteximg.com.br/arquivos/ids/554051-450-450/20098648.jpg', 'Dentro de los Abarrotes encontramos Fideos y Pastas un producto muy usado dentro', 1, 'DON VITTORIO', '1 Kg', 1, 2),
(5, 'Lentejas', '3.60', 'https://plazavea.vteximg.com.br/arquivos/ids/2344142-450-450/20220362.jpg', 'Alimento nutritivo', 1, 'BELL\'S', '500g', 1, 2),
(7, 'Sal Marina', '1.89', 'https://plazavea.vteximg.com.br/arquivos/ids/561008-450-450/20130448.jpg', 'Un producto para preparar comida', 1, 'EMSAL ', '1Kg', 1, 2),
(11, 'Azucar Blanca', '3.50', 'https://plazavea.vteximg.com.br/arquivos/ids/550611-450-450/1766.jpg', 'Un producto muy utilizado en la cocina y reposter??a', 1, 'BELL\'S ', '1Kg', 1, 2),
(13, 'Lentejas ', '3.60', 'https://plazavea.vteximg.com.br/arquivos/ids/2344142-450-450/20220362.jpg', 'Alimento nutritivo', 1, 'BELL\'S', '500 g', 1, 5),
(15, 'Aceite Vegetal', '7.80', 'https://plazavea.vteximg.com.br/arquivos/ids/553586-450-450/959308.jpg', 'Dentro de los Abarrotes encontramos al aceite', 1, 'BELL\'S ', '900ml', 1, 8),
(17, 'Aceite Vegetal', '7.80', 'https://plazavea.vteximg.com.br/arquivos/ids/553586-450-450/959308.jpg', 'Dentro de los Abarrotes encontramos al aceite ', 1, 'BELL\'S ', '900ml', 1, 9),
(21, 'Papel ', '9.90', 'https://plazavea.vteximg.com.br/arquivos/ids/562117-450-450/20172370.jpg', 'Papel Toalla', 1, 'NOVA ', '4un', 1, 10),
(22, 'Pan FrancÃ©s', '2.49', 'https://plazavea.vteximg.com.br/arquivos/ids/297369-450-450/pan-frances-bell-s-pre-cocido-congelado-bolsa-5un.jpg', 'Conservar en lugar fresco y seco', 1, 'BELL\'S', '5un', 1, 11),
(23, 'Leche', '19.50', 'https://plazavea.vteximg.com.br/arquivos/ids/345000-450-450/199315.jpg', 'Leche Evaporada', 1, 'GLORIA ', '6un', 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombreRol`) VALUES
(1, 'Cliente'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `idTienda` int(11) NOT NULL,
  `nombreTienda` varchar(50) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `estadoTienda` int(1) DEFAULT NULL,
  `telefonoTienda` int(9) DEFAULT NULL,
  `direccionTienda` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idDistrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`idTienda`, `nombreTienda`, `longitud`, `latitud`, `estadoTienda`, `telefonoTienda`, `direccionTienda`, `idUsuario`, `idDistrito`) VALUES
(2, 'Bodega EXN', '-71.5464788520664', '-16.393018172171324', 1, 897845561, 'AV. AVIACION', 30, 5),
(5, 'Bodega Manto', '-71.55334530714453', '-16.401910854492318', 1, 987456125, 'av. c', 51, 28),
(6, 'Bodega Z', '-71.55128537062109', '-16.404545645319676', 1, 963258741, 'av. montes', 52, 11),
(7, 'Bodega Marcelo', '-71.55077038649023', '-16.396147125224424', 1, 741258963, 'av. marcelo, calle ponce', 55, 17),
(8, 'Bodega mar', '-71.54441891554296', '-16.401252151212613', 1, 963258741, 'av. mar', 57, 17),
(9, 'Bodega Pablo', '-71.5476804817051', '-16.394664995834464', 1, 963258741, 'av z calle x', 58, 14),
(10, 'Bodega Juan', '-71.53828202131689', '-16.407046605176323', 1, 963258742, 'av. c', 61, 28),
(11, 'Tienda Hugo', '-71.5571218574375', '-16.39400626804029', 1, 963258744, 'av ponce calle hugo', 63, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombresUsuario` varchar(45) NOT NULL,
  `apellidosUsuario` varchar(45) NOT NULL,
  `telefonoUsuario` int(9) NOT NULL,
  `correoUsuario` varchar(45) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `dniUsuario` int(8) NOT NULL,
  `direccionUsuario` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `idDistrito` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombresUsuario`, `apellidosUsuario`, `telefonoUsuario`, `correoUsuario`, `usuario`, `clave`, `dniUsuario`, `direccionUsuario`, `idDistrito`, `idRol`) VALUES
(7, 'Juan Mario', 'Ponce Peredo', 987456123, 'juan.ponce@hotmail.com', 'juan', 'ponce', 89568956, 'COM 36 MZ. I Lt. 4', 3, 1),
(30, 'Ediczon', 'Mayta', 988764710, 'ediczon.mayta@gmail.com', 'vendedor', '123456', 78451254, 'COM 36 MZ. I Lt. 4', 28, 2),
(49, 'Ediczon', 'Mayta', 987456654, 'ediczon.mayta@hotmail.com', 'add', '123456', 12345678, 'COM 36 MZ. I Lt. 4', 28, 2),
(50, 'Juan', 'Perez', 852147963, 'juan.perez@gmail.com', 'juan', '123456', 78451245, 'av. c', 2, 2),
(51, 'Antony', 'Montes', 147852369, 'antony.montes@hotmail.com', 'manto', '123456', 98745621, 'av. z', 28, 2),
(52, 'Bryan', 'Montesinos ', 963258741, 'bryan.montesinos@gmail.com', 'mon', '123', 96325874, 'av. montes', 17, 2),
(53, 'Pedro', 'Moss', 123456789, 'pedro.moss@hotmail.com', 'moss', '123456', 96325874, 'av. nmoss', 3, 1),
(54, 'Mario', 'Molina', 147852369, 'mario.molina@gmail.com', 'user', '123456', 12345678, 'av. dolores', 8, 1),
(55, 'Marcelo', 'Ponce', 963258741, 'marcelo.ponce@gmail.com', 'marcelo', 'ponce', 78451245, 'av. marcelo, calle ponce', 17, 2),
(56, 'Pedro', 'Mass', 963258741, 'pedro.mass@hotmail.com', 'mass', '123456', 78451256, 'av. mass', 1, 1),
(57, 'Mario', 'Perez', 963258741, 'mario.perez@gmail.com', 'mar', '123456', 147852369, 'av. mar', 1, 2),
(58, 'Pablo', 'Ponce', 987456321, 'pablo.ponce@hotmail.com', 'pablo', '123456', 36985214, 'av. x calle z', 18, 2),
(59, 'Ediczon', 'Mayta', 963258741, 'ediczon.mayta@gmail.com', 'us', '123456', 89784589, 'COM 36 MZ. I Lt. 4', 28, 1),
(61, 'Juan pablo', 'Pere Ponce', 963258741, 'juan.pere@gmail.com', 've', '123456', 73217436, 'Arequipa', 28, 2),
(62, 'Juan ', 'Ponce Perez', 963258741, 'juan.ponce.perez@gmail.com', 'juan', '123456', 78451265, 'av. x calle h', 22, 1),
(63, 'Hugo', 'Ponce', 999564578, 'hugo.ponce@gmail.com', 'hugo', '123456', 96325874, 'av hugo calle ponce', 3, 2),
(64, 'Alex', 'Mons', 963258741, 'alex.mons@gmail.com', 'alex', '123', 36985214, 'av do calle ss', 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTienda` (`idTienda`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`,`idProducto`,`idPedido`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`idDistrito`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`idEstadoPedido`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idEstadoPedido` (`idEstadoPedido`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPago` (`idPago`),
  ADD KEY `idTienda` (`idTienda`);

--
-- Indices de la tabla `planificacion`
--
ALTER TABLE `planificacion`
  ADD PRIMARY KEY (`idPlanificacion`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idTienda` (`idTienda`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`idTienda`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idDistrito` (`idDistrito`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idDistrito` (`idDistrito`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `idCalificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `idDistrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  MODIFY `idEstadoPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `planificacion`
--
ALTER TABLE `planificacion`
  MODIFY `idPlanificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `idTienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`idTienda`) REFERENCES `tienda` (`idTienda`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idEstadoPedido`) REFERENCES `estadopedido` (`idEstadoPedido`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`idTienda`) REFERENCES `tienda` (`idTienda`);

--
-- Filtros para la tabla `planificacion`
--
ALTER TABLE `planificacion`
  ADD CONSTRAINT `planificacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `planificacion_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idTienda`) REFERENCES `tienda` (`idTienda`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`idDistrito`) REFERENCES `distrito` (`idDistrito`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `distrito` (`idDistrito`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
