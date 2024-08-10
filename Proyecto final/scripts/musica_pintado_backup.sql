-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: musica_pintado
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albumes`
--

DROP TABLE IF EXISTS `albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `Publicacion` int DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Duracion` int DEFAULT NULL,
  `NroCanciones` int DEFAULT NULL,
  `ArtistaID` int unsigned DEFAULT NULL,
  `Reproducciones` int DEFAULT NULL,
  `NroComentarios` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ArtistaID` (`ArtistaID`),
  CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`ArtistaID`) REFERENCES `artistas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumes`
--

LOCK TABLES `albumes` WRITE;
/*!40000 ALTER TABLE `albumes` DISABLE KEYS */;
INSERT INTO `albumes` VALUES (1,'El Dorado',2017,'Pop',45,13,1,500000,1),(2,'Parachutes',2000,'Rock',50,10,2,600000,1),(3,'1989',2014,'Pop',48,15,3,700000,1),(4,'Mis planes son amarte',2017,'Pop Rock',55,12,4,400000,1),(5,'Metallica',1991,'Heavy Metal',63,12,5,800000,1),(6,'Lemonade',2016,'R&B',55,14,6,450000,1),(7,'÷',2017,'Pop',50,16,7,400000,1),(8,'21',2011,'Soul',47,11,8,350000,1),(9,'Doo-Wops & Hooligans',2010,'Pop',42,10,9,300000,1),(10,'Recovery',2010,'Hip Hop',47,14,10,550000,1),(11,'Loud',2010,'R&B',48,12,11,500000,1),(12,'After Hours',2020,'R&B',56,14,12,400000,1),(13,'Purpose',2015,'Pop',54,13,13,450000,1),(14,'Positions',2020,'Pop',45,14,14,400000,1),(15,'Take Care',2011,'Hip Hop',65,18,15,600000,1);
/*!40000 ALTER TABLE `albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `AlbumesTotal` int DEFAULT NULL,
  `CancionesTotal` int DEFAULT NULL,
  `Reproducciones` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Shakira','Pop','Colombia',44,10,50,1000000),(2,'Coldplay','Rock','Reino Unido',45,8,60,1200000),(3,'Taylor Swift','Pop','Estados Unidos',32,9,55,1500000),(4,'Juanes','Pop Rock','Colombia',49,7,40,800000),(5,'Metallica','Heavy Metal','Estados Unidos',60,12,85,2000000),(6,'Beyoncé','R&B','Estados Unidos',39,6,30,900000),(7,'Ed Sheeran','Pop','Reino Unido',31,4,25,700000),(8,'Adele','Soul','Reino Unido',33,3,20,600000),(9,'Bruno Mars','Pop','Estados Unidos',36,5,35,850000),(10,'Eminem','Hip Hop','Estados Unidos',48,8,55,1100000),(11,'Rihanna','R&B','Barbados',34,7,45,1000000),(12,'The Weeknd','R&B','Canadá',31,5,30,750000),(13,'Justin Bieber','Pop','Canadá',27,6,40,900000),(14,'Ariana Grande','Pop','Estados Unidos',28,5,35,800000),(15,'Drake','Hip Hop','Canadá',35,7,50,1200000);
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BeforeDeleteArtista` BEFORE DELETE ON `artistas` FOR EACH ROW BEGIN
    DECLARE total_albumes INT;

    SELECT COUNT(*) INTO total_albumes FROM Albumes WHERE ArtistaID = OLD.ID;

    IF total_albumes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el artista porque tiene álbumes asociados.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `artistasalbumes`
--

DROP TABLE IF EXISTS `artistasalbumes`;
/*!50001 DROP VIEW IF EXISTS `artistasalbumes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artistasalbumes` AS SELECT 
 1 AS `Artista`,
 1 AS `Album`,
 1 AS `Publicacion`,
 1 AS `Genero`,
 1 AS `Reproducciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `Duracion` int DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `AlbumID` int unsigned DEFAULT NULL,
  `ArtistaID` int unsigned DEFAULT NULL,
  `Compositores` varchar(100) DEFAULT NULL,
  `Letra` text,
  PRIMARY KEY (`ID`),
  KEY `AlbumID` (`AlbumID`),
  KEY `ArtistaID` (`ArtistaID`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `albumes` (`ID`),
  CONSTRAINT `canciones_ibfk_2` FOREIGN KEY (`ArtistaID`) REFERENCES `artistas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,'Chantaje',3,'Pop',1,1,'Shakira, Maluma','Letra de Chantaje...'),(2,'Yellow',4,'Rock',2,2,'Coldplay','Letra de Yellow...'),(3,'Shake It Off',3,'Pop',3,3,'Taylor Swift','Letra de Shake It Off...'),(4,'Fuego',4,'Pop Rock',4,4,'Juanes','Letra de Fuego...'),(5,'Enter Sandman',5,'Heavy Metal',5,5,'Hetfield, Ulrich, Hammett','Letra de Enter Sandman...'),(6,'Halo',4,'R&B',6,6,'Beyoncé, Tedder, Bogart','Letra de Halo...'),(7,'Shape of You',3,'Pop',7,7,'Ed Sheeran, McDaid','Letra de Shape of You...'),(8,'Rolling in the Deep',4,'Soul',8,8,'Adele, Epworth','Letra de Rolling in the Deep...'),(9,'Just the Way You Are',3,'Pop',9,9,'Bruno Mars, Lawrence, Levine','Letra de Just the Way You Are...'),(10,'Love the Way You Lie',4,'Hip Hop',10,10,'Eminem, Rihanna, Hafferman','Letra de Love the Way You Lie...'),(11,'Diamonds',3,'R&B',11,11,'Sia, Furler, Braide','Letra de Diamonds...'),(12,'Blinding Lights',4,'R&B',12,12,'The Weeknd, Balshe','Letra de Blinding Lights...'),(13,'Sorry',3,'Pop',13,13,'Justin Bieber, Tranter, Michaels','Letra de Sorry...'),(14,'positions',3,'Pop',14,14,'Ariana Grande, Victoria Monét','Letra de positions...'),(15,'Hotline Bling',4,'Hip Hop',15,15,'Drake, Shebib','Letra de Hotline Bling...');
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cancionesalbumes`
--

DROP TABLE IF EXISTS `cancionesalbumes`;
/*!50001 DROP VIEW IF EXISTS `cancionesalbumes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cancionesalbumes` AS SELECT 
 1 AS `Cancion`,
 1 AS `Album`,
 1 AS `Duracion`,
 1 AS `Genero`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Contenido` text,
  `FechaPublicacion` date DEFAULT NULL,
  `UsuarioID` int unsigned DEFAULT NULL,
  `AlbumID` int unsigned DEFAULT NULL,
  `Likes` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`ID`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`AlbumID`) REFERENCES `albumes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Gran álbum, muchas gracias por la música!','2023-01-25',1,1,15),(2,'Una obra maestra, no puedo dejar de escucharla','2023-02-28',2,2,10),(3,'Sus canciones son adictivas, me encantan!','2023-03-10',3,3,20),(4,'Una excelente producción, cada canción es especial','2023-04-15',4,4,12),(5,'Un clásico del metal, imprescindible en mi lista','2023-05-20',5,5,18),(6,'Me llega al corazón, increíble voz y letras','2023-06-25',6,6,25),(7,'Perfecto para bailar y disfrutar en cualquier momento','2023-07-30',7,7,30),(8,'Cada canción cuenta una historia fascinante','2023-08-05',8,8,14),(9,'Sencillamente genial, no puedo dejar de escucharlo','2023-09-10',9,9,22),(10,'Impactante, su letra me ha dejado sin palabras','2023-10-15',10,10,16),(11,'Su voz es increíble, una joya del R&B moderno','2023-11-20',11,11,28),(12,'No hay álbum que supere a este en mi colección','2023-12-25',12,12,32),(13,'Cada canción es un viaje musical único','2024-01-30',13,13,19),(14,'Una mezcla perfecta de ritmo y letras emotivas','2024-02-15',14,14,24),(15,'Su música me transporta a otro lugar','2024-03-20',15,15,27);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertComentario` AFTER INSERT ON `comentarios` FOR EACH ROW BEGIN
    DECLARE album_id INT;
    DECLARE total_comentarios INT;

    SET album_id = NEW.AlbumID;

    SELECT COUNT(*) INTO total_comentarios FROM Comentarios WHERE AlbumID = album_id;

    UPDATE Albumes SET NroComentarios = total_comentarios WHERE ID = album_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `comentariosusuarios`
--

DROP TABLE IF EXISTS `comentariosusuarios`;
/*!50001 DROP VIEW IF EXISTS `comentariosusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comentariosusuarios` AS SELECT 
 1 AS `Usuario`,
 1 AS `Comentario`,
 1 AS `FechaPublicacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Ubicacion` varchar(100) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ArtistaID` int unsigned DEFAULT NULL,
  `Duracion` int DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArtistaID` (`ArtistaID`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`ArtistaID`) REFERENCES `artistas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Global Music Festival','Londres','2023-07-15',1,360,'Festival'),(2,'Rock Legends Tour','Los Angeles','2023-08-20',2,300,'Concierto'),(3,'Pop Extravaganza','Nueva York','2023-09-25',3,240,'Concierto'),(4,'Hip Hop Nation','Chicago','2023-10-30',4,270,'Festival'),(5,'R&B Showcase','Atlanta','2023-11-15',5,240,'Concierto'),(6,'Indie Fest','Portland','2023-12-20',6,300,'Festival'),(7,'Electro City','Berlín','2024-01-25',7,240,'Concierto'),(8,'Latin Heat','Miami','2024-02-28',8,270,'Festival'),(9,'Jazz Night','Nueva Orleans','2024-03-15',9,180,'Concierto'),(10,'Reggae Roots','Kingston','2024-04-20',10,210,'Festival'),(11,'K-pop Explosion','Seúl','2024-05-25',11,240,'Concierto'),(12,'Funk Groove Party','São Paulo','2024-06-30',12,180,'Festival'),(13,'Country Roads Fest','Nashville','2024-07-15',13,240,'Concierto'),(14,'Blues Revival','Chicago','2024-08-20',13,210,'Festival'),(15,'Electronic Odyssey','Amsterdam','2024-09-25',14,270,'Concierto');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `eventosartistas`
--

DROP TABLE IF EXISTS `eventosartistas`;
/*!50001 DROP VIEW IF EXISTS `eventosartistas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eventosartistas` AS SELECT 
 1 AS `Evento`,
 1 AS `Ubicacion`,
 1 AS `Fecha`,
 1 AS `ArtistaID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fandom`
--

DROP TABLE IF EXISTS `fandom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fandom` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `Contenido` text,
  `FechaPublicacion` date DEFAULT NULL,
  `UsuarioID` int unsigned DEFAULT NULL,
  `ArtistaID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `ArtistaID` (`ArtistaID`),
  CONSTRAINT `fandom_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`ID`),
  CONSTRAINT `fandom_ibfk_2` FOREIGN KEY (`ArtistaID`) REFERENCES `artistas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fandom`
--

LOCK TABLES `fandom` WRITE;
/*!40000 ALTER TABLE `fandom` DISABLE KEYS */;
INSERT INTO `fandom` VALUES (1,'Shakira Fans Club','Comunidad de fans de Shakira alrededor del mundo.','2023-01-15',1,1),(2,'Coldplay Enthusiasts','Fans de Coldplay compartiendo noticias y conciertos.','2023-02-20',2,2),(3,'Swifties United','Dedicado a los fans de Taylor Swift con eventos y discusiones.','2023-03-05',3,3),(4,'Juanes Admirers','Seguidores de Juanes disfrutando de su música y conciertos.','2023-04-10',4,4),(5,'Metallica Nation','Comunidad de fanáticos de Metallica en todo el mundo.','2023-05-15',5,5),(6,'Beyhive Community','Fans de Beyoncé discutiendo su música y actuaciones.','2023-06-20',6,6),(7,'Sheerios Gathering','Seguidores de Ed Sheeran compartiendo experiencias y covers.','2023-07-25',7,7),(8,'Daydreamers Lounge','Comunidad dedicada a los fans de Adele con noticias y contenido.','2023-08-30',8,8),(9,'Hooligans Hangout','Punto de encuentro para los fans de Bruno Mars.','2023-09-05',9,9),(10,'Eminem Stans','Seguidores de Eminem discutiendo sus letras y colaboraciones.','2023-10-10',10,10),(11,'Rihanna Navy','Comunidad global de fans de Rihanna compartiendo amor por su música.','2023-11-15',11,11),(12,'Weeknd Warriors','Fans de The Weeknd conectando sobre su música y espectáculos.','2023-12-20',12,12),(13,'Beliebers Hub','Dedicado a los fanáticos de Justin Bieber con noticias y videos.','2024-01-25',13,13),(14,'Arianators Zone','Espacio para los seguidores de Ariana Grande discutir su música.','2024-02-28',14,14),(15,'Drake Community','Comunidad de fans de Drake compartiendo remixes y opiniones.','2024-03-05',15,15),(16,'Top 10 Canciones de Shakira','Descubre cuáles son las mejores canciones de Shakira según nuestros fanáticos.','2023-06-10',1,1),(17,'Coldplay: La Evolución de su Estilo','Exploramos cómo ha evolucionado el estilo musical de Coldplay a lo largo de los años.','2023-07-15',2,2),(18,'Taylor Swift: La Reina del Pop','Un análisis detallado del impacto de Taylor Swift en la industria musical actual.','2023-08-20',3,3),(19,'Juanes: Icono de la Música Latina','Descubre la trayectoria musical y el impacto de Juanes en la música latina.','2023-09-25',4,4),(20,'Metallica: Leyendas del Heavy Metal','Exploramos la historia y el legado de Metallica en la escena del heavy metal.','2023-10-30',5,5),(21,'El Legado de Beyoncé en el R&B','Analizamos la influencia de Beyoncé en el género del R&B y su impacto en la cultura popular.','2023-11-05',6,6),(22,'Ed Sheeran: El Cantautor Británico','Un vistazo a la carrera musical y las canciones más destacadas de Ed Sheeran.','2023-12-10',7,7),(23,'Adele: La Voz de la Emoción','Recorremos la emotiva música de Adele y su impacto en la industria musical.','2024-01-15',8,8),(24,'Bruno Mars: El Rey de la Fusión Musical','Descubre cómo Bruno Mars combina diferentes estilos musicales en su obra.','2024-02-20',9,9),(25,'Eminem: El Maestro del Rap','Exploramos la carrera de Eminem y su influencia en la escena del rap internacional.','2024-03-25',10,10),(26,'Rihanna: Icono de la Moda y la Música','Un repaso por la carrera musical y el impacto de Rihanna en la industria del entretenimiento.','2024-04-30',11,11),(27,'The Weeknd: El Talento Canadiense','Analizamos la música única y el estilo de The Weeknd en la escena musical actual.','2024-05-05',12,12),(28,'Justin Bieber: Evolución de una Estrella','Exploramos el crecimiento artístico y personal de Justin Bieber a lo largo de los años.','2024-06-10',13,13),(29,'Ariana Grande: La Voz Angelical','Un recorrido por las canciones más emblemáticas y la voz única de Ariana Grande.','2024-07-15',14,14),(30,'Drake: El Fenómeno del Hip Hop','Descubre cómo Drake ha dominado la escena del hip hop con su música innovadora.','2024-08-20',15,15);
/*!40000 ALTER TABLE `fandom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fandomusuarios`
--

DROP TABLE IF EXISTS `fandomusuarios`;
/*!50001 DROP VIEW IF EXISTS `fandomusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fandomusuarios` AS SELECT 
 1 AS `Usuario`,
 1 AS `Artista`,
 1 AS `Titulo`,
 1 AS `Contenido`,
 1 AS `FechaPublicacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `UsuarioID` int unsigned DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Privacidad` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Favoritas','Mis canciones favoritas de todos los tiempos',1,'2023-01-20','Privada'),(2,'Rock Classics','Clásicos del rock de todas las décadas',4,'2023-02-25','Pública'),(3,'Pop Hits','Éxitos pop actuales y clásicos',7,'2023-03-10','Pública'),(4,'Hip Hop Vibes','Las mejores pistas de hip hop para fiestas',10,'2023-04-15','Privada'),(5,'Chill R&B','Música R&B relajante para escuchar en cualquier momento',13,'2023-05-20','Pública'),(6,'Metal Mayhem','La esencia del metal en una lista de reproducción',2,'2023-06-25','Pública'),(7,'Indie Soundscapes','Sonidos únicos del mundo del indie',5,'2023-07-30','Pública'),(8,'Electro Beats','Ritmos electrónicos para tus sesiones de ejercicio',8,'2023-08-05','Privada'),(9,'Latin Vibes','La música latina más caliente del momento',11,'2023-09-10','Pública'),(10,'Jazz Lounge','Ambiente de jazz para una noche relajante',14,'2023-10-15','Pública'),(11,'Reggaetón Party','Los mejores éxitos de reggaetón para una fiesta inolvidable',3,'2023-11-20','Privada'),(12,'K-pop Hits','Éxitos del K-pop para los fanáticos del género',6,'2023-12-25','Pública'),(13,'Funk Grooves','Grooves funky para mover el esqueleto',9,'2024-01-30','Pública'),(14,'Country Roads','Canciones country para el alma',12,'2024-02-15','Pública'),(15,'Blues Session','Sesión de blues para los amantes del género',15,'2024-03-20','Pública');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `PreferenciasMusicales` varchar(100) DEFAULT NULL,
  `FechaRegistro` date DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Maria González','maria@example.com','Pop, Rock','2023-01-15','1995-03-10','España'),(2,'John Smith','john@example.com','Pop, Hip Hop','2023-02-20','1990-05-25','Estados Unidos'),(3,'Laura Martínez','laura@example.com','Pop, R&B','2023-03-05','1988-08-15','México'),(4,'David Johnson','david@example.com','Rock, Metal','2023-04-10','1985-11-20','Reino Unido'),(5,'Ana Pérez','ana@example.com','R&B, Soul','2023-05-15','1998-02-12','Colombia'),(6,'Michael Brown','michael@example.com','Pop, Hip Hop','2023-06-20','1993-07-05','Canadá'),(7,'Sophia Rodriguez','sophia@example.com','Pop, R&B','2023-07-25','1997-09-30','Argentina'),(8,'Daniel Lee','daniel@example.com','Rock, Indie','2023-08-30','1987-12-03','Australia'),(9,'Emma White','emma@example.com','Pop, Indie','2023-09-05','1994-01-18','Francia'),(10,'Alexis Taylor','alexis@example.com','Hip Hop, R&B','2023-10-10','1991-04-22','Alemania'),(11,'Luis Hernández','luis@example.com','Pop, Reggaetón','2023-11-15','1989-06-07','España'),(12,'Julia Kim','julia@example.com','Pop, Jazz','2023-12-20','1996-10-12','Corea del Sur'),(13,'Gabriel Garcia','gabriel@example.com','Rock, Metal','2024-01-25','1992-11-28','México'),(14,'Isabella Rossi','isabella@example.com','Pop, Electrónica','2024-02-28','1990-01-03','Italia'),(15,'Lucas Silva','lucas@example.com','Hip Hop, Funk','2024-03-05','1986-04-15','Brasil');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuariosconlistas`
--

DROP TABLE IF EXISTS `usuariosconlistas`;
/*!50001 DROP VIEW IF EXISTS `usuariosconlistas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuariosconlistas` AS SELECT 
 1 AS `Nombre`,
 1 AS `ListaReproduccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `artistasalbumes`
--

/*!50001 DROP VIEW IF EXISTS `artistasalbumes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artistasalbumes` AS select `artistas`.`Nombre` AS `Artista`,`albumes`.`Titulo` AS `Album`,`albumes`.`Publicacion` AS `Publicacion`,`albumes`.`Genero` AS `Genero`,`albumes`.`Reproducciones` AS `Reproducciones` from (`artistas` join `albumes` on((`artistas`.`ID` = `albumes`.`ArtistaID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cancionesalbumes`
--

/*!50001 DROP VIEW IF EXISTS `cancionesalbumes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cancionesalbumes` AS select `canciones`.`Titulo` AS `Cancion`,`albumes`.`Titulo` AS `Album`,`canciones`.`Duracion` AS `Duracion`,`canciones`.`Genero` AS `Genero` from (`canciones` join `albumes` on((`canciones`.`AlbumID` = `albumes`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `comentariosusuarios`
--

/*!50001 DROP VIEW IF EXISTS `comentariosusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comentariosusuarios` AS select `usuarios`.`Nombre` AS `Usuario`,`comentarios`.`Contenido` AS `Comentario`,`comentarios`.`FechaPublicacion` AS `FechaPublicacion` from (`usuarios` join `comentarios` on((`usuarios`.`ID` = `comentarios`.`UsuarioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eventosartistas`
--

/*!50001 DROP VIEW IF EXISTS `eventosartistas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eventosartistas` AS select `eventos`.`Nombre` AS `Evento`,`eventos`.`Ubicacion` AS `Ubicacion`,`eventos`.`Fecha` AS `Fecha`,`eventos`.`ArtistaID` AS `ArtistaID` from `eventos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fandomusuarios`
--

/*!50001 DROP VIEW IF EXISTS `fandomusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fandomusuarios` AS select `usuarios`.`Nombre` AS `Usuario`,`artistas`.`Nombre` AS `Artista`,`fandom`.`Titulo` AS `Titulo`,`fandom`.`Contenido` AS `Contenido`,`fandom`.`FechaPublicacion` AS `FechaPublicacion` from ((`fandom` join `usuarios` on((`fandom`.`UsuarioID` = `usuarios`.`ID`))) join `artistas` on((`fandom`.`ArtistaID` = `artistas`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuariosconlistas`
--

/*!50001 DROP VIEW IF EXISTS `usuariosconlistas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuariosconlistas` AS select `usuarios`.`Nombre` AS `Nombre`,`playlists`.`Nombre` AS `ListaReproduccion` from (`usuarios` join `playlists` on((`usuarios`.`ID` = `playlists`.`UsuarioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 18:22:18
