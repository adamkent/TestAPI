-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: studdb.csc.liv.ac.uk    Database: sgakent
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `requesting`
--

DROP TABLE IF EXISTS `requesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requesting` (
  `researcherid` int NOT NULL,
  `description` varchar(500) NOT NULL,
  `email_address` varchar(25) NOT NULL,
  PRIMARY KEY (`researcherid`,`description`,`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requesting`
--

LOCK TABLES `requesting` WRITE;
/*!40000 ALTER TABLE `requesting` DISABLE KEYS */;
INSERT INTO `requesting` VALUES (2,'wef','df'),(4,'Adam','Kent'),(4,'aden','erfg\'lo.com'),(5,'k l','lol@lol.com'),(8,'adam','lol@lol.com'),(12,'adam k','sfd@sdf.com');
/*!40000 ALTER TABLE `requesting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researcher`
--

DROP TABLE IF EXISTS `researcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researcher` (
  `researcherid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `researcher` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`researcherid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researcher`
--

LOCK TABLES `researcher` WRITE;
/*!40000 ALTER TABLE `researcher` DISABLE KEYS */;
INSERT INTO `researcher` VALUES (1,'E. M. Clark, O. Grumberg and D. A. Peled: Model Checking. MIT Press, 1999','Connie'),(2,'J. A. Goguen and G. Malcolm: Software Engineering with OBJ. Kluwer, 2000.','Anne'),(3,'M. Huth and M. Ryan: Logic in Computer Science: Modelling and Reasoning about Systems. Cambridge University Press, 2004.','Bob'),(4,'M. Huth and M. Ryan: Logic in Computer Science: Modelling and Reasoning about Systems. Cambridge University Press, 2004.','Bob'),(5,'M. Huth and M. Ryan: Logic in Computer Science: Modelling and Reasoning about Systems. Cambridge University Press, 2004.','Connie'),(6,'M. Huth and M. Ryan: Logic in Computer Science: Modelling and Reasoning about Systems. Cambridge University Press, 2004.','Dean'),(7,'J.-J. Ch. Meyer and W. van der Hoek: Epistemic Logic for AI and Computer Science. Cambridge University Press, 1995.','Connie'),(8,'J.-J. Ch. Meyer and W. van der Hoek: Epistemic Logic for AI and Computer Science. Cambridge University Press, 1995.','Connie'),(9,'W. Stallings: Network Security Essentials: Applications and Standards. Prentice Hall, 2000.','Anne'),(10,'W. Stallings: Network Security Essentials: Applications and Standards. Prentice Hall, 2000.','Bob'),(11,'W. Stallings: Network Security Essentials: Applications and Standards. Prentice Hall, 2000.','Dean'),(12,'I. Witten and E. Frank: Data Mining: Practical Machine Learning Tools and Techniques. Morgan Kaufmann, 2005.','Dean');
/*!40000 ALTER TABLE `researcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `researchercount`
--

DROP TABLE IF EXISTS `researchercount`;
/*!50001 DROP VIEW IF EXISTS `researchercount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `researchercount` (
  `researchercount` tinyint NOT NULL,
  `stock` tinyint NOT NULL,
  `researcherid` tinyint NOT NULL,
  `researcher` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `available`
--

/*!50001 DROP TABLE IF EXISTS `available`*/;
/*!50001 DROP VIEW IF EXISTS `available`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgakent`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available` AS select `s`.`researcherid` AS `researcherid`,`c`.`stock` AS `stock`,(`c`.`stock` - ifnull(`sc`.`researchercount`,0)) AS `remain`,`c`.`description` AS `description`,`s`.`researcher` AS `researcher` from (`book` `c` join (`researcher` `s` left join `researchercount` `sc` on((`sc`.`researcherid` = `s`.`researcherid`)))) where (`s`.`description` = `c`.`description`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `researchercount`
--

/*!50001 DROP TABLE IF EXISTS `researchercount`*/;
/*!50001 DROP VIEW IF EXISTS `researchercount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgakent`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `researchercount` AS select count(0) AS `researchercount`,`c`.`stock` AS `stock`,`s`.`researcherid` AS `researcherid`,`s`.`researcher` AS `researcher` from ((`requesting` `b` join `book` `c`) join `researcher` `s`) where ((`b`.`researcherid` = `s`.`researcherid`) and (`s`.`description` = `c`.`description`)) group by `s`.`researcherid` */;
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

-- Dump completed on 2021-08-11 16:18:07
