-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DB_TxC_TESTING
-- ------------------------------------------------------
-- Server version	5.6.17-0ubuntu0.14.04.1

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
-- Table structure for table `Link_DTT_tax_type_tax_levies`
--

DROP TABLE IF EXISTS `Link_DTT_tax_type_tax_levies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link_DTT_tax_type_tax_levies` (
  `id_tax_levies` int(11) NOT NULL,
  `id_type_of_tax` int(11) NOT NULL,
  `Grouping_for_a_DTT` varchar(45) NOT NULL,
  PRIMARY KEY (`Grouping_for_a_DTT`,`id_type_of_tax`,`id_tax_levies`),
  KEY `fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tp_of_tax_KEY_id_type_of_tax` (`id_type_of_tax`),
  KEY `fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tax_lvs_KEY_id_tax_levies` (`id_tax_levies`),
  KEY `fk_1_LK_DTT_tx_tp_tx_lvs_2_Tbl_Pts_to_a_DTT_KEY_Gpg_for_a_DTT` (`Grouping_for_a_DTT`),
  CONSTRAINT `fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tp_of_tax_KEY_id_type_of_tax` FOREIGN KEY (`id_type_of_tax`) REFERENCES `Table_type_of_tax` (`id_type_of_tax`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_DTT_tax_type_tax_lvs_2_Tbl_tax_lvs_KEY_id_tax_levies` FOREIGN KEY (`id_tax_levies`) REFERENCES `Table_tax_levies` (`id_tax_levies`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_DTT_tx_tp_tx_lvs_2_Tbl_Pts_to_a_DTT_KEY_Gpg_for_a_DTT` FOREIGN KEY (`Grouping_for_a_DTT`) REFERENCES `Table_parties_to_a_DTT` (`Grouping_for_a_DTT`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link_DTT_tax_type_tax_levies`
--

LOCK TABLES `Link_DTT_tax_type_tax_levies` WRITE;
/*!40000 ALTER TABLE `Link_DTT_tax_type_tax_levies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Link_DTT_tax_type_tax_levies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Link_Tax_jurisdiction_Tax_levies_Type_of_tax`
--

DROP TABLE IF EXISTS `Link_Tax_jurisdiction_Tax_levies_Type_of_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link_Tax_jurisdiction_Tax_levies_Type_of_tax` (
  `id_tax_juridiction` int(11) NOT NULL,
  `id_tax_levies` int(11) NOT NULL,
  `id_type_of_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_juridiction`,`id_tax_levies`,`id_type_of_tax`),
  KEY `fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_jdn_KEY_id_tax_jdn` (`id_tax_juridiction`),
  KEY `fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tp_of_tx_KEY_id_tp_of_tax` (`id_type_of_tax`),
  KEY `fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tx_lvs_KEY_id_tax_levies` (`id_tax_levies`),
  CONSTRAINT `fk_1_LK_Tax_jdn_Tax_lvs_Type_of_tax_2_Tbl_tax_jdn_KEY_id_tax_jdn` FOREIGN KEY (`id_tax_juridiction`) REFERENCES `Table_tax_jurisdiction` (`id_tax_jurisdiction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_Tx_jdn_Tx_lvs_Tp_of_tx_2_Tbl_tp_of_tx_KEY_id_tp_of_tax` FOREIGN KEY (`id_type_of_tax`) REFERENCES `Table_type_of_tax` (`id_type_of_tax`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_Tx_jdn_Tx_lvs_Type_of_tx_2_Tbl_tx_lvs_KEY_id_tax_levies` FOREIGN KEY (`id_tax_levies`) REFERENCES `Table_tax_levies` (`id_tax_levies`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link_Tax_jurisdiction_Tax_levies_Type_of_tax`
--

LOCK TABLES `Link_Tax_jurisdiction_Tax_levies_Type_of_tax` WRITE;
/*!40000 ALTER TABLE `Link_Tax_jurisdiction_Tax_levies_Type_of_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `Link_Tax_jurisdiction_Tax_levies_Type_of_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Link_tax_jurisdiction_allowance_type`
--

DROP TABLE IF EXISTS `Link_tax_jurisdiction_allowance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link_tax_jurisdiction_allowance_type` (
  `id_allowance` int(11) NOT NULL,
  `id_type_of_allowance` int(11) NOT NULL,
  `id_tax_jurisdiction` int(11) NOT NULL,
  `id_allowance_requirements` int(11) NOT NULL,
  PRIMARY KEY (`id_allowance`,`id_type_of_allowance`,`id_tax_jurisdiction`,`id_allowance_requirements`),
  KEY `fk_1_LK_tax_jdn_awc_type_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` (`id_tax_jurisdiction`),
  KEY `fk_1_LK_tax_jdn_awc_tp_2_Tbl_tp_of_awc_KEY_id_type_of_allowance` (`id_type_of_allowance`),
  KEY `fk_1_LK_tax_jdn_awc_type_2_Tbl_awc_rates_KEY_id_allowance` (`id_allowance`),
  KEY `fk_1_LK_tx_jdn_awc_tp_2_Tbl_awc_rqt_KEY_id_allowance_rqt` (`id_allowance_requirements`),
  CONSTRAINT `fk_1_LK_tax_jdn_awc_type_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` FOREIGN KEY (`id_tax_jurisdiction`) REFERENCES `Table_tax_jurisdiction` (`id_tax_jurisdiction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_tax_jdn_awc_tp_2_Tbl_tp_of_awc_KEY_id_type_of_allowance` FOREIGN KEY (`id_type_of_allowance`) REFERENCES `Table_type_of_allowance` (`id_type_of_allowance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_tax_jdn_awc_type_2_Tbl_awc_rates_KEY_id_allowance` FOREIGN KEY (`id_allowance`) REFERENCES `Table_allowance_rates` (`id_allowance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_tx_jdn_awc_tp_2_Tbl_awc_rqt_KEY_id_allowance_rqt` FOREIGN KEY (`id_allowance_requirements`) REFERENCES `Table_allowance_requirements` (`id_allowance_requirements`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link_tax_jurisdiction_allowance_type`
--

LOCK TABLES `Link_tax_jurisdiction_allowance_type` WRITE;
/*!40000 ALTER TABLE `Link_tax_jurisdiction_allowance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Link_tax_jurisdiction_allowance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Link_type_of_tax_and_economic_activity`
--

DROP TABLE IF EXISTS `Link_type_of_tax_and_economic_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link_type_of_tax_and_economic_activity` (
  `id_type_of_economic_activity` int(11) NOT NULL,
  `id_type_of_tax` int(11) NOT NULL,
  `id_Link_type_of_tax_and_economic_activity` int(11) NOT NULL,
  PRIMARY KEY (`id_Link_type_of_tax_and_economic_activity`,`id_type_of_tax`,`id_type_of_economic_activity`),
  UNIQUE KEY `id_Link_type_of_tax_and_economic_activity_UNIQUE` (`id_Link_type_of_tax_and_economic_activity`),
  KEY `fk_1_LK_tp_f_tx_and_enc_avy_2_Tbl_tp_f_enc_avy_KEY_tp_of_enc_avy` (`id_type_of_economic_activity`),
  KEY `fk_1_LK_tp_of_tax_and_enc_avy_2_Tbl_tp_of_tax_KEY_id_type_o_idx` (`id_type_of_tax`),
  CONSTRAINT `fk_1_LK_tp_of_tax_and_enc_avy_2_Tbl_tp_of_tax_KEY_id_type_of_tax` FOREIGN KEY (`id_type_of_tax`) REFERENCES `Table_type_of_tax` (`id_type_of_tax`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_LK_tp_f_tx_d_enc_avy_2_Tbl_tp_f_enc_avy_KEY_tp_f_enc_avy` FOREIGN KEY (`id_type_of_economic_activity`) REFERENCES `Table_type_of_economic_activity` (`id_type_of_economic_activity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link_type_of_tax_and_economic_activity`
--

LOCK TABLES `Link_type_of_tax_and_economic_activity` WRITE;
/*!40000 ALTER TABLE `Link_type_of_tax_and_economic_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `Link_type_of_tax_and_economic_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LookUp_scope_of_tax`
--

DROP TABLE IF EXISTS `LookUp_scope_of_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LookUp_scope_of_tax` (
  `scope_of_tax` varchar(45) NOT NULL,
  PRIMARY KEY (`scope_of_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LookUp_scope_of_tax`
--

LOCK TABLES `LookUp_scope_of_tax` WRITE;
/*!40000 ALTER TABLE `LookUp_scope_of_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `LookUp_scope_of_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LookUp_time_requirement_of_tax`
--

DROP TABLE IF EXISTS `LookUp_time_requirement_of_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LookUp_time_requirement_of_tax` (
  `time_requirement` varchar(45) NOT NULL,
  `holding_period` int(11) NOT NULL,
  `measurement_of_holding_period` varchar(45) NOT NULL,
  PRIMARY KEY (`time_requirement`,`holding_period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LookUp_time_requirement_of_tax`
--

LOCK TABLES `LookUp_time_requirement_of_tax` WRITE;
/*!40000 ALTER TABLE `LookUp_time_requirement_of_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `LookUp_time_requirement_of_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store_personal_information`
--

DROP TABLE IF EXISTS `Store_personal_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Store_personal_information` (
  `id_person_search` int(11) NOT NULL AUTO_INCREMENT,
  `residence` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_person_search`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store_personal_information`
--

LOCK TABLES `Store_personal_information` WRITE;
/*!40000 ALTER TABLE `Store_personal_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `Store_personal_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_allowance_rates`
--

DROP TABLE IF EXISTS `Table_allowance_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_allowance_rates` (
  `id_allowance` int(11) NOT NULL,
  `allowance_type` varchar(45) DEFAULT NULL COMMENT 'Here, it will either be:',
  `start` varchar(45) DEFAULT NULL COMMENT 'This is when the allowance will kick off.',
  `currency` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_allowance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_allowance_rates`
--

LOCK TABLES `Table_allowance_rates` WRITE;
/*!40000 ALTER TABLE `Table_allowance_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_allowance_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_allowance_requirements`
--

DROP TABLE IF EXISTS `Table_allowance_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_allowance_requirements` (
  `id_allowance_requirements` int(11) NOT NULL,
  PRIMARY KEY (`id_allowance_requirements`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_allowance_requirements`
--

LOCK TABLES `Table_allowance_requirements` WRITE;
/*!40000 ALTER TABLE `Table_allowance_requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_allowance_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_allowance_residency_rules`
--

DROP TABLE IF EXISTS `Table_allowance_residency_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_allowance_residency_rules` (
  `id_allowance_requirements` int(11) NOT NULL,
  `Number_of_days` int(11) DEFAULT NULL,
  `Property_rules` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_allowance_requirements`),
  UNIQUE KEY `id_tax_juridiction_UNIQUE` (`id_allowance_requirements`),
  KEY `fk_1_Tbl_awc_rdc_rules_2_Tbl_awc_rqt_KEY_id_allowance_rqt` (`id_allowance_requirements`),
  CONSTRAINT `fk_1_Tbl_awc_rdc_rules_2_Tbl_awc_rqt_KEY_id_allowance_rqt` FOREIGN KEY (`id_allowance_requirements`) REFERENCES `Table_allowance_requirements` (`id_allowance_requirements`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_allowance_residency_rules`
--

LOCK TABLES `Table_allowance_residency_rules` WRITE;
/*!40000 ALTER TABLE `Table_allowance_residency_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_allowance_residency_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_allowance_wealth_requirements`
--

DROP TABLE IF EXISTS `Table_allowance_wealth_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_allowance_wealth_requirements` (
  `id_allowance_requirements` int(11) NOT NULL,
  `wealth_requirements` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_allowance_requirements`),
  KEY `fk_1_Tbl_awc_wth_rqt_2_Tbl_awc_rqt_KEY_id_allowance_requirements` (`id_allowance_requirements`),
  CONSTRAINT `fk_1_Tbl_awc_wth_rqt_2_Tbl_awc_rqt_KEY_id_allowance_requirements` FOREIGN KEY (`id_allowance_requirements`) REFERENCES `Table_allowance_requirements` (`id_allowance_requirements`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_allowance_wealth_requirements`
--

LOCK TABLES `Table_allowance_wealth_requirements` WRITE;
/*!40000 ALTER TABLE `Table_allowance_wealth_requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_allowance_wealth_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_financial_year`
--

DROP TABLE IF EXISTS `Table_financial_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_financial_year` (
  `id_tax_levies` int(11) NOT NULL,
  `financial_year_start` date NOT NULL,
  `financial_year_stop` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`financial_year_start`,`financial_year_stop`,`id_tax_levies`),
  KEY `fk_1_Table_financial_year_2_Table_tax_levies_KEY_id_tax_levies` (`id_tax_levies`),
  CONSTRAINT `fk_1_Table_financial_year_2_Table_tax_levies_KEY_id_tax_levies` FOREIGN KEY (`id_tax_levies`) REFERENCES `Table_tax_levies` (`id_tax_levies`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_financial_year`
--

LOCK TABLES `Table_financial_year` WRITE;
/*!40000 ALTER TABLE `Table_financial_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_financial_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_financial_year_allowance`
--

DROP TABLE IF EXISTS `Table_financial_year_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_financial_year_allowance` (
  `id_type_of_allowance` int(11) NOT NULL,
  `financial_year_start` date NOT NULL,
  `financial_year_stop` date NOT NULL,
  PRIMARY KEY (`financial_year_start`,`financial_year_stop`,`id_type_of_allowance`),
  KEY `fk_1_Tbl_fcl_year_awc_2_Tbl_tp_of_awc_KEY_id_type_of_allowance` (`id_type_of_allowance`),
  CONSTRAINT `fk_1_Tbl_fcl_year_awc_2_Tbl_tp_of_awc_KEY_id_type_of_allowance` FOREIGN KEY (`id_type_of_allowance`) REFERENCES `Table_type_of_allowance` (`id_type_of_allowance`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_financial_year_allowance`
--

LOCK TABLES `Table_financial_year_allowance` WRITE;
/*!40000 ALTER TABLE `Table_financial_year_allowance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_financial_year_allowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_parties_to_a_DTT`
--

DROP TABLE IF EXISTS `Table_parties_to_a_DTT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_parties_to_a_DTT` (
  `id_tax_jurisdiction` int(11) NOT NULL COMMENT 'I will do like id tax jurisdiction  1 and 2 belongs to one DTT(LT-UK)',
  `Grouping_for_a_DTT` varchar(45) NOT NULL,
  PRIMARY KEY (`Grouping_for_a_DTT`,`id_tax_jurisdiction`),
  UNIQUE KEY `Grouping_for_a_DTT_UNIQUE` (`Grouping_for_a_DTT`),
  KEY `fk_1_Tbl_parties_to_a_DTT_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` (`id_tax_jurisdiction`),
  CONSTRAINT `fk_1_Tbl_parties_to_a_DTT_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` FOREIGN KEY (`id_tax_jurisdiction`) REFERENCES `Table_tax_jurisdiction` (`id_tax_jurisdiction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_parties_to_a_DTT`
--

LOCK TABLES `Table_parties_to_a_DTT` WRITE;
/*!40000 ALTER TABLE `Table_parties_to_a_DTT` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_parties_to_a_DTT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_searched_information_by_users`
--

DROP TABLE IF EXISTS `Table_searched_information_by_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_searched_information_by_users` (
  `id_searched_info` int(11) NOT NULL,
  `residence` varchar(45) DEFAULT NULL,
  `size_of_income` varchar(45) DEFAULT NULL,
  `source_of_income` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `id_person_search` int(11) NOT NULL,
  PRIMARY KEY (`id_searched_info`,`id_person_search`),
  KEY `fk_1_Tbl_srd_info_by_users_2_Store_psl_info_key_id_person_search` (`id_person_search`),
  CONSTRAINT `fk_1_Tbl_srd_info_by_users_2_Store_psl_info_key_id_person_search` FOREIGN KEY (`id_person_search`) REFERENCES `Store_personal_information` (`id_person_search`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_searched_information_by_users`
--

LOCK TABLES `Table_searched_information_by_users` WRITE;
/*!40000 ALTER TABLE `Table_searched_information_by_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_searched_information_by_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_tax_jurisdiction`
--

DROP TABLE IF EXISTS `Table_tax_jurisdiction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_tax_jurisdiction` (
  `id_tax_jurisdiction` int(11) NOT NULL AUTO_INCREMENT,
  `name_tax_jurisdiction` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tax_jurisdiction`,`name_tax_jurisdiction`),
  UNIQUE KEY `id_tax_jurisdiction_UNIQUE` (`id_tax_jurisdiction`),
  KEY `fk_1_Tbl_tax_jdn_2_Tbl_tax_jdn_countries_KEY_id_tax_jurisdiction` (`id_tax_jurisdiction`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_tax_jurisdiction`
--

LOCK TABLES `Table_tax_jurisdiction` WRITE;
/*!40000 ALTER TABLE `Table_tax_jurisdiction` DISABLE KEYS */;
INSERT INTO `Table_tax_jurisdiction` VALUES (4,'EE');
/*!40000 ALTER TABLE `Table_tax_jurisdiction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_tax_jurisdiction_countries`
--

DROP TABLE IF EXISTS `Table_tax_jurisdiction_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_tax_jurisdiction_countries` (
  `id_tax_jurisdiction` int(11) NOT NULL,
  `name_country` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tax_jurisdiction`,`name_country`),
  KEY `Secondary` (`name_country`),
  CONSTRAINT `fk_1_Tbl_tx_jdn_cts_2_Tbl_tx_jdn_KEY_id_tax_jurisdiction` FOREIGN KEY (`id_tax_jurisdiction`) REFERENCES `Table_tax_jurisdiction` (`id_tax_jurisdiction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_tax_jurisdiction_countries`
--

LOCK TABLES `Table_tax_jurisdiction_countries` WRITE;
/*!40000 ALTER TABLE `Table_tax_jurisdiction_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_tax_jurisdiction_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_tax_jurisdiction_region`
--

DROP TABLE IF EXISTS `Table_tax_jurisdiction_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_tax_jurisdiction_region` (
  `name_country` varchar(45) NOT NULL,
  `id_tax_jurisdiction` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  `name_region` varchar(45) NOT NULL,
  PRIMARY KEY (`name_country`,`id_tax_jurisdiction`),
  KEY `fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` (`id_tax_jurisdiction`),
  KEY `fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_countries_KEY_name_country` (`name_country`),
  CONSTRAINT `fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_KEY_id_tax_jurisdiction` FOREIGN KEY (`id_tax_jurisdiction`) REFERENCES `Table_tax_jurisdiction` (`id_tax_jurisdiction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_Tbl_tax_jdn_region_2_Tbl_tax_jdn_countries_KEY_name_country` FOREIGN KEY (`name_country`) REFERENCES `Table_tax_jurisdiction_countries` (`name_country`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_tax_jurisdiction_region`
--

LOCK TABLES `Table_tax_jurisdiction_region` WRITE;
/*!40000 ALTER TABLE `Table_tax_jurisdiction_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_tax_jurisdiction_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_tax_jurisdictions`
--

DROP TABLE IF EXISTS `Table_tax_jurisdictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_tax_jurisdictions` (
  `id_tax_jurisdiction` int(11) NOT NULL AUTO_INCREMENT,
  `name_tax_jurisdiction` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tax_jurisdiction`,`name_tax_jurisdiction`),
  UNIQUE KEY `id_tax_jurisdiction_UNIQUE` (`id_tax_jurisdiction`),
  KEY `fk_tax_juridisction_idx` (`id_tax_jurisdiction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_tax_jurisdictions`
--

LOCK TABLES `Table_tax_jurisdictions` WRITE;
/*!40000 ALTER TABLE `Table_tax_jurisdictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_tax_jurisdictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_tax_levies`
--

DROP TABLE IF EXISTS `Table_tax_levies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_tax_levies` (
  `id_tax_levies` int(11) NOT NULL AUTO_INCREMENT COMMENT 'way of tax levy => means',
  `tax_levy` int(11) NOT NULL COMMENT 'This is where, I either mark a lump sum or a rate.',
  `way_of_tax_levy` varchar(45) NOT NULL COMMENT 'way of tax levy => means',
  `start_of_tax_levy` varchar(45) NOT NULL,
  `currency` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tax_levies`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_tax_levies`
--

LOCK TABLES `Table_tax_levies` WRITE;
/*!40000 ALTER TABLE `Table_tax_levies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_tax_levies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_type_of_allowance`
--

DROP TABLE IF EXISTS `Table_type_of_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_type_of_allowance` (
  `id_type_of_allowance` int(11) NOT NULL,
  `types_of_allowance` varchar(45) DEFAULT NULL,
  `scope_of_allowance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_type_of_allowance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_type_of_allowance`
--

LOCK TABLES `Table_type_of_allowance` WRITE;
/*!40000 ALTER TABLE `Table_type_of_allowance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_type_of_allowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_type_of_economic_activity`
--

DROP TABLE IF EXISTS `Table_type_of_economic_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_type_of_economic_activity` (
  `id_type_of_economic_activity` int(11) NOT NULL,
  `type_of_economic_activity` varchar(45) NOT NULL,
  `type_of_economic_sector` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type_of_economic_activity`,`type_of_economic_activity`,`type_of_economic_sector`),
  UNIQUE KEY `id_type_of_economic_activity_UNIQUE` (`id_type_of_economic_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_type_of_economic_activity`
--

LOCK TABLES `Table_type_of_economic_activity` WRITE;
/*!40000 ALTER TABLE `Table_type_of_economic_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_type_of_economic_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_type_of_tax`
--

DROP TABLE IF EXISTS `Table_type_of_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Table_type_of_tax` (
  `id_type_of_tax` int(11) NOT NULL AUTO_INCREMENT,
  `types_of_taxes` varchar(45) NOT NULL,
  `scope_of_tax` varchar(45) NOT NULL COMMENT 'This is to ease the burden with Double Taxation Treaty (DTT).',
  `time_requirement` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type_of_tax`),
  KEY `fk_1_Tbl_type_of_tax_2_LUp_time_rqt_of_tax_KEY_time_requirements` (`time_requirement`),
  KEY `fk_1_Tbl_type_of_tax_2_LUp_scope_of_tax_KEY_scope_of_tax` (`scope_of_tax`),
  CONSTRAINT `fk_1_Tbl_type_of_tax_2_LUp_time_rqt_of_tax_KEY_time_requirements` FOREIGN KEY (`time_requirement`) REFERENCES `LookUp_time_requirement_of_tax` (`time_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_1_Tbl_type_of_tax_2_LUp_scope_of_tax_KEY_scope_of_tax` FOREIGN KEY (`scope_of_tax`) REFERENCES `LookUp_scope_of_tax` (`scope_of_tax`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_type_of_tax`
--

LOCK TABLES `Table_type_of_tax` WRITE;
/*!40000 ALTER TABLE `Table_type_of_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `Table_type_of_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_store_tax_calculation_personal_infos`
--

DROP TABLE IF EXISTS `table_store_tax_calculation_personal_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_store_tax_calculation_personal_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_calculation_personal_info` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_store_tax_calculation_personal_infos`
--

LOCK TABLES `table_store_tax_calculation_personal_infos` WRITE;
/*!40000 ALTER TABLE `table_store_tax_calculation_personal_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_store_tax_calculation_personal_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-04 21:11:04
