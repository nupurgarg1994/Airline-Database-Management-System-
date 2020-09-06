CREATE DATABASE  IF NOT EXISTS `airlines` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `airlines`;
-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: airlines
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airliner`
--

DROP TABLE IF EXISTS `airliner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airliner` (
  `airlinerId` varchar(20) NOT NULL,
  `airlinerName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`airlinerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airliner`
--

LOCK TABLES `airliner` WRITE;
/*!40000 ALTER TABLE `airliner` DISABLE KEYS */;
INSERT INTO `airliner` VALUES ('12','hyange'),('13','chandler'),('6','Qatar Airways'),('al1','Nupur'),('al2','kelvin'),('al3','mahesh'),('al4','shreya'),('al5','ashu');
/*!40000 ALTER TABLE `airliner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airplane` (
  `airplaneId` varchar(20) NOT NULL,
  `airlinerId` varchar(20) DEFAULT NULL,
  `modelId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`airplaneId`),
  KEY `airlinerId` (`airlinerId`),
  KEY `modelId` (`modelId`),
  CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`airlinerId`) REFERENCES `airliner` (`airlinerid`),
  CONSTRAINT `airplane_ibfk_2` FOREIGN KEY (`modelId`) REFERENCES `models` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES ('ap1','al1','m1'),('ap2','al2','m2'),('ap3','al3','m3'),('ap4','al4','m4'),('ap5','al5','m5');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `availableseats`
--

DROP TABLE IF EXISTS `availableseats`;
/*!50001 DROP VIEW IF EXISTS `availableseats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `availableseats` AS SELECT 
 1 AS `seatId`,
 1 AS `flightName`,
 1 AS `source`,
 1 AS `destination`,
 1 AS `availibility`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `custId` varchar(20) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('c1','Kelvin','Julka',86),('c2','Nupur','Garg',80),('c3','Karan','Garg',70),('c4','Vinay','Goyal',60),('c5','Aayush','Jain',50);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flight` (
  `flight_id` varchar(20) NOT NULL,
  `flightName` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `dateandTime` datetime DEFAULT NULL,
  `airlinerId` varchar(20) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  `airplaneId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `airlinerId` (`airlinerId`),
  KEY `airplaneId` (`airplaneId`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airlinerId`) REFERENCES `airliner` (`airlinerid`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`airplaneId`) REFERENCES `airplane` (`airplaneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('6','QATAR','Delhi','2018-02-03 00:00:00','al5',15,'USA','6'),('F1','Qatar Airways','London','1000-01-01 00:00:00','al1',10,'Boston','ap1'),('F2','Emirates','UK','2018-02-02 00:00:00','al2',12,'New York','ap2'),('F3','KLM','Pune','2018-02-01 00:00:00','al3',14,'New Yark','ap3'),('F4','Indigo','Baltimore','2018-04-09 00:00:00','al4',10,'Bangalore','ap4'),('F5','Air Asia','Delhi','2018-02-03 00:00:00','al5',15,'USA','ap5');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `models` (
  `modelId` varchar(20) NOT NULL,
  `modelName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES ('m1','model1'),('m2','model2'),('m3','model3'),('m4','model4'),('m5','model5');
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `searchflight`
--

DROP TABLE IF EXISTS `searchflight`;
/*!50001 DROP VIEW IF EXISTS `searchflight`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `searchflight` AS SELECT 
 1 AS `flight_id`,
 1 AS `dateandTime`,
 1 AS `duration`,
 1 AS `airlinerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seat` (
  `seatId` varchar(20) NOT NULL,
  `flight_id` varchar(20) DEFAULT NULL,
  `availibility` int(20) DEFAULT NULL,
  PRIMARY KEY (`seatId`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('s1','F1',60),('s2','F2',40),('s3','F3',30),('s4','F4',20),('s5','F5',70),('s7','F7',60),('s8','F8',80);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `staffId` char(20) NOT NULL,
  `flight_id` char(20) DEFAULT NULL,
  `staffName` char(40) DEFAULT NULL,
  PRIMARY KEY (`staffId`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('s1','F1','Nupur Garg'),('s2','F2','sneha'),('s3','F3','lavu'),('s4','F4','yash'),('s5','F5','chetan');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket` (
  `ticketId` varchar(20) NOT NULL,
  `custName` varchar(40) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `custId` varchar(20) DEFAULT NULL,
  `seatId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `custId` (`custId`),
  KEY `seatId` (`seatId`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `customer` (`custid`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seatId`) REFERENCES `seat` (`seatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('t1','Kelvin julka',1000,'c1','s1'),('t2','ashu',1400,'c2','s2'),('t3','neha',1500,'c3','s3'),('t4','riya',1790,'c4','s4'),('t5','ram',2000,'c5','s5'),('t6','katrina',3000,'c6','s6'),('t7','emma',3000,'c7','s7');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteBookedSeats` AFTER INSERT ON `ticket` FOR EACH ROW begin
update seat 
set availibility = 60
where seatId = new.seatId;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `fullName`,
 1 AS `custid`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'airlines'
--

--
-- Dumping routines for database 'airlines'
--
/*!50003 DROP FUNCTION IF EXISTS `getTraffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTraffic`(s varchar(20)) RETURNS int(11)
    DETERMINISTIC
begin
declare value int;
set value = (select count(*) from flight where Flight_Id = s);
return value;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getItinerary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getItinerary`(IN CustomerNo int)
begin
select f.flight_Id, ticketId,s.seatId, CustName ,  Source, Destination,Price, f.DateAndTime,f.duration,a.airlinerName
from ticket t 
inner join seat s on t.SeatId = s.SeatId 
inner join flight f on s.Flight_Id = f.flight_Id
inner join Airliner a on f.AirlinerId = a.AirlinerId
-- inner join Source sou on f.FlightSourceId = sou.SourceId 
-- inner join Destination d on f.flightDestinationId = d.DestinationId 
inner join customer c on t.custId = c.custId 
where c.custId = customerNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlan`(in custId int(3))
Begin
select f.flight_id, f.flightName, concat_ws(" ",fname,lname) as fullName, a.airlinerId 
from customer inner join ticket  t on c.custId=t.custId
inner join seat s on t.seatId=s.seatId
inner join flight f on s.flight_id=f.flight_id
inner join  airliner a on f.airlinerId=a.airlinerId;


End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlan1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlan1`(in custId varchar(20))
Begin
select f.flight_id, f.flightName, concat_ws(" ",fname,lname) as fullName, a.airlinerId 
from customer inner join ticket  t on c.custId=t.custId
inner join seat s on t.seatId=s.seatId
inner join flight f on s.flight_id=f.flight_id
inner join  airliner a on f.airlinerId=a.airlinerId;


End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `availableseats`
--

/*!50001 DROP VIEW IF EXISTS `availableseats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availableseats` AS select `S`.`seatId` AS `seatId`,`F`.`flightName` AS `flightName`,`F`.`source` AS `source`,`F`.`destination` AS `destination`,`S`.`availibility` AS `availibility` from (`seat` `S` join `flight` `F` on((`F`.`flight_id` = `S`.`flight_id`))) where (`F`.`airlinerId` = (select `al`.`airlinerId` from `airliner` `al` where (`al`.`airlinerId` = `F`.`airlinerId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchflight`
--

/*!50001 DROP VIEW IF EXISTS `searchflight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchflight` AS select `F`.`flight_id` AS `flight_id`,`F`.`dateandTime` AS `dateandTime`,`F`.`duration` AS `duration`,`A`.`airlinerName` AS `airlinerName` from (`flight` `F` join `airliner` `A` on((`A`.`airlinerId` = `F`.`airlinerId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select concat(`c`.`fname`,' ',`c`.`lname`) AS `fullName`,`c`.`custId` AS `custid` from ((`customer` `c` join `ticket` `t`) join `seat` `s`) where ((`c`.`custId` = `t`.`custId`) and (`t`.`seatId` = `s`.`seatId`)) order by `c`.`custId` */;
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

-- Dump completed on 2018-12-13 11:33:13
